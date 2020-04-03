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