# git commands
- `git reset`: unstage changes
- `git reset --hard`: discard all unstaged changes
- `git reset --hard HEAD~1`: undo one commit
- `git remote -v`: show remote URL
- `git clean -xfd`: clean out all files that are not in the repo
- `git fetch origin --prune`: update local list of remote branches
- `git stash`/`git stash pop`: put your changes temporarely aside
- `git config --global alias.lg 'log --oneline -10'`: configure alias
- `git commit --amend --no-edit`: amend to previous commit without changing commit message
- `git update-index --chmod=+x <file>`: update file permissions

## branch
- `git branch -r`: show remote branches
- `git branch -a --contains <commit>`: find remote branch which contains this commit
- `git branch -r | grep -v '\->' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | while read remote; do git fetch origin "${remote#origin/}"; done`: fetch all your local branches
- `git checkout -b <local_name>  <remote_repo>/<remote_name>`: checkout new branch from remote

## lfs
- `git lfs install`: install 
- `git lfs migrate import --no-rewrite <file>`: convert file to lfs format

## log & history
- `git log --oneline <branch_A>..<branch_B>`: compare commits on two branches
- `git log -p --follow -1 <file>`: how changes on the previous modification
- `git diff --stat --color <branch_A>..<branch_B>`: changed files on two branches
- `git diff <commit_hash> --name-only`: only show filenames of modified files
- `git diff <commit_hash1> <commit_hash2> --name-status | sort`: compare files between commits and sort w.r.t. their modification
- `git difftool <branch1> <branch3> -- <file>`: compare file between 2 branches

## patch
- `git diff > <name>.patch`: create patch
- `git apply --3way <name>.patch `: apply patch


## pushing
- `git push -u origin <branch_name>`: new local branch to remote
- `git push <remote> <remote>/<old_name>:refs/heads/<new_name> :<old_name>`: rename remote only branch
- `git push origin --delete <branch_name>`: delete remote branch
- `git push --mirror https:// <remote_url> / <remote_repo>.git`: Copy existing repo from local to new remote
- `git push --tags`: push only tags

## rebase
- `git rebase -i <commit_id>`: rebase interactive to pick, squash or delete commits from history
- `git rebase -i HEAD~<num_commits>`: edit older commit (continue rebase afterwards)

## submodules
- `git submodule update`: update all submodules to respective version
- `git pull --recurse-submodules && git submodule update --recursive`: update recursively
- `git submodule foreach git status`: check status of all submodules
- `git submodule foreach git pull`: pull all submodules
- `git submodule update --init –recursive`: update and init all submodules (first checkout)
- `git submodule update --remote --merge`: merge in remote changes

## tagging
- `git tag -a v<version> -m "<message>" <commit-id>`: annotated tag

## doing some reviews
create a list of all changed files:
```sh
git diff <commit> --name-only > list_of_changed_files.txt
```
If you like, do some pre-filtering. Afterwards, do a git diff for every individual file:

```sh
cat list_of_changed_files.txt | while read line; do git diff <commit> $line; read -n 1 -p -------------------------<&1; clear; done
```
