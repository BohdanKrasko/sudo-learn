# sudo-learn

A hands-on IT learning playground for Linux, networking, Git, programming,
DevOps, cloud, and everything in between.

This repository is also our shared classroom workspace. You will complete each
task in your own subfolder, publish your work to GitHub, open a pull request,
and review work from other students.

## Before your first task

### 1. Create or reuse a GitHub account

Every student needs a personal GitHub account. If you already have one, use it;
you do not need to create another account.

1. Create a free account using the
   [official GitHub signup guide](https://docs.github.com/en/account-and-profile/how-tos/account-management/creating-an-account-on-github).
2. Verify your email address.
3. Enable two-factor authentication (2FA) to protect your account.
4. Send your GitHub username to the teacher or repository owner.
5. Wait until you are added as a repository collaborator, then accept the
   GitHub invitation. You need to do this before you can push a task branch.

Never commit passwords, access tokens, private keys, recovery codes, or other
secrets to this repository.

### 2. Install and configure Git

Install Git from the [official Git download page](https://git-scm.com/downloads),
then open a terminal and configure the name and email attached to your commits:

```bash
git config --global user.name "Your Name"
git config --global user.email "the-email-used-for-your-github-account@example.com"
git --version
```

The email stored in a commit can be public. You may use the private `noreply`
address shown in your GitHub email settings; see
[Setting your commit email address](https://docs.github.com/en/account-and-profile/how-tos/email-preferences/setting-your-commit-email-address).

On macOS, running `git --version` may offer to install Apple's command-line
developer tools. Follow the prompt, then run the command again.

Windows students should do this inside the Ubuntu VM they create in Task 01;
they do not also need to install Git on Windows. Task 01 includes the Ubuntu
installation command.

## How to complete every task

Each task has this structure:

```text
tasks/
└── NN-task-name/
    ├── README.md
    ├── TEMPLATE.md
    └── submissions/
        └── your-github-username/
            ├── README.md
            └── other-task-files
```

Your work must go only in your own folder:
`tasks/NN-task-name/submissions/<your-github-username>/`.

For every task:

1. Read the task's `README.md`, including its completion checklist.
2. Before your first task, send your GitHub username to the teacher or
   repository owner. Wait until you have been added as a collaborator and
   accept the GitHub invitation.
3. Clone this repository. Copy its HTTPS URL from the green **Code** button:

   ```bash
   git clone https://github.com/<repository-owner>/sudo-learn.git
   cd sudo-learn
   ```

4. Before starting each task, update your local `main` branch:

   ```bash
   git switch main
   git pull origin main
   ```

   Do not make changes or push commits directly to `main`.
5. Create a new branch. Use one branch per task:

   ```bash
   git switch -c <your-github-username>/task-NN
   ```

6. Create your personal submission folder, copy the task template into it, and
   complete the required work. For Task 01, for example:

   ```bash
   mkdir -p tasks/01-work-environment/submissions/<your-github-username>
   cp tasks/01-work-environment/TEMPLATE.md tasks/01-work-environment/submissions/<your-github-username>/README.md
   ```

7. Check, commit, and push your work:

   ```bash
   git status
   git add tasks/NN-task-name/submissions/<your-github-username>
   git commit -m "Complete task NN: <your-github-username>"
   git push -u origin <your-github-username>/task-NN
   ```

8. Open a pull request from your branch to this repository's `main` branch.
   Include your GitHub username, task number, what you completed, and anything
   you need help with. The
   [GitHub pull-request quickstart](https://docs.github.com/en/pull-requests/get-started/pull-request-quickstart)
   has screenshots and more detail.
9. Ask for a review and respond to any feedback by editing your files, making
   another commit, and pushing to the same branch.

Replace all values inside `<angle-brackets>` in the examples. Do not type the
angle brackets themselves.

## Review is required before merging

Do **not** merge your own pull request immediately. At least one other person
from the group must review the changes and submit an **Approve** review before
the pull request may be merged into `main`.

Any group member may perform the review; it does not have to be the teacher or
repository owner. Reviewers should check that the task requirements are met,
that the work is in the correct student folder, and that no secrets or unrelated
files were included. Use GitHub's
[pull-request review guide](https://docs.github.com/en/pull-requests/get-started/reviewing-pull-requests-quickstart)
if this is your first review.

If a review is taking too long, post the pull-request link in our Telegram space
and politely ask the group for a reviewer. After approval, merge the pull
request if you have permission; otherwise ask a repository maintainer to merge
it. Delete the task branch after the merge.

## Tasks

| Task | Topic | Status |
| --- | --- | --- |
| [01 — Prepare your work environment](tasks/01-work-environment/README.md) | GitHub account, Git, Ubuntu VM on Windows, or Terminal on macOS | Available |

## Getting help

First, reread the task and the linked resources. If you are still blocked, ask
in our Telegram space. Include the task number, your operating system, the step
that failed, and the exact error message. Do not share passwords or tokens.
