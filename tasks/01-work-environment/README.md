# Task 01 — Prepare your work environment

## Goal

Prepare a command-line environment for the course and use the complete GitHub
workflow for the first time.

- **Windows students:** install Ubuntu Desktop as a virtual machine (VM).
- **macOS students:** use macOS and its built-in Terminal application. You do
  not need to install Ubuntu for this task.
- **Linux students:** use your existing Linux installation.

## Part 1 — Prepare GitHub

Complete the GitHub account steps in the
[repository prerequisites](../../README.md#before-your-first-task):

- create or reuse a GitHub account;
- verify its email address;
- enable 2FA;
- share your GitHub username with the teacher or repository owner; and
- accept the GitHub invitation after you are added as a collaborator.

## Part 2 — Prepare your operating system

Follow the section for your computer.

### Windows: install an Ubuntu virtual machine

A VM runs Ubuntu in a window and does not replace or erase Windows.

1. Confirm that hardware virtualization is enabled. If VirtualBox reports that
   virtualization is unavailable, ask the teacher before changing BIOS/UEFI
   settings.
2. Download the current Ubuntu Desktop LTS image from the
   [official Ubuntu download page](https://ubuntu.com/download/desktop).
3. Download and install VirtualBox from the
   [official VirtualBox download page](https://www.virtualbox.org/wiki/Downloads).
4. Follow Canonical's
   [Ubuntu Desktop VM with VirtualBox tutorial](https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox).
   Use the tutorial's recommended resources when your computer supports them.
   Do not reuse the tutorial's example password.
5. Start the VM, sign in, open Terminal, and update the package list:

   ```bash
   sudo apt update
   ```

6. Install Git inside Ubuntu if it is not already available:

   ```bash
   sudo apt install git
   ```

Keep the VM for later tasks. Shut Ubuntu down normally rather than forcing the
VM window closed.

### macOS: use Terminal

1. Open **Terminal** from **Applications > Utilities**, or find it with
   Spotlight. Apple's [Terminal User Guide](https://support.apple.com/guide/terminal/welcome/mac)
   introduces the application.
2. Run `git --version`. If macOS asks to install command-line developer tools,
   accept the installation and then run the command again.
3. Continue to Part 3 in the same Terminal window.

### Existing Linux installation

Open a terminal and run `git --version`. If Git is missing, install it using
your distribution's package manager, then continue to Part 3.

## Part 3 — Configure Git and clone the repository

In your Ubuntu, macOS, or Linux terminal, configure Git using the name and email
attached to your GitHub account:

```bash
git config --global user.name "Your Name"
git config --global user.email "the-email-used-for-your-github-account@example.com"
git --version
```

You may use GitHub's private `noreply` address instead of exposing a personal
email address. Follow GitHub's
[commit email guide](https://docs.github.com/en/account-and-profile/how-tos/email-preferences/setting-your-commit-email-address).

After accepting the repository invitation, open this repository on GitHub,
click the green **Code** button, copy its HTTPS URL, and clone it in the same
learning environment. Replace `<repository-owner>` with the account or
organization shown in the repository URL:

```bash
git clone https://github.com/<repository-owner>/sudo-learn.git
cd sudo-learn
```

## Part 4 — Record evidence

From the root of your cloned `sudo-learn` repository, create your submission
folder and copy the template. Replace `<your-github-username>` with your actual
username:

```bash
git switch -c <your-github-username>/task-01
mkdir -p tasks/01-work-environment/submissions/<your-github-username>
cp tasks/01-work-environment/TEMPLATE.md tasks/01-work-environment/submissions/<your-github-username>/README.md
```

Create `environment.txt` inside your personal submission folder.

On Ubuntu or another Linux distribution, run:

```bash
uname -a > tasks/01-work-environment/submissions/<your-github-username>/environment.txt
cat /etc/os-release >> tasks/01-work-environment/submissions/<your-github-username>/environment.txt
git --version >> tasks/01-work-environment/submissions/<your-github-username>/environment.txt
```

On macOS, run:

```bash
sw_vers > tasks/01-work-environment/submissions/<your-github-username>/environment.txt
uname -a >> tasks/01-work-environment/submissions/<your-github-username>/environment.txt
git --version >> tasks/01-work-environment/submissions/<your-github-username>/environment.txt
```

Open your copied `README.md`, replace every placeholder, answer the reflection
questions, and mark only the checklist items you actually completed.

Before committing, read `environment.txt`. Computer names can sometimes reveal
personal information; replace such a name with `[hidden]`. Do not include your
password, email address, tokens, IP addresses, or other secrets. A screenshot is
not required.

## Part 5 — Submit and get a peer review

Follow [How to complete every task](../../README.md#how-to-complete-every-task)
to commit your two files, push your branch, and open a pull request.

Your pull request cannot be merged until **another group member** reviews it and
submits an **Approve** review. Any group member can review it. If you need a
faster review, share the pull-request link in our Telegram space and ask for a
reviewer.

## Completion checklist

- [ ] GitHub account exists and its email is verified.
- [ ] GitHub username was shared and the repository invitation was accepted.
- [ ] Git is installed and configured.
- [ ] Required environment is ready: Ubuntu VM on Windows, Terminal on macOS,
      or an existing Linux installation.
- [ ] `environment.txt` contains the requested command output and no secrets.
- [ ] Personal `README.md` is complete.
- [ ] Work is committed and pushed on a Task 01 branch.
- [ ] A pull request to `main` is open.
- [ ] Another group member has approved the pull request before merge.

## Useful resources

- [Getting started with a GitHub account](https://docs.github.com/en/get-started/onboarding/getting-started-with-your-github-account)
- [GitHub's introduction to Git](https://docs.github.com/en/get-started/using-git/about-git)
- [Download Ubuntu Desktop](https://ubuntu.com/download/desktop)
- [Run Ubuntu Desktop in VirtualBox](https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox)
- [Apple Terminal User Guide](https://support.apple.com/guide/terminal/welcome/mac)
