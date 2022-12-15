# Git and Gitlab

## Workflow

Create a branch to develop your feature

Commit regularly for sub feature

Before merging branch to main, do a rebase from main at branch.

Do a merge (request)

Extracted from:

https://www.youtube.com/watch?v=4lxvVj7wlZw

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

git rest HEAD \<filename\>

git commit -m "message"

git branch \<new branch name\>

git checkout \<branch name\>

git merge \<branch\>

git rebase \<branch\>

git fetch

git pull origin main / branch

git push origin main / branch

git remote -v

.gitignore file - add folders/files inside that you don't want git to track in the repo

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
