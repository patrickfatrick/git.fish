function gstu -w 'git stash' -d 'Stash away changes'
  git stash --include-untracked $argv
end
