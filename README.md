<img src="https://github.com/fish-shell/fish-shell/blob/master/doc_src/python_docs_theme/static/fish.png?raw=true" align="left" width="144px" height="144px"/>

## git.fish

> A collection of git functions for Fish shell based on [Oh My Zsh Git Plugin][omz-git-plugin] and [jhillyerd/plugin-git][orig-plugin]

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v3.1.0-007EC7.svg?style=flat-square)](https://fishshell.com)

## Installation

[oh-my-fish][omf-link]:

```fish
$ omf install https://github.com/patrickfatrick/git.fish
```

[fisher][fisher-link]:
```fish
$ fisher install patrickfatrick/git.fish
```

## Why?

This plugin is wholly written with fish functions which makes it extremely portable to different plugin managers and relies on no initialization logic. Meaning, it does not slow down shell startup time. Abbreviations are nice but their simplicity means some features here can't be done like that, and I like consistency.

## Functions*

*My additions are in bold.

| Alias                | Command                                                                                                                          |
|:---------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| g                    | git                                                                                                                              |
| ga                   | git add                                                                                                                          |
| gaa                  | git add --all                                                                                                                    |
| gacam                | git add --all; and git commit -m                                                                                                 |
| _gacamb_             | gaa; and git commit -m (echo [(git_current_branch)] $argv)                                                                     |
| gapa                 | git add --patch                                                                                                                  |
| gau                  | git add --update                                                                                                                 |
| gav                  | git add --verbose                                                                                                                |
| gap                  | git apply                                                                                                                        |
| gapt                 | git apply --3way                                                                                                                 |
| gb                   | git branch                                                                                                                       |
| gba                  | git branch -a                                                                                                                    |
| gbd                  | git branch -d                                                                                                                    |
| gbda                 | git branch --no-color --merged \| command grep -vE "^(\+\|\*\|\s*((git_main_branch)\|development\|develop\|devel\|dev)\s*$)" \| command xargs -n 1 git branch -d |
| gbD                  | git branch -D                                                                                                                    |
| gbl                  | git blame -b -w                                                                                                                  |
| gbnm                 | git branch --no-merged                                                                                                           |
| gbr                  | git branch --remote                                                                                                              |
| gbs                  | git bisect                                                                                                                       |
| gbsb                 | git bisect bad                                                                                                                   |
| gbsg                 | git bisect good                                                                                                                  |
| gbsr                 | git bisect reset                                                                                                                 |
| gbss                 | git bisect start                                                                                                                 |
| gc                   | git commit -v                                                                                                                    |
| gc!                  | git commit -v --amend                                                                                                            |
| gcn!                 | git commit -v --no-edit --amend                                                                                                  |
| gca                  | git commit -v -a                                                                                                                 |
| gca!                 | git commit -v -a --amend                                                                                                         |
| gcan!                | git commit -v -a --no-edit --amend                                                                                               |
| gcans!               | git commit -v -a -s --no-edit --amend                                                                                            |
| gcam                 | git commit -a -m                                                                                                                 |
| _gcamb_              | git commit -a -m (echo [(git_current_branch)] $argv)                                                                             |
| gcsm                 | git commit -s -m                                                                                                                 |
| _gcsmb_              | git commit -s -m (echo [(git_current_branch)] $argv)                                                                             |
| gcb                  | git checkout -b                                                                                                                  |
| gcf                  | git config --list                                                                                                                |
| gcl                  | git clone --recurse-submodules                                                                                                   |
| gclean               | git clean -id                                                                                                                    |
| gpristine            | git reset --hard; and git clean -dffx                                                                                            |
| gcm                  | git checkout (git_main_branch)                    |
| _gcml_               | git checkout (git_main_branch); and git pull origin (git_main_branch)                                                           |
| gcd                  | git checkout develop                                                                                                             |
| gcmsg                | git commit -m                                                                                                                    |
| gco                  | git checkout                                                                                                                     |
| gcount               | git shortlog -sn                                                                                                                 |
| gcp                  | git cherry-pick                                                                                                                  |
| gcpa                 | git cherry-pick --abort                                                                                                          |
| gcpc                 | git cherry-pick --continue                                                                                                       |
| gcs                  | git commit -S                                                                                                                    |
| gd                   | git diff                                                                                                                         |
| gdca                 | git diff --cached                                                                                                                |
| gdcw                 | git diff --cached --word-diff                                                                                                    |
| gdct                 | git describe --tags (git rev-list --tags --max-count=1)                                                                          |
| gds                  | git diff --staged                                                                                                                |
| gdt                  | git diff-tree --no-commit-id --name-only -r                                                                                      |
| gdnolock             | git diff $argv ":(exclude)package-lock.json" ":(exclude)&ast;.lock"                                                                     |
| gdv                  | git diff -w $argv \| view -                                                                                                      |
| gdw                  | git diff --word-diff                                                                                                             |
| gf                   | git fetch                                                                                                                        |
| gfa                  | git fetch --all --prune                                                                                                          |
| gfg                  | git ls-files \| grep                                                                                                             |
| gfo                  | git fetch origin                                                                                                                 |
| gg                   | git gui citool                                                                                                                   |
| gga                  | git gui citool --amend                                                                                                           |
| ggf                  | git push --force origin (git_current_branch)                                                                                     |
| ggfl                 | git push --force-with-lease origin (git_current_branch)                                                                          |
| ggl                  | git pull origin (git_current_branch)                                                                                             |
| ggp                  | git push origin (git_current_branch)                                                                                             |
| ggpnp                | ggl; and ggp                                                                                                                     |
| ggpull               | git pull origin "(git_current_branch)"                                                                                           |
| ggpur                | ggu                                                                                                                              |
| ggpush               | git push origin "(git_current_branch)"                                                                                           |
| ggsup                | git branch --set-upstream-to=origin/(git_current_branch)                                                                         |
| ggu                  | git pull --rebase origin (git_current_branch)                                                                                    |
| gpsup                | git push --set-upstream origin (git_current_branch)                                                                              |
| ghh                  | git help                                                                                                                         |
| gignore              | git update-index --assume-unchanged                                                                                              |
| gignored             | git ls-files -v \| grep "^[[:lower:]]"                                                                                           |
| git-svn-dcommit-push | git svn dcommit; and git push github (git_main_branch):svntrunk                                                                  |
| gk                   | gitk --all --branches                                                                                                            |
| gke                  | gitk --all (git log -g --pretty=%h)                                                                                              |
| gl                   | git pull                                                                                                                         |
| glg                  | git log --stat                                                                                                                   |
| glgp                 | git log --stat -p                                                                                                                |
| glgg                 | git log --graph                                                                                                                  |
| glgga                | git log --graph --decorate --all                                                                                                 |
| glgm                 | git log --graph --max-count=10                                                                                                   |
| glo                  | git log --oneline --decorate                                                                                                     |
| glol                 | git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"                           |
| glols                | git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --stat                    |
| glod                 | git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"                           |
| glods                | git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short              |
| glola                | git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --all                     |
| glog                 | git log --oneline --decorate --graph                                                                                             |
| gloga                | git log --oneline --decorate --graph --all                                                                                       |
| glp                  | git log --pretty=\<format\>                                                                                                      |
| gm                   | git merge                                                                                                                        |
| gmom                 | git merge origin/(git_main_branch)                                                                                                            |
| gmt                  | git mergetool --no-prompt                                                                                                        |
| gmtvim               | git mergetool --no-prompt --tool=vimdiff                                                                                         |
| gmum                 | git merge upstream/(git_main_branch)                                                                                                          |
| gma                  | git merge --abort                                                                                                                |
| gp                   | git push                                                                                                                         |
| gpd                  | git push --dry-run                                                                                                               |
| gpf                  | git push --force-with-lease                                                                                                      |
| gpf!                 | git push --force                                                                                                                 |
| gpoat                | git push origin --all; and git push origin --tags                                                                                  |
| gpu                  | git push upstream                                                                                                                |
| gpv                  | git push -v                                                                                                                      |
| gr                   | git remote                                                                                                                       |
| gra                  | git remote add                                                                                                                   |
| grb                  | git rebase                                                                                                                       |
| grba                 | git rebase --abort                                                                                                               |
| grbc                 | git rebase --continue                                                                                                            |
| grbd                 | git rebase develop                                                                                                               |
| grbi                 | git rebase -i                                                                                                                    |
| grbm                 | git rebase (git_main_branch)                                                                                                                  |
| grbs                 | git rebase --skip                                                                                                                |
| grename <old> <new>  | Rename `old` branch to `new`, including in origin remote                     |
| grev                 | git revert                                                                                                                       |
| grh                  | git reset                                                                                                                        |
| grhh                 | git reset --hard                                                                                                                 |
| groh                 | git reset origin/(git_current_branch) --hard                                                                                    |
| grm                  | git rm                                                                                                                           |
| grmc                 | git rm --cached                                                                                                                  |
| grmv                 | git remote rename                                                                                                                |
| grrm                 | git remote remove                                                                                                                |
| grs                  | git restore                                                                                                                      |
| grset                | git remote set-url                                                                                                               |
| grss                 | git restore --source                                                                                                             |
| grt                  | cd "(git rev-parse --show-toplevel \|\| echo .)"                                                                                |
| gru                  | git reset --                                                                                                                     |
| grup                 | git remote update                                                                                                                |
| grv                  | git remote -v                                                                                                                    |
| gsb                  | git status -sb                                                                                                                   |
| gsd                  | git svn dcommit                                                                                                                  |
| gsh                  | git show                                                                                                                         |
| gsi                  | git submodule init                                                                                                               |
| gsps                 | git show --pretty=short --show-signature                                                                                         |
| gsr                  | git svn rebase                                                                                                                   |
| gss                  | git status -s                                                                                                                    |
| gst                  | git status                                                                                                                       |
| gsta                 | git stash push                                                                                                                   |
| gsta                 | git stash save                                                                                                                   |
| gstaa                | git stash apply                                                                                                                  |
| gstc                 | git stash clear                                                                                                                  |
| gstd                 | git stash drop                                                                                                                   |
| gstl                 | git stash list                                                                                                                   |
| gstp                 | git stash pop                                                                                                                    |
| gsts                 | git stash show --text                                                                                                            |
| gstu                 | git stash --include-untracked                                                                                                    |
| gstall               | git stash --all                                                                                                                  |
| gsu                  | git submodule update                                                                                                             |
| gsw                  | git switch                                                                                                                       |
| gswc                 | git switch -c                                                                                                                    |
| gts                  | git tag -s                                                                                                                       |
| gtv                  | git tag \| sort -V                                                                                                               |
| gtl                  | git tag --sort=-v:refname -n -l $argv[1]\*; noglob gtl                                                                       |
| gunignore            | git update-index --no-assume-unchanged                                                                                           |
| gunwip               | Undo a wip branch                                                                     |
| gup                  | git pull --rebase                                                                                                                |
| gupv                 | git pull --rebase -v                                                                                                             |
| gupa                 | git pull --rebase --autostash                                                                                                    |
| gupav                | git pull --rebase --autostash -v                                                                                                 |
| glum                 | git pull upstream (git_main_branch)                                                                                              |
| gwch                 | git whatchanged -p --abbrev-commit --pretty=medium                                                                               |
| gwip                 | Commit a wip branch                                                                     |
| gam                  | git am                                                                                                                           |
| gamc                 | git am --continue                                                                                                                |
| gams                 | git am --skip                                                                                                                    |
| gama                 | git am --abort                                                                                                                   |
| git_current_branch   | Return the name of the current branch                                                                                            |
| git_main_branch      | Returns the name of the main branch: main if it exists, master otherwise                                                   |
| git_current_user_name | Returns the user.name config value                                                                                              |
| git_current_user_email | Returns the user.email config value                                                                                            |
| git_work_in_progress | Echoes a warning if the current branch is a wip                                                                                  |

### Main branch preference

Like Oh-my-zsh, this repo will use `main` as your main branch instrad of master if that branch exists.

### Caveats

I have not personally tested every function in this repo. They were largely converted from the commands in oh-my-zsh to fish.

# License

[MIT][mit] © [Patrick Fricano][author]

[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/patrickfatrick
[orig-plugin]:    https://github.com/jhillyerd/plugin-git
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish
[fisher-link]:    https://github.com/jorgebucaran/fisher

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
[omz-git-plugin]: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git/

