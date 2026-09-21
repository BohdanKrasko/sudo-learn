# Task 02 submission — <your-github-username>

## Setup

- Linux distribution and version: <!-- e.g. Ubuntu 24.04 -->
- VS Code installed and repository opened: <!-- yes / explain problem -->
- Gemini student offer status: <!-- requested/activated, ineligible, or skipped; plan name if shown -->

## Root-directory investigation

Add a row for every top-level directory or symlink shown by `ls -la /` on your
Linux machine. Remove example placeholders. Explain each purpose in your own
words and identify any symlink target.

| Path | Directory or symlink/target | Purpose |
| --- | --- | --- |
| `/etc` | Directory | <!-- Your explanation --> |
| `/var` | Directory | <!-- Your explanation --> |

What is the difference between `/var/log` and this task's `/var/logs/system-inventory/`?

<!-- Your answer -->

What is the difference between `/etc/services`, service files under
`/etc/systemd/system`, and currently running services?

<!-- Your answer -->

## Script and permissions

- My script path: <!-- path inside this submission folder -->
- Report directory owner and permissions: <!-- e.g. user:group, 0750 -->
- Why can the script run without root? <!-- Your answer -->
- How does the script avoid overwriting reports? <!-- Your answer -->

## Cron verification

Paste your personal crontab line here, with private path segments redacted if
needed:

```cron
<!-- */5 ... -->
```

- Manual run result: <!-- success / error and fix -->
- First scheduled report time: <!-- timestamp only -->
- Second scheduled report time: <!-- timestamp only -->
- Effective user shown in both reports: <!-- say "normal user" if name is private -->
- Service and mount sections present in both reports: <!-- yes / explain -->

## Reflection

1. Why might `/etc/fstab` differ from the output of `findmnt`?

   <!-- Your answer -->

2. What would happen to scheduled runs while your VM is powered off?

   <!-- Your answer -->

## Checklist

- [ ] `inventory.sh` is included next to this file.
- [ ] I tested the script manually and observed two cron-created reports.
- [ ] I did not commit raw reports, secrets, payment details, or verification documents.
- [ ] I changed only files inside my own Task 02 submission folder.
