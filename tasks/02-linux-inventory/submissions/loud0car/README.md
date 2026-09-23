# Task 02 submission — loud0car

## Setup

- Linux distribution and version: Fedora Linux 42
- VS Code installed and repository opened: yes
- Gemini student offer status: skipped

## Root-directory investigation

Add a row for every top-level directory or symlink shown by `ls -la /` on your
Linux machine. Remove example placeholders. Explain each purpose in your own
words and identify any symlink target.

| Path     | Directory or symlink/target | Purpose                                                  |
| ---      | ---                         | ---                                                      |
| `/etc`   |                             | <!-- Your explanation -->                                |
| `/var`   |                             | <!-- Your explanation -->                                |
| `/bin`   | symlink                     | bin is folder with your most basic binaries, programs    |
| `/sbin`  | symlink                     | system binaries which only sys admin could use           |
| `/boot`  | directory                   | place where bootloader lives                             |
| `/dev`   | directory                   | place where you can find your hardware                   |
| `/etc`   | directory                   | place where your system wide configurations are stored   |
| `/lib`   | symlink                     | home to libraries. files which apps use to perform tasks |
| `/lib64` | symlink                     | essentially same as lib                                  |
| `/media` | directory                   | removable media devices like flash drives, etc           |
| `/mnt`   | directory                   | directory for mounted drives and filesystems             |
| `/opt`   | directory                   | manually installed software from vendors resides here    |
| `/proc`  | directory                   | information about system processes and resources         |
| `/root`  | directory                   | users home folder which requires root permissons         |
| `/run`   | directory                   | processes which is run on RAM                            |
| `/srv`   | directory                   | files accessible to other users                          |
| `/sys`   | directory                   | the kernel directory                                     |
| `/tmp`   | directory                   | temporaly stored files by aplications                    |
| `/usr`   | directory                   | user aplication space where apps installed used by user  |
| `/var`   | directory                   | variable directory which contains files expected to grow |
| `/home`  | directory                   | contains user home directory                             |

What is the difference between `/var/log` and this task's `/var/logs/system-inventory/`?

   /var/log stores general system logs, while /var/logs/system-inventory/ is a separate, task-specific directory for system-inventory files

What is the difference between `/etc/services`, service files under
`/etc/systemd/system`, and currently running services?

   /etc/services defines network ports, /etc/systemd/system defines how services run

## Script and permissions

- My script path: 

   ./inventory.sh

- Report directory owner and permissions: 

   drwxr-x---. 1 fedora fedora 450 Sep 23 12:15 /var/logs/system-inventory

- Why can the script run without root? 

   Because it only reads system information and writes to a user-writable report directory so it generaly does not need root privileges 

- How does the script avoid overwriting reports?

   It creates time stamped files which result in uniqe file names each time

## Cron verification

Paste your personal crontab line here, with private path segments redacted if
needed:

```cron
*/5 * * * * /bin/bash /home/fedora/Documents/sudo-learn/tasks/02-linux-inventory/submissions/loud0car/inventory.sh
```

- Manual run result: success
- First scheduled report time: 20260923T114124372662420
- Second scheduled report time: 20260923T120000442690210
- Effective user shown in both reports: fedora
- Service and mount sections present in both reports: yes

## Reflection

1. Why might `/etc/fstab` differ from the output of `findmnt`?

   /etc/fstab lists configured filesystems intended to be mounted, while findmnt shows filesystems currently mounted

2. What would happen to scheduled runs while your VM is powered off?

   They would not run

## Checklist

- [x] `inventory.sh` is included next to this file.
- [x] I tested the script manually and observed two cron-created reports.
- [x] I did not commit raw reports, secrets, payment details, or verification documents.
- [x] I changed only files inside my own Task 02 submission folder.

