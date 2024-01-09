# git commands

- `git reset`: unstage changes
- `git remote -v`: show remote URL
- `git clean -xfd`: clean out all files that are not in the repo
- `git fetch origin --prune`: update local list of remote branches
- `git stash`/`git stash pop`: put your changes temporarely aside
- `git config --global alias.lg 'log --oneline -10'`: configure alias

## branch
- `git branch -r`: show remote branches
- `git branch -a --contains <commit>`: find remote branch which contains this commit

## log & history
- `git log --oneline <branch_A>..<branch_B>`: compare commits on two branches
- `git diff --stat --color <branch_A>..<branch_B>`: changed files on two branches
- `git diff <commit_hash> --name-only`: only show filenames of modified files
- `git difftool <branch1> <branch3> -- <file>`: compare file between 2 branches

## pushing
- `git push -u origin <branch_name>`: new local branch to remote
- `git push <remote> <remote>/<old_name>:refs/heads/<new_name> :<old_name>`: rename remote only branch
- `git push origin --delete <branch_name>`: delete remote branch
- `git push --mirror https:// <remote_url> / <remote_repo>.git`: Copy existing repo from local to new remote

## submodules
- `git submodule update`: update all submodules to respective version
- `git submodule foreach git status`: check status of all submodules
- `git submodule update --init –recursive`: update and init all submodules (first checkout)
