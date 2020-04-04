# GIT TUTORIAL

Git command | What it does?
------------------- | -----------------------
`$ git init ` | Initialisation of git repository
`$ git status` | Check whether all files are up to date with local repository
`$ git add <file>` | Adds file to local staging. Files needs to be added to staging before a commit
`$ git commit -m <message>` | Commits all files in staging into local repository
`$ git clone <url> <dir>` | Copy remote repositority from `<url>` into folder `<dir>`. To copy into current folder use `.` as `<dir>`. Only the branch to which `HEAD` is pointing is cloned. It automatically creates remote repository with name `origin` that points to `<url>`. All other branches can be seen by using `$ git branch -a`. To create local copy of other branches `$ git checkout <branch>` must be used.
`$ git merge <branch>` | Git merges current branch with the branch `<branch>`

-------------------------------------

Remote command | What it does?
------------------ | ---------------------------
`$ git remote -v` | List all remote repositories together with URL
`$ git remote add <repo> <url>` | Create a new connection to a remote repository at url address `<url>`. Locally the name of this remote repository will be `<repo>`
`$ git remote rename <old-name> <new-name>` | Rename the remote repository from `<old-name>` into `<new-name>`

-------------------------------------

Push & Pull command | What it does?
------------------ | ---------------------------
`$ git push <repo> <branch>` | Pushes branch <branch> from local repository into remote repository <repo>
`$ git push --all <repo>` | Pushes all local branches into remote repository <repo>
`$ git push --force-with-lease <repo> <branch>` | Works like regular push, but first git verifies whether your copy of remote branch is up to date
`$ git fetch <remote>` | Fetch all of the branches from the repository. This also downloads all of the required commits and files from the other repository.  It doesn’t force you to actually merge the changes into your repository. Git isolates fetched content as a from existing local content, it has absolutely no effect on your local development work.
`$ git fetch --dry-run` | The --dry-run option will perform a demo run of the command. It will output examples of actions it will take during the fetch but not apply them.
`$ git pull <remote>` | `git pull` is the more aggressive alternative, it will download the remote content for the active local branch and immediately execute git merge to create a merge commit for the new remote content. 

-------------------------------------

Branch command | What it does?
------------------- | -----------------------
`$ git branch ` | Lists all available branches
`$ git branch <branch>` | Creates new branch with name `<branch>`. It does not change the current branch
`$ git branch -d <branch>` | Delete the specified branch. This is a “safe” operation in that Git prevents you from deleting the branch if it has unmerged changes.
`$ git branch -D <branch>` | Force delete the specified branch, even if it has unmerged changes. 
`$ git branch -m <branch>` | Rename the current branch to `<branch>`.
`$ git branch -a` | List all remote branches
`$ git checkout <branch>` | Switches to branch to `<branch>`

-------------------------------------

### How to reverse a commit?
`$ git revert` reverses a single commit and keep all the other ones. It is not removed from the history, a new commit is added which make changes as the reverted commit was never done although it is still part of the commit history. An example:

Sample repository is created 
```
$ git init
$ echo 'alice' > alpha.html
$ git add . && git commit -m "1st git commit: 1 file"

$ echo 'becky' > beta.html
$ git add . && git commit -m "2nd git commit: 2 files"

$ echo 'callie' > charlie.html
$ git add . && git commit -m "3rd git commit: 3 files"

$ echo 'diana' > delta.html
$ git add . && git commit -m "4th git commit: 4 files"

$ echo 'ellen' > edison.html
$ git add . && git commit -m "5th git commit: 5 files"
```

5 different commits were made:
```
$ git reflog
(HEAD -> master)
d846aa8 HEAD@{0}: commit: 5th git commit: 5 files
0c59891 HEAD@{1}: commit: 4th git commit: 4 files
4945db2 HEAD@{2}: commit: 3rd git commit: 3 files
defc4eb HEAD@{3}: commit: 2nd git commit: 2 files
2938ee3 HEAD@{4}: commit: 1st git commit: 1 file
```

To revert the 3rd commit (basically remove the file charlie.html) we need to:  
`$ git revert 4945db2`

Here are few other examples:  
`$ git revert HEAD` - reverses last commit  
`$ git revert HEAD~3` - reverses 4th last commit  


