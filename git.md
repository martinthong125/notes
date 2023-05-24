# Git and Gitlab

## Workflow

Create a branch to develop your feature

Commit regularly for sub feature

Before merging branch to main, you may want to do a squash commit, ie combine a few commits to one.

Do a rebase from main at branch.

Do a merge (request)

Extracted from:

https://www.youtube.com/watch?v=4lxvVj7wlZw

## Detailed workflow commands on how to commit feature to main

1. git checkout -b feature
2. Work on feature branch, after many commits, completed the feature
3. To merge feature branch to main branch with one new commit, in feature branch
   1. git rebase -i main # changing commits in feature branch
   2. Leave first line as pick and change the rest to squash
   3. Type in new commit message
   4. git rebase main # pull new commits from main and put feature commits above it
   5. git checkout main
   6. git merge feature # get a one line commit main

## How to do a squash commit

1. Run the command to do an interactive rebase where n is the number of commits:
'''
git rebase -i HEAD~n
'''
2. Leave the pick on the first line and replace pick with squash on the other lines.
3. Rewrite commit message
4. git push -f (optional)

## Git

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

.gitignore file - add folders/files inside that you don't want git to track in the repo

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

## What is a merge request?

When you are working in a team and want to merge your code to main branch but there is a pipeline of testing to be done. After that, there needs to be approvals of your merge.

## Gitlab

Add ssh keys to gitlab

Add VS code extension for gitlab

Setup access token for VS code
