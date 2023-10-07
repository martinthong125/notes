# Git and Gitlab

## .gitignore file

Before working on your project, create the .gitignore file first!

.gitignore file - add folders/files inside that you don't want git to track in the repo

https://github.com/martinthong125/notes/blob/main/gitignore.md

## Git Workflow for collaborative work

Create a branch to develop your feature

Commit regularly for sub feature

Before merging branch to main, you may want to do a squash commit, ie combine a few commits to one.

Do a git pull from main branch

Do a rebase from main at branch.

Do a git push

Do a merge (request) in browser

Extracted from:

https://www.youtube.com/watch?v=4lxvVj7wlZw

## Detailed workflow commands on how to commit feature to main - non-collaborative

1. git checkout -b feature
2. Work on feature branch, after many commits, the feature is completed
3. To merge feature branch to main branch with one new commit in feature branch
   1. git checkout feature
   2. git rebase -i HEAD~n # changing n commits in feature branch to n
   3. Leave first line as pick and change the rest to squash
   4. Type in new commit message
   5. git pull main
   6. git rebase main # pull new commits from main and put feature commits above it
   7. git checkout main
   8. git rebase feature # get a one line commit main

## How to do a squash commit

1. Run the command to do an interactive rebase where n is the number of commits:
   '''
   git rebase -i HEAD~n
   '''
2. Leave the pick on the first line and replace pick with squash on the other lines.
3. Rewrite commit message
4. git push -f (optional)

## Git config

Setup your global name and email

git global --user.name "\<name\>"

git global --user.email "\<email\>"

Setup ssh connection with ssh-keygen

## Git must know commands

git init

git clone \<url\>

git status

git add . / \<filename\>

git reset HEAD \<filename\>

git commit -m "message"

git branch \<new branch name\>

git checkout \<branch name\>

git merge \<branch\>

git rebase \<branch\>

git fetch

git pull origin main / branch

git push origin main / branch

git remote -v

git push origin --delete <branch_name>

## git clone sub-directory only

git init

git remote add origin \<YourRepoUrl\>

git config core.sparseCheckout true

git sparse-checkout set \<YourSubfolderName\>

git pull origin <YourBranchName>

## Merge or rebase?

Never work on main branch

Create a branch to work on your feature

After finishing your feature, do a rebase and then merge to main

Only rebase your own feature branch, never the main branch or branch that you share code with

## What is a pull/merge request?

When you are working in a team and want to merge your code to main branch but there is a pipeline of testing to be done. After that, there needs to be approvals of your merge.

## Show what are the folders that are different between 2 branches

### between 2 local branches

`git diff --name-only main sandbox`

### between 2 remote branches

`git diff --name-only origin/main origin/sandbox`

## Copy a folder from sandbox branch to main branch

### From the main branch, checkout the folder in the sandbox branch. Add the folder to staging and commit the changes.

1. Checkout the main branch

`git checkout main`

2. Copy <job-folder> from sandbox branch to main branch

`git checkout sandbox -- <job-folder>`

3. Add <job-folder> to staging

`git add <job-folder>`

4. Commit the changes

`git commit -m "add <job-folder>"`

## Perform a pull request for a new folder in sandbox

### We will first pull all the changes from upstream main branch. Then we create a new branch feature1 from main with nothing in it. Then we checkout the folder we want from sandbox. Next, we add the folder to staging and commit the changes. Then we push feature1 branch to upstream. Next, go to gitlab repo and do a pull request. Merge the request after review.

1. Pull all changes from upstream

`git pull upstream main`

2. Checkout the feature1 branch from main with no files inside

`git checkout --orphan feature1`

3. Copy <job-folder> from sandbox branch to feature1 branch

`git checkout sandbox -- <job-folder>`

4. Add <job-folder> to staging

`git add .`

5. Commit the changes

`git commit -m “add <job-folder>“`

6. Push feature1 branch to remote

`git push --set-upstream origin feature1`

7. Go to gitlab repo and do a pull request.

8. Select feature1 branch to merge to main.

9. Review and submit changes.

10. Merge the request.

## View all branches in repo

`git branch -a`

## Delete a feature-branch

### delete a local branch

`git branch -d <feature-branch>`

### delete a remote branch

`git push origin --delete <feature-branch>`

### delete a remote tracking branch

`git fetch origin --prune`

## Reset to the beginning of the last commit

`git reset --hard HEAD`

## Remove the last 1 commit, changes intact

`git reset --soft HEAD~1`

## Remove the last 1 commit, changes drop

`git reset --hard HEAD~1`

--soft: This option moves the branch pointer to the specified commit, effectively removing the commits after that point from the branch history. However, the changes introduced in those commits are preserved in your working directory as uncommitted changes. You can then modify these changes and create a new commit if desired.

--mixed (default behavior): When no option is provided, git reset behaves as if --mixed is used. This option moves the branch pointer to the specified commit, removing the commits after that point from the branch history. In addition, the changes introduced in those commits are removed from the index, but they remain in your working directory as modified files. You can choose to discard or modify these changes as needed before creating a new commit.

--hard: This option moves the branch pointer to the specified commit, removing the commits after that point from the branch history. Additionally, the changes introduced in those commits are discarded completely. Your working directory will be updated to match the state of the specified commit, and any uncommitted changes will be permanently lost.

## Remove all files from staging

`git reset`

## Create a new branch with no files inside

### create the branch new_branch

`git checkout --orphan new_branch`

### clear the working directory and staging area

`git rm -rf .`

### Make initial commit

`git commit -m "Initial empty commit"`

## Discard changes to a file

`git checkout -- <file_path>`

## Discard all changes

`git checkout -- .`

## Gitlab

Add ssh keys to gitlab

Add VS code extension for gitlab

Setup access token for VS code
