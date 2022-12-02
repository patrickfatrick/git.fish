set special_functions (string replace '.fish' '' (ls (pwd)/lib | grep -v -e '^__'))

for fn in $special_functions
  set -l src (pwd)/lib/$fn.fish
  set -l dest (pwd)/functions
  echo copying $src '-->' $dest
  cp -f $src $dest
end

function git_function_string -a name body
  if string match -qvr '; and|\||git_main_branch|git_current_branch' $body;
    set wrapped_cmd (string replace -a -r ' --?[a-zA-Z0-9-]+(="?.+"?)?' '' $body)
    set base_cmd (
      echo (string match -ar '[a-zA-Z0-9-]+' $wrapped_cmd)[-1..2]
    )
    if test -n $base_cmd
      set description (
        complete -C 'git ' | grep "^$base_cmd\s" | \
        string replace -r $base_cmd '' | \
        string trim
      )
    end
  end

  set args (
    string match -qvr '; and|\$argv' $body;
      and echo ' $argv';
      or echo ''
  )

  echo "function $name"(test -n "$wrapped_cmd"; and echo " -w '$wrapped_cmd'"; or echo '')(test -n "$description"; and echo " -d '$description'"; or echo '')"
  "$body(test -n $args; and echo $args; or echo '')"
end"
end

function git_make_function -a name body
  set -l target_dir (pwd)/functions
  set -l target_file $target_dir/$name.fish

  if contains $name $special_functions
    echo skipping $name
    return
  end

  echo writing $target_file
  rm $target_file
  touch $target_file
  git_function_string $name $body >> $target_file
end

