#!/usr/bin/env bash

set -u
set -o pipefail

PATH='/usr/bin:/bin:/usr/sbin:/sbin'
export PATH

OUTPUT_DIR='/var/logs/system-inventory'

if [[ ! -d "$OUTPUT_DIR" ]]; then
    printf 'ERROR: Required directory does not exist: %s\n' "$OUTPUT_DIR" >&2
    printf 'An administrator must create it and grant write permission to this user.\n' >&2
    exit 1
fi

if [[ ! -w "$OUTPUT_DIR" || ! -x "$OUTPUT_DIR" ]]; then
    printf 'ERROR: Directory is not writable/searchable: %s\n' "$OUTPUT_DIR" >&2
    printf 'An administrator must grant write permission to this user.\n' >&2
    exit 1
fi

TIMESTAMP="$(date '+%Y%m%dT%H%M%S%N')"

if ! REPORT_FILE="$(mktemp -- "${OUTPUT_DIR}/inventory-${TIMESTAMP}-XXXXXX.txt")"; then
    printf 'ERROR: Could not create a report in %s\n' "$OUTPUT_DIR" >&2
    exit 1
fi

run_command() {
    local description="$1"
    shift
    local status

    printf '\n[%s]\n' "$description" >> "$REPORT_FILE"

    if "$@" >> "$REPORT_FILE" 2>&1; then
        printf 'Command completed successfully.\n' >> "$REPORT_FILE"
    else
        status=$?
        printf 'ERROR: command failed with exit status %s: %s\n' \
            "$status" "$*" >> "$REPORT_FILE"
    fi
}

{
    printf 'System Inventory Report\n'
    printf 'Report file: %s\n' "$REPORT_FILE"
    printf 'Time: '
} >> "$REPORT_FILE"

date '+%Y-%m-%d %H:%M:%S %Z' >> "$REPORT_FILE" 2>&1 || \
    printf 'ERROR: unable to determine time\n' >> "$REPORT_FILE"

printf 'Hostname: ' >> "$REPORT_FILE"
hostname >> "$REPORT_FILE" 2>&1 || \
    printf 'ERROR: unable to determine hostname\n' >> "$REPORT_FILE"

printf 'Effective username: ' >> "$REPORT_FILE"
id -un >> "$REPORT_FILE" 2>&1 || \
    printf 'ERROR: unable to determine effective username\n' >> "$REPORT_FILE"

printf '\n=== Definitions Under /etc/systemd/system ===\n' >> "$REPORT_FILE"
if [[ -d /etc/systemd/system ]]; then
    find /etc/systemd/system -mindepth 1 -maxdepth 1 \
        -printf '%p%l\n' >> "$REPORT_FILE" 2>&1 || \
        printf 'ERROR: unable to list directory\n' >> "$REPORT_FILE"
else
    printf 'Directory does not exist.\n' >> "$REPORT_FILE"
fi

printf '\n=== Definitions Under /etc/init.d ===\n' >> "$REPORT_FILE"
if [[ -d /etc/init.d ]]; then
    find /etc/init.d -mindepth 1 -maxdepth 1 \
        -printf '%p%l\n' >> "$REPORT_FILE" 2>&1 || \
        printf 'ERROR: unable to list directory\n' >> "$REPORT_FILE"
else
    printf 'Directory does not exist.\n' >> "$REPORT_FILE"
fi

run_command \
    'Service unit files known to systemd' \
    systemctl list-unit-files --type=service --no-pager

run_command \
    'Currently mounted filesystems: TARGET SOURCE FSTYPE' \
    findmnt --list --noheadings --output TARGET,SOURCE,FSTYPE

printf 'Report created: %s\n' "$REPORT_FILE" >&2
