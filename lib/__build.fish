set special_functions (string replace '.fish' '' (ls (pwd)/lib | grep -v -e '^__'))

for fn in $special_functions
  set -l src (pwd)/lib/$fn.fish
  set -l dest (pwd)/functions
  echo copying $src '-->' $dest
  cp -f $src $dest
end

function __git_function_string -a name body -d "Construct a fish-friendly function"
  set body (string replace -a -r ' && |; ' '; and ' $body)
  set body (string replace -a '$(git_main_branch)' '(__git_main_branch)' $body)
  set body (string replace -a '$(current_branch)' '(__git_current_branch)' $body)
  set body (string replace -a '$(git_current_branch)' '(__git_current_branch)' $body)
  set body (string replace -a '$@' '$argv' $body)
  set body (string replace -a -r '\$\{(\d)\}' '$argv[$1]' $body)
  set body (string replace -a '$(' '(' $body)

  echo "function $name"(string match -qvr '; and|\||__git' $body; and echo " -w '$body'"; or echo '')"
  "$body(string match -qvr '; and|\$argv' $body; and echo ' $argv'; or echo '')"
end"
end

function __git_make_function -a name body
  set -l target_dir (pwd)/functions
  set -l target_file $target_dir/$name.fish

  if contains $name $special_functions
    echo skipping $name
    return
  end

  echo writing $target_file
  rm $target_file
  touch $target_file
  __git_function_string $name $body >> $target_file
end

