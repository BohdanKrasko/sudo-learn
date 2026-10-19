#!/usr/bin/env bash
# Read-only permissions audit. Does not use sudo or change files.
PATH=/usr/bin:/bin
export PATH

lab_dir="$HOME/linux-permissions-lab"
private_dir="$lab_dir/private"
scripts_dir="$lab_dir/scripts"
private_note="$private_dir/note.txt"
shared_dir="/srv/sudo-learn-share"

run() {
    printf '\n$'
    printf ' %q' "$@"
    printf '\n'
    "$@"
    status=$?
    if (( status != 0 )); then
        printf 'FAILED (exit status %d)\n' "$status" >&2
    fi
}

inspect_path() {
    path=$1
    if [[ ! -e "$path" ]]; then
        printf '\nMISSING: %s\n' "$path" >&2
        return
    fi
    run /usr/bin/ls -ld -- "$path"
    run /usr/bin/stat -- "$path"
}

printf 'Time: '
/usr/bin/date
printf 'Effective user: '
/usr/bin/id -un
printf 'Groups: '
/usr/bin/id -Gn
printf 'umask: '
/usr/bin/umask

printf '\n--- Directories ---\n'
inspect_path "$lab_dir"
inspect_path "$private_dir"
inspect_path "$scripts_dir"
inspect_path "$shared_dir"

printf '\n--- Private note path components ---\n'
if [[ -e "$private_note" ]]; then
    run /usr/bin/namei -l -- "$private_note"
else
    printf 'MISSING: %s (change private_note in the script if your note has a different name)\n' \
        "$private_note" >&2
fi

printf '\n--- Shared directory path components ---\n'
if [[ -e "$shared_dir" ]]; then
    run /usr/bin/namei -l -- "$shared_dir"
else
    printf 'MISSING: %s\n' "$shared_dir" >&2
fi
