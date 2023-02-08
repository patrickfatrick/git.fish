function gupv -w 'git pull' -d 'Fetch from and merge with another repo or branch'
  git pull --rebase -v $argv
end
