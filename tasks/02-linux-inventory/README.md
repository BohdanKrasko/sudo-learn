# Task 02 — Linux inventory with Bash and cron

## Goal

Install Visual Studio Code, check the available Gemini student offer, and build
a Linux inventory script that runs every five minutes as your normal user.
Investigate the purpose of every top-level directory present on your Linux
system.

Use a Linux installation with `cron` and `systemd` for the script and schedule.
Windows students can use the Ubuntu VM from Task 01. macOS students need an
Ubuntu VM or another Linux machine for this task; macOS `launchd` is not cron.
You may edit on your host computer, but run and verify the script on Linux.

## Part 1 — Install Visual Studio Code

Install [Visual Studio Code](https://code.visualstudio.com/download) where you
will edit this repository:

- **Ubuntu or Debian, including a Windows-hosted Ubuntu VM:** download the
  `.deb` package and install it with the graphical software installer, or run
  `sudo apt install ./<downloaded-file>.deb` from its download directory.
  Follow the [official Linux instructions](https://code.visualstudio.com/docs/setup/linux)
  if you use a different distribution.
- **macOS:** download the macOS `.dmg`, open it, and drag Visual Studio Code to
  **Applications**. Follow the
  [official macOS instructions](https://code.visualstudio.com/docs/setup/mac).

Open your `sudo-learn` folder in VS Code. Open its integrated terminal and run
`git status` to confirm that you are editing the intended clone. If you edit
on macOS, move or clone your work to Linux before testing the Linux parts.

## Part 2 — Check the Gemini student offer

Visit [Google One's student offer page](https://one.google.com/ai-student), sign
in with your personal Google Account if you choose to, and check the offer
shown for your region. If eligible and willing to accept the terms, use its
student verification flow to request the available extended trial or student
plan. Google may ask for a school email, student verification, and a payment
method; read the renewal price and date before accepting. Offers vary by
region, and the free 12-month Google AI Pro trial is currently US-only.

Record in your submission only **requested/activated**, **ineligible**, or
**skipped**, plus the plan name if one was offered. Do not share screenshots of
your account, school documents, payment details, or verification emails. No
purchase or personal-data disclosure is required to complete this task. See
[Google's current eligibility rules](https://support.google.com/googleone/answer/17422238).

## Part 3 — Investigate the Linux root directories

On the Linux machine where the script will run, inspect the directories
directly under `/`:

```bash
ls -la /
find / -mindepth 1 -maxdepth 1 -type d -printf '%p\n' 2>/dev/null
```

In your submission `README.md`, make a table with **every top-level directory
present on your machine** and explain its purpose in your own words. Include
directories reached through symlinks such as `/bin` or `/lib` if they appear in
`ls -la /`; mark them as symlinks and give their targets. Distinguish normal
storage from virtual filesystems such as `/proc` and `/sys`, and explain `/etc`,
`/var`, and `/var/log`. If your system has unusual directories, investigate
those too. Use `man hier`, the
[Linux hierarchy manual](https://man7.org/linux/man-pages/man7/hier.7.html),
and `ls -ld /<name>` as starting points.

## Part 4 — Write the inventory script

Create `inventory.sh` in your personal submission folder. It must:

1. Be a Bash script that runs without `sudo` or root privileges.
2. Create a **new timestamped file on each run** under
   `/var/logs/system-inventory/`. This is a dedicated course directory;
   `/var/log` is the usual Linux log directory, while `/var/logs` is a custom
   path for this exercise. Use a filename that cannot overwrite a previous run
   if the script runs twice in the same minute.
3. Record the time, hostname, and effective username in the file.
4. List system service definitions installed or configured under
   `/etc/systemd/system` and, if it exists, `/etc/init.d`. Show paths and
   identify symlinks where useful. Also include the output of
   `systemctl list-unit-files --type=service --no-pager` so a reader can compare
   local definitions with service unit files known to systemd. Explain in your
   README that `/etc/services` is a port-name database, not a list of installed
   services.
5. List the **currently mounted** filesystems with mount target, source, and
   filesystem type. `findmnt --list --noheadings --output TARGET,SOURCE,FSTYPE`
   is one option. Explain that `/etc/fstab` contains configuration and may not
   match what is mounted now.
6. Use absolute paths or set `PATH` explicitly so it works from cron's small
   environment. Quote variables, handle missing optional directories, and
   report command errors instead of silently making an apparently complete
   file.

Do not copy the contents of files under `/etc` into the report. Names and
service states are enough; configuration files can contain secrets.

## Part 5 — Grant narrow access and schedule it

Create only the required output directory with administrator privileges, then
give your normal Linux user ownership of that directory. Replace
`<your-linux-user>` with the output of `id -un`:

```bash
sudo install -d -m 0755 /var/logs
sudo install -d -m 0750 -o <your-linux-user> -g <your-linux-user> /var/logs/system-inventory
```

The script itself must not call `sudo`, change permissions, or run as root.
Keep the script in a directory your user can read and execute. On Ubuntu,
install and start cron if needed:

```bash
sudo apt update
sudo apt install cron
sudo systemctl enable --now cron
```

First run your script manually as your normal user and inspect the new report.
Then edit **your own** crontab with `crontab -e` and add one line using the
absolute path to your script, for example:

```cron
*/5 * * * * /bin/bash /home/<your-linux-user>/sudo-learn/tasks/02-linux-inventory/submissions/<your-github-username>/inventory.sh
```

Replace the example path with the real result of `realpath inventory.sh`.
Do not put a username field in this personal crontab entry. Verify with
`crontab -l`. Wait for two scheduled runs while Linux and cron remain running,
then check that two distinct new report files exist and show your normal user
as the effective username. A VM that is shut down does not run cron jobs.

## Part 6 — Submit your work

From the repository root, create your Task 02 branch and submission folder:

```bash
git switch main
git pull origin main
git switch -c <your-github-username>/task-02
mkdir -p tasks/02-linux-inventory/submissions/<your-github-username>
cp tasks/02-linux-inventory/TEMPLATE.md tasks/02-linux-inventory/submissions/<your-github-username>/README.md
```

Add `inventory.sh` and complete your copied `README.md`: root-directory table,
Gemini status, permission choices, exact cron line, and verification summary.
Include a **short redacted excerpt** from one report if useful. Do not commit
raw reports, account details, hostnames, usernames other than your GitHub
username, device identifiers, IP addresses, or secrets. Keep generated files
under `/var/logs/system-inventory/`, outside the repository.

Follow [How to complete every task](../../README.md#how-to-complete-every-task)
to commit, push, and open a pull request. Another group member must approve
the pull request before it is merged.

## Completion checklist

- [ ] VS Code is installed and the repository opens in it.
- [ ] I checked the Gemini student offer and recorded my status without private details.
- [ ] I explained every top-level directory present on my Linux machine.
- [ ] `inventory.sh` creates a new report with service definitions and mounted filesystems.
- [ ] The report directory is writable by my normal user without broad access to `/etc` or `/var`.
- [ ] My own crontab runs the script every five minutes; two scheduled runs created distinct files.
- [ ] My submission contains `README.md` and `inventory.sh`, with no raw logs or secrets.
- [ ] My Task 02 pull request has been opened for peer review.