# List from oh-my-zsh (massaged for fish compatibility)
git_make_function g 'git'
git_make_function ga 'git add'
git_make_function gaa 'git add --all'
git_make_function gam 'git am'
git_make_function gamc 'git am --continue'
git_make_function gams 'git am --skip'
git_make_function gama 'git am --abort'
git_make_function gamscp 'git am --show-current-patch'
git_make_function gapa 'git add --patch'
git_make_function gau 'git add --update'
git_make_function gav 'git add --verbose'
git_make_function gap 'git apply'
git_make_function gapt 'git apply --3way'
git_make_function gb 'git branch'
git_make_function gba 'git branch -a'
git_make_function gbd 'git branch -d'
git_make_function gbda 'git branch --no-color --merged | command grep -vE \'^(+|*|\s*((git_main_branch)|(git_develop_branch))\s*$)\' | command xargs -n 1 git branch -d'
git_make_function gbD 'git branch -D'
git_make_function gbl 'git blame -b -w'
git_make_function gbnm 'git branch --no-merged'
git_make_function gbr 'git branch --remote'
git_make_function gbs 'git bisect'
git_make_function gbsb 'git bisect bad'
git_make_function gbsg 'git bisect good'
git_make_function gbsr 'git bisect reset'
git_make_function gbss 'git bisect start'
git_make_function gc 'git commit -v'
git_make_function gc! 'git commit -v --amend'
git_make_function gcn 'git commit -v --no-edit'
git_make_function gcn! 'git commit -v --no-edit --amend'
git_make_function gca 'git commit -v -a'
git_make_function gca! 'git commit -v -a --amend'
git_make_function gcan! 'git commit -v -a --no-edit --amend'
git_make_function gcans! 'git commit -v -a -s --no-edit --amend'
git_make_function gcam 'git commit -a -m'
git_make_function gcas 'git commit -a -s'
git_make_function gcasm 'git commit -a -s -m'
git_make_function gcsm 'git commit -s -m'
git_make_function gcb 'git checkout -b'
git_make_function gcf 'git config --list'
git_make_function gcl 'git clone --recurse-submodules'
git_make_function gccd 'git clone --recurse-submodules $argv and cd (basename $argv[-1] .git)'
git_make_function gclean 'git clean -id'
git_make_function gpristine 'git reset --hard; and git clean -dffx'
git_make_function gcm 'git checkout (git_main_branch)'
git_make_function gcd 'git checkout (git_develop_branch)'
git_make_function gcmsg 'git commit -m'
git_make_function gco 'git checkout'
git_make_function gcor = 'git checkout --recurse-submodules'
git_make_function gcount 'git shortlog -sn'
git_make_function gcp 'git cherry-pick'
git_make_function gcpa 'git cherry-pick --abort'
git_make_function gcpc 'git cherry-pick --continue'
git_make_function gcs 'git commit -S'
git_make_function gd 'git diff'
git_make_function gdca 'git diff --cached'
git_make_function gdcw 'git diff --cached --word-diff'
git_make_function gdct 'git describe --tags (git rev-list --tags --max-count=1)'
git_make_function gds 'git diff --staged'
git_make_function gdt 'git diff-tree --no-commit-id --name-only -r'
git_make_function gdnolock 'git diff $argv ":(exclude)package-lock.json" ":(exclude)*.lock"'
git_make_function gdv 'git diff -w $argv | view -'
git_make_function gdw 'git diff --word-diff'
git_make_function gf 'git fetch'
git_make_function gfa 'git fetch --all --prune'
git_make_function gfg 'git ls-files | grep'
git_make_function gfo 'git fetch origin'
git_make_function gg 'git gui citool'
git_make_function gga 'git gui citool --amend'
git_make_function ggf 'git push --force origin (git_current_branch)'
git_make_function ggfl 'git push --force-with-lease origin (git_current_branch)'
git_make_function ggl 'git pull origin (git_current_branch)'
git_make_function ggp 'git push origin (git_current_branch)'
git_make_function ggpnp 'ggl; and ggp'
git_make_function ggpull 'git pull origin (git_current_branch)'
git_make_function ggpur 'ggu'
git_make_function ggpush 'git push origin (git_current_branch)'
git_make_function ggsup 'git branch --set-upstream-to=origin/(git_current_branch)'
git_make_function ggu 'git pull --rebase origin (git_current_branch)'
git_make_function gpsup 'git push --set-upstream origin (git_current_branch)'
git_make_function ghh 'git help'
git_make_function gignore 'git update-index --assume-unchanged'
git_make_function gignored 'git ls-files -v | grep "^[[:lower:]]"'
git_make_function git-svn-dcommit-push 'git svn dcommit; and git push github (git_main_branch):svntrunk'
git_make_function gk 'gitk --all --branches &!'
git_make_function gke 'gitk --all (git log -g --pretty=%h) &!'
git_make_function gl 'git pull'
git_make_function glg 'git log --stat'
git_make_function glgp 'git log --stat -p'
git_make_function glgg 'git log --graph'
git_make_function glgga 'git log --graph --decorate --all'
git_make_function glgm 'git log --graph --max-count=10'
git_make_function glo 'git log --oneline --decorate'
git_make_function glol 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
git_make_function glols 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --stat'
git_make_function glod 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
git_make_function glods 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
git_make_function glola 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --all'
git_make_function glog 'git log --oneline --decorate --graph'
git_make_function gloga 'git log --oneline --decorate --graph --all'
git_make_function glp 'git log --pretty=<format>'
git_make_function gluc 'git pull upstream (git_current_branch)'
git_make_function glum 'git pull upstream (git_main_branch)'
git_make_function gm 'git merge'
git_make_function gmom 'git merge origin/(git_main_branch)'
git_make_function gmt 'git mergetool --no-prompt'
git_make_function gmtvim 'git mergetool --no-prompt --tool=vimdiff'
git_make_function gmum 'git merge upstream/(git_main_branch)'
git_make_function gma 'git merge --abort'
git_make_function gp 'git push'
git_make_function gpd 'git push --dry-run'
git_make_function gpf 'git push --force-with-lease'
git_make_function gpf! 'git push --force'
git_make_function gpoat 'git push origin --all; and git push origin --tags'
git_make_function gpr 'git pull --rebase'
git_make_function gpu 'git push upstream'
git_make_function gpv 'git push -v'
git_make_function gr 'git remote'
git_make_function gra 'git remote add'
git_make_function grb 'git rebase'
git_make_function grba 'git rebase --abort'
git_make_function grbc 'git rebase --continue'
git_make_function grbd 'git rebase (git_develop_branch)'
git_make_function grbi 'git rebase -i'
git_make_function grbm 'git rebase (git_main_branch)'
git_make_function grbo 'git rebase --onto'
git_make_function grbom 'git rebase origin/(git_main_branch)'
git_make_function grbs 'git rebase --skip'
git_make_function grev 'git revert'
git_make_function grh 'git reset'
git_make_function grhh 'git reset --hard'
git_make_function groh 'git reset origin/(git_current_branch) --hard'
git_make_function grm 'git rm'
git_make_function grmc 'git rm --cached'
git_make_function grmv 'git remote rename'
git_make_function grrm 'git remote remove'
git_make_function grs 'git restore'
git_make_function grset 'git remote set-url'
git_make_function grss 'git restore --source'
git_make_function grst 'git restore --staged'
git_make_function grt 'cd (git rev-parse --show-toplevel || echo .)'
git_make_function gru 'git reset --'
git_make_function grup 'git remote update'
git_make_function grv 'git remote -v'
git_make_function gsb 'git status -sb'
git_make_function gsd 'git svn dcommit'
git_make_function gsh 'git show'
git_make_function gsi 'git submodule init'
git_make_function gsps 'git show --pretty=short --show-signature'
git_make_function gsr 'git svn rebase'
git_make_function gss 'git status -s'
git_make_function gst 'git status'
git_make_function gsta 'git stash push'
git_make_function gsta 'git stash save'
git_make_function gstaa 'git stash apply'
git_make_function gstc 'git stash clear'
git_make_function gstd 'git stash drop'
git_make_function gstl 'git stash list'
git_make_function gstp 'git stash pop'
git_make_function gsts 'git stash show --text'
git_make_function gstu 'git stash --include-untracked'
git_make_function gstall 'git stash --all'
git_make_function gsu 'git submodule update'
git_make_function gsw 'git switch'
git_make_function gswc 'git switch -c'
git_make_function gswm 'git switch (git_main_branch)'
git_make_function gswd 'git switch (git_develop_branch)'
git_make_function gts 'git tag -s'
git_make_function gtv 'git tag | sort -V'
git_make_function gtl 'git tag --sort=-v:refname -n -l $argv[1]*; and noglob gtl'
git_make_function gunignore 'git update-index --no-assume-unchanged'
git_make_function gunwip 'git log -n 1 | grep -q -c "--wip--"; and git reset HEAD~1'
git_make_function gup 'git pull --rebase'
git_make_function gupv 'git pull --rebase -v'
git_make_function gupa 'git pull --rebase --autostash'
git_make_function gupav 'git pull --rebase --autostash -v'
git_make_function gupom 'git pull --rebase origin (git_main_branch)'
git_make_function gupomi 'git pull --rebase=interactive origin (git_main_branch)'
git_make_function gwch 'git whatchanged -p --abbrev-commit --pretty=medium'
git_make_function gwip 'git add -A; and git rm (git ls-files --deleted) 2> /dev/null; and git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
git_make_function gwt 'git worktree'
git_make_function gwta 'git worktree add'
git_make_function gwtls 'git worktree list'
git_make_function gwtmv 'git worktree move'
git_make_function gwtrm 'git worktree remove'

functions -e git_make_function
functions -e git_function_string
set -e special_functions
