# CONDA TUTORIAL

Git command | What it does?
------------------- | -----------------------------------
`conda env list` | List all environments
`conda activate <env>` | Activates environment \<env\>
`conda create --name <env> python=3.5` | Creates environment \<env\> with python 3.5
`conda create --clone <source> --name <dest>` | Creates env \<dest\> which is clone of environment \<source>
`conda env remove --name <env>` | Deletes environment \<env\>
`jupyter-notebook` | Activates jupyter-notebook
`conda env create --file <file>` | Create environment from a text file
`conda list` | List all packages and versions installed in active environment
`conda list --explicit > <file>` | Save environment to a text file
`conda update <package>` | Updates package \<package\>
`conda install <package>` | Installs \<package\> into the current environment
`conda install --channel conda-forge <package>` | Install \<package\> from channel conda-forge
`conda remove <package>` | Removes package \<package\>

