# GIT TUTORIAL

Git command | What it does?
------------------- | -----------------------
`$ git init ` | Initialisation of git repository
`$ git status` | Check whether all files are up to date with local repository
`$ git add <file>` | Adds file to local staging. Files needs to be added to staging before a commit
`$ git commit -m <message>` | Commits all files in staging into local repository
`$ git push -u origin master` | Pushes local repository into remote
`$ git remote add origin <address>` | Add remote repository. Sample `<address>` could be https://github.com/TomekTarczynski/Tutorial.git

Branch command | What it does?
------------------- | -----------------------
`$ git branch ` | Lists all available branches
`$ git branch <branch>` | Creates new branch with name `<branch>`. It does not change the current branch
`$ git branch -d <branch>` | Delete the specified branch. This is a “safe” operation in that Git prevents you from deleting the branch if it has unmerged changes.
`$ git branch -D <branch>` | Force delete the specified branch, even if it has unmerged changes. 
`$ git branch -m <branch>` | Rename the current branch to `<branch>`.
`$ git branch -a` | List all remote branches

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

To revert the 3rd commit (basically remove the file charlie.html') we need to:
```$ git revert 4945db2```

Here are few other examples:
`$ git revert HEAD` - reverses last commit
`$ git revert HEAD~3` - reverses 4th last commit