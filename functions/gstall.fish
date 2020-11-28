function gstall -w 'git stash' -d 'Stash away changes'
  git stash --all $argv
end