# List from oh-my-zsh (slightly massaged)
__git_make_function g 'git'
__git_make_function ga 'git add'
__git_make_function gaa 'git add --all'
__git_make_function gapa 'git add --patch'
__git_make_function gau 'git add --update'
__git_make_function gav 'git add --verbose'
__git_make_function gap 'git apply'
__git_make_function gapt 'git apply --3way'
__git_make_function gb 'git branch'
__git_make_function gba 'git branch -a'
__git_make_function gbd 'git branch -d'
__git_make_function gbda 'git branch --no-color --merged | command grep -vE \'^(+|*|\s*($(git_main_branch)|development|develop|devel|dev)\s*$)\' | command xargs -n 1 git branch -d'
__git_make_function gbD 'git branch -D'
__git_make_function gbl 'git blame -b -w'
__git_make_function gbnm 'git branch --no-merged'
__git_make_function gbr 'git branch --remote'
__git_make_function gbs 'git bisect'
__git_make_function gbsb 'git bisect bad'
__git_make_function gbsg 'git bisect good'
__git_make_function gbsr 'git bisect reset'
__git_make_function gbss 'git bisect start'
__git_make_function gc 'git commit -v'
__git_make_function gc! 'git commit -v --amend'
__git_make_function gcn! 'git commit -v --no-edit --amend'
__git_make_function gca 'git commit -v -a'
__git_make_function gca! 'git commit -v -a --amend'
__git_make_function gcan! 'git commit -v -a --no-edit --amend'
__git_make_function gcans! 'git commit -v -a -s --no-edit --amend'
__git_make_function gcam 'git commit -a -m'
__git_make_function gcsm 'git commit -s -m'
__git_make_function gcb 'git checkout -b'
__git_make_function gcf 'git config --list'
__git_make_function gcl 'git clone --recurse-submodules'
__git_make_function gclean 'git clean -id'
__git_make_function gpristine 'git reset --hard && git clean -dffx'
__git_make_function gcm 'git checkout $(git_main_branch)'
__git_make_function gcd 'git checkout develop'
__git_make_function gcmsg 'git commit -m'
__git_make_function gco 'git checkout'
__git_make_function gcount 'git shortlog -sn'
__git_make_function gcp 'git cherry-pick'
__git_make_function gcpa 'git cherry-pick --abort'
__git_make_function gcpc 'git cherry-pick --continue'
__git_make_function gcs 'git commit -S'
__git_make_function gd 'git diff'
__git_make_function gdca 'git diff --cached'
__git_make_function gdcw 'git diff --cached --word-diff'
__git_make_function gdct 'git describe --tags $(git rev-list --tags --max-count=1)'
__git_make_function gds 'git diff --staged'
__git_make_function gdt 'git diff-tree --no-commit-id --name-only -r'
__git_make_function gdnolock 'git diff $@ ":(exclude)package-lock.json" ":(exclude)*.lock"'
__git_make_function gdv 'git diff -w $@ | view -'
__git_make_function gdw 'git diff --word-diff'
__git_make_function gf 'git fetch'
__git_make_function gfa 'git fetch --all --prune'
__git_make_function gfg 'git ls-files | grep'
__git_make_function gfo 'git fetch origin'
__git_make_function gg 'git gui citool'
__git_make_function gga 'git gui citool --amend'
__git_make_function ggf 'git push --force origin $(current_branch)'
__git_make_function ggfl 'git push --force-with-lease origin $(current_branch)'
__git_make_function ggl 'git pull origin $(current_branch)'
__git_make_function ggp 'git push origin $(current_branch)'
__git_make_function ggpnp 'ggl && ggp'
__git_make_function ggpull 'git pull origin "$(git_current_branch)"'
__git_make_function ggpur 'ggu'
__git_make_function ggpush 'git push origin "$(git_current_branch)"'
__git_make_function ggsup 'git branch --set-upstream-to=origin/$(git_current_branch)'
__git_make_function ggu 'git pull --rebase origin $(current_branch)'
__git_make_function gpsup 'git push --set-upstream origin $(git_current_branch)'
__git_make_function ghh 'git help'
__git_make_function gignore 'git update-index --assume-unchanged'
__git_make_function gignored 'git ls-files -v | grep "^[[:lower:]]"'
__git_make_function git-svn-dcommit-push 'git svn dcommit && git push github $(git_main_branch):svntrunk'
__git_make_function gk 'gitk --all --branches'
__git_make_function gke 'gitk --all $(git log -g --pretty=%h)'
__git_make_function gl 'git pull'
__git_make_function glg 'git log --stat'
__git_make_function glgp 'git log --stat -p'
__git_make_function glgg 'git log --graph'
__git_make_function glgga 'git log --graph --decorate --all'
__git_make_function glgm 'git log --graph --max-count=10'
__git_make_function glo 'git log --oneline --decorate'
__git_make_function glol 'git log --graph --pretty=\'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\''
__git_make_function glols 'git log --graph --pretty=\'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --stat'
__git_make_function glod 'git log --graph --pretty=\'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset\''
__git_make_function glods 'git log --graph --pretty=\'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset\' --date=short'
__git_make_function glola 'git log --graph --pretty=\'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --all'
__git_make_function glog 'git log --oneline --decorate --graph'
__git_make_function gloga 'git log --oneline --decorate --graph --all'
__git_make_function glp 'git log --pretty=<format>'
__git_make_function gm 'git merge'
__git_make_function gmom 'git merge origin/$(git_main_branch)'
__git_make_function gmt 'git mergetool --no-prompt'
__git_make_function gmtvim 'git mergetool --no-prompt --tool=vimdiff'
__git_make_function gmum 'git merge upstream/$(git_main_branch)'
__git_make_function gma 'git merge --abort'
__git_make_function gp 'git push'
__git_make_function gpd 'git push --dry-run'
__git_make_function gpf 'git push --force-with-lease'
__git_make_function gpf! 'git push --force'
__git_make_function gpoat 'git push origin --all && git push origin --tags'
__git_make_function gpu 'git push upstream'
__git_make_function gpv 'git push -v'
__git_make_function gr 'git remote'
__git_make_function gra 'git remote add'
__git_make_function grb 'git rebase'
__git_make_function grba 'git rebase --abort'
__git_make_function grbc 'git rebase --continue'
__git_make_function grbd 'git rebase develop'
__git_make_function grbi 'git rebase -i'
__git_make_function grbm 'git rebase $(git_main_branch)'
__git_make_function grbs 'git rebase --skip'
__git_make_function grev 'git revert'
__git_make_function grh 'git reset'
__git_make_function grhh 'git reset --hard'
__git_make_function groh 'git reset origin/$(git_current_branch) --hard'
__git_make_function grm 'git rm'
__git_make_function grmc 'git rm --cached'
__git_make_function grmv 'git remote rename'
__git_make_function grrm 'git remote remove'
__git_make_function grs 'git restore'
__git_make_function grset 'git remote set-url'
__git_make_function grss 'git restore --source'
__git_make_function grt 'cd "$(git rev-parse --show-toplevel || echo .)"'
__git_make_function gru 'git reset --'
__git_make_function grup 'git remote update'
__git_make_function grv 'git remote -v'
__git_make_function gsb 'git status -sb'
__git_make_function gsd 'git svn dcommit'
__git_make_function gsh 'git show'
__git_make_function gsi 'git submodule init'
__git_make_function gsps 'git show --pretty=short --show-signature'
__git_make_function gsr 'git svn rebase'
__git_make_function gss 'git status -s'
__git_make_function gst 'git status'
__git_make_function gsta 'git stash push'
__git_make_function gsta 'git stash save'
__git_make_function gstaa 'git stash apply'
__git_make_function gstc 'git stash clear'
__git_make_function gstd 'git stash drop'
__git_make_function gstl 'git stash list'
__git_make_function gstp 'git stash pop'
__git_make_function gsts 'git stash show --text'
__git_make_function gstu 'git stash --include-untracked'
__git_make_function gstall 'git stash --all'
__git_make_function gsu 'git submodule update'
__git_make_function gsw 'git switch'
__git_make_function gswc 'git switch -c'
__git_make_function gts 'git tag -s'
__git_make_function gtv 'git tag | sort -V'
__git_make_function gtl 'gtl(){ git tag --sort=-v:refname -n -l ${1}* }; noglob gtl'
__git_make_function gunignore 'git update-index --no-assume-unchanged'
__git_make_function gunwip 'git log -n 1 | grep -q -c "--wip--" && git reset HEAD~1'
__git_make_function gup 'git pull --rebase'
__git_make_function gupv 'git pull --rebase -v'
__git_make_function gupa 'git pull --rebase --autostash'
__git_make_function gupav 'git pull --rebase --autostash -v'
__git_make_function glum 'git pull upstream $(git_main_branch)'
__git_make_function gwch 'git whatchanged -p --abbrev-commit --pretty=medium'
__git_make_function gwip 'git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
__git_make_function gam 'git am'
__git_make_function gamc 'git am --continue'
__git_make_function gams 'git am --skip'
__git_make_function gama 'git am --abort'
__git_make_function gamscp 'git am --show-current-patch'

functions -e __git_make_function
functions -e __git_function_string
set -e special_functions