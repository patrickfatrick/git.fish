function gupav -w 'git pull' -d 'Fetch from and merge with another repository or a local branch'
  git pull --rebase --autostash -v $argv
end
