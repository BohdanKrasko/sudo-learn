# Task 03 submission — <your-github-username>

## Identity and defaults

- Linux distribution and version: Fedora Linux 42 (Xfce) x86_64
- Primary group: fedora
- Supplementary course group present: <!-- yes / explain problem --> ? 
- My `umask`: 0022

Explain the difference between a user, a primary group, and supplementary
groups:

- A user is an account identity that owns files and processes, identified by a UID. A primary group is the single group attached to that user — it's applied to new files they create. Supplementary groups are extra memberships that grant access to shared resources.

How does your `umask` affect newly created files and directories?

- umask is a per-process mask, not a permission. It removes bits from the mode a program requests at creation: files request 666, directories 777. With umask 022, files become 644 and directories 755. It only affects newly created files, never existing ones, and doesn't constrain chmod.

## Personal workspace

Complete this table with the permissions you verified:

| Path | Numeric mode | Owner/group (redacted if needed) | Why this mode is appropriate |
| --- | --- | --- | --- |
| `~/linux-permissions-lab/private` | 700 | fedora:fedora | Owner has full control; group/others blocked entirely |
| `~/linux-permissions-lab/private/note.txt` | 600 | fedora:fedora | Owner can read/write; no one else can access the file |
| `~/linux-permissions-lab/scripts` | 755 | fedora:fedora | Owner has full control; others can read and execute scripts (run them) but not modify |

What do `r`, `w`, and `x` mean for a regular file? What do they mean for a
directory?

- r - the permission to read, view the content of file
- w - the permission to change the content of file, modify; write
- x - the permission to to run, execute programs or scripts

Why can a readable file still be inaccessible because of a parent directory?

Because accessing a file requires execute permission on every directory in its path, not just read permission on the file itself

## Shared directory

- `/srv/sudo-learn-share` mode: 2770
- Owner/group: root:sudo-learn
- Group inherited by new entries: sudo-learn
- World-writable entries found: none

What does the leading `2` in `2770` do on this directory?

- It sets the setgid bit, so new files and subdirectories inherit the directory’s group, sudo-learn

Why is `chmod 777` not an appropriate fix for this shared directory?

- It would allow every local user to read, write, and access the directory, rather than limiting access to the owner and sudo-learn group

## Audit script

- Script ran as my normal user: yes
- Script used `sudo`: no
- All required paths were reported: yes
- Missing paths and command failures are clearly reported: yes

Give a short, redacted summary of the audit result. Do not paste your hostname,
personal username, or complete system account files.

- Audit ran as a normal user without sudo. /srv/sudo-learn-share is root:sudo-learn with mode 2770; access to its contents was denied. The lab directory results weren’t provided.

## Reflection

1. Why is it safer to grant access to a specific group than to make a directory
   writable by everyone?

   - Granting access to a specific group limits who can use or change the directory. Making it writable by everyone lets any local user modify its contents

2. Why should an audit script observe permissions but not silently change them?

   - Granting access to a specific group limits who can use or change the directory. Making it writable by everyone lets any local user modify its contents

## Checklist

- [X] `audit-permissions.sh` is included next to this file and is executable.
- [X] I tested private and shared access as my normal user.
- [X] I found no world-writable entries in the lab paths.
- [X] I did not commit usernames, hostnames, account databases, or secrets.
- [X] I changed only files inside my own Task 03 submission folder.
