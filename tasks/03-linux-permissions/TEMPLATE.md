# Task 03 submission — <your-github-username>

## Identity and defaults

- Linux distribution and version: <!-- e.g. Ubuntu 24.04 -->
- Primary group: <!-- redact a personal group name if needed -->
- Supplementary course group present: <!-- yes / explain problem -->
- My `umask`: <!-- value -->

Explain the difference between a user, a primary group, and supplementary
groups:

<!-- Your answer -->

How does your `umask` affect newly created files and directories?

<!-- Your answer -->

## Personal workspace

Complete this table with the permissions you verified:

| Path | Numeric mode | Owner/group (redacted if needed) | Why this mode is appropriate |
| --- | --- | --- | --- |
| `~/linux-permissions-lab/private` | <!-- mode --> | <!-- owner:group --> | <!-- explanation --> |
| `~/linux-permissions-lab/private/note.txt` | <!-- mode --> | <!-- owner:group --> | <!-- explanation --> |
| `~/linux-permissions-lab/scripts` | <!-- mode --> | <!-- owner:group --> | <!-- explanation --> |

What do `r`, `w`, and `x` mean for a regular file? What do they mean for a
directory?

<!-- Your answer -->

Why can a readable file still be inaccessible because of a parent directory?

<!-- Your answer -->

## Shared directory

- `/srv/sudo-learn-share` mode: <!-- expected: 2770 -->
- Owner/group: <!-- expected: root:sudo-learn -->
- Group inherited by new entries: <!-- observed group -->
- World-writable entries found: <!-- expected: none -->

What does the leading `2` in `2770` do on this directory?

<!-- Your answer -->

Why is `chmod 777` not an appropriate fix for this shared directory?

<!-- Your answer -->

## Audit script

- Script ran as my normal user: <!-- yes / explain problem -->
- Script used `sudo`: <!-- expected: no -->
- All required paths were reported: <!-- yes / explain -->
- Missing paths and command failures are clearly reported: <!-- yes / explain -->

Give a short, redacted summary of the audit result. Do not paste your hostname,
personal username, or complete system account files.

<!-- Your summary -->

## Reflection

1. Why is it safer to grant access to a specific group than to make a directory
   writable by everyone?

   <!-- Your answer -->

2. Why should an audit script observe permissions but not silently change them?

   <!-- Your answer -->

## Checklist

- [ ] `audit-permissions.sh` is included next to this file and is executable.
- [ ] I tested private and shared access as my normal user.
- [ ] I found no world-writable entries in the lab paths.
- [ ] I did not commit usernames, hostnames, account databases, or secrets.
- [ ] I changed only files inside my own Task 03 submission folder.
