# Task 03 — Secure Linux file sharing with users, groups, and permissions

## Goal

Learn how Linux decides who may read, modify, or execute a file. Build a
private workspace and a group-shared directory, then write a small audit script
that explains their ownership and permissions.

Use a Linux installation for this task. Windows students can use the Ubuntu VM
from Task 01. macOS students need an Ubuntu VM or another Linux machine because
Linux user and group administration differs from macOS.

## Part 1 — Investigate your identity and default permissions

Run these commands as your normal user:

```bash
id
id -un
id -gn
groups
umask
```

Use `getent passwd "$(id -un)"` and `getent group "$(id -gn)"` to inspect only
your own account and primary group. Do not commit the complete `/etc/passwd`,
`/etc/group`, or `/etc/shadow` files. `/etc/shadow` contains password hashes
and must not be read or shared.

In your submission, explain the difference between a user, a primary group,
and supplementary groups. Also explain how your `umask` changes the default
permissions requested by a program.

## Part 2 — Create and protect a personal workspace

Create a small lab in your home directory:

```bash
mkdir -p ~/linux-permissions-lab/{private,scripts}
printf '%s\n' 'private practice note' > ~/linux-permissions-lab/private/note.txt
chmod 700 ~/linux-permissions-lab/private
chmod 600 ~/linux-permissions-lab/private/note.txt
chmod 750 ~/linux-permissions-lab/scripts
```

Inspect the result with both `ls` and `stat`:

```bash
ls -ld ~/linux-permissions-lab ~/linux-permissions-lab/private
ls -l ~/linux-permissions-lab/private/note.txt
stat -c '%A %a %U:%G %n' ~/linux-permissions-lab/private ~/linux-permissions-lab/private/note.txt
namei -l ~/linux-permissions-lab/private/note.txt
```

In your own words, explain what read, write, and execute permission mean for a
regular file and for a directory. Explain why access to a file can fail even
when the file itself is readable if one of its parent directories is not
searchable.

## Part 3 — Build a group-shared directory

Create one course group and add your normal account to it. Save your username
before running the administrator commands:

```bash
student_user="$(id -un)"
sudo groupadd --force sudo-learn
sudo usermod -aG sudo-learn "$student_user"
```

Log out of Linux completely and sign in again so the new group membership is
applied. Confirm that `sudo-learn` appears in the output of `id` before
continuing. Do not replace `-aG` with `-G`: omitting `-a` can remove the user
from existing supplementary groups.

Create the shared directory with root as owner, `sudo-learn` as group, and the
setgid bit enabled:

```bash
sudo install -d -o root -g sudo-learn -m 2770 /srv/sudo-learn-share
```

Now return to normal-user commands:

```bash
printf '%s\n' 'shared practice note' > /srv/sudo-learn-share/shared-note.txt
mkdir /srv/sudo-learn-share/team-directory
ls -ld /srv/sudo-learn-share /srv/sudo-learn-share/team-directory
ls -l /srv/sudo-learn-share/shared-note.txt
stat -c '%A %a %U:%G %n' /srv/sudo-learn-share /srv/sudo-learn-share/shared-note.txt
```

The new entries should inherit the `sudo-learn` group. Record what you observe
and explain the leading `2` in mode `2770`. Do not solve access problems with
`chmod 777`; it gives every local user write access and does not express the
intended group-only policy.

## Part 4 — Write a permission audit script

Create `audit-permissions.sh` in your personal submission folder. It must:

1. Be a Bash script that runs as your normal user and does not call `sudo`.
2. Print the current time, effective user, groups, and `umask`.
3. Inspect `~/linux-permissions-lab`, its `private` and `scripts` directories,
   and `/srv/sudo-learn-share` using `ls -ld` and `stat`.
4. Inspect the parent path components of the private note and shared directory
   with `namei -l`.
5. Clearly report a missing path or failed command rather than silently
   producing an incomplete audit.
6. Quote variables and either use absolute command paths or set a safe `PATH`.
7. Make no ownership or permission changes. An audit script observes state; it
   does not repair it.

Make the script executable and run it without administrator privileges:

```bash
chmod 750 tasks/03-linux-permissions/submissions/<your-github-username>/audit-permissions.sh
tasks/03-linux-permissions/submissions/<your-github-username>/audit-permissions.sh
```

## Part 5 — Verify least privilege

Verify each rule rather than relying only on the commands you entered:

```bash
test -r ~/linux-permissions-lab/private/note.txt && echo 'private note is readable by its owner'
test -w /srv/sudo-learn-share && echo 'shared directory is writable through group membership'
find ~/linux-permissions-lab /srv/sudo-learn-share -maxdepth 2 -perm -0002 -print
```

The final `find` command searches for entries writable by everyone. It should
print nothing. Inspect your audit output and include only a short, redacted
summary in the submission README. Do not commit usernames, hostnames, or other
personal system details.

## Part 6 — Submit your work

From the repository root, create your Task 03 branch and submission folder:

```bash
git switch main
git pull origin main
git switch -c <your-github-username>/task-03
mkdir -p tasks/03-linux-permissions/submissions/<your-github-username>
cp tasks/03-linux-permissions/TEMPLATE.md tasks/03-linux-permissions/submissions/<your-github-username>/README.md
```

Add `audit-permissions.sh` and complete your copied `README.md`. Describe the
permissions you observed and the reasoning behind them; do not paste sensitive
account databases or unredacted command output.

Follow [How to complete every task](../../README.md#how-to-complete-every-task)
to commit, push, and open a pull request. Another group member must approve the
pull request before it is merged.

## Completion checklist

- [ ] I identified my user, primary group, supplementary groups, and `umask`.
- [ ] My private directory and note use restrictive permissions.
- [ ] `/srv/sudo-learn-share` is group-writable, not world-writable, and has setgid enabled.
- [ ] New shared entries inherit the `sudo-learn` group.
- [ ] `audit-permissions.sh` reports identity and permission evidence without using `sudo`.
- [ ] I explained file permissions, directory permissions, setgid, and why `777` is unsafe.
- [ ] My submission contains only `README.md` and `audit-permissions.sh`, with no private data.
- [ ] My Task 03 pull request has been opened for peer review.

## Useful resources

- Run `man chmod`, `man chown`, `man umask`, `man stat`, and `man namei` on Linux.
- [Ubuntu: User management](https://ubuntu.com/server/docs/how-to/security/user-management/)
- [GNU Coreutils: File permissions](https://www.gnu.org/software/coreutils/manual/html_node/File-permissions.html)
