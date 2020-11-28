function gupa -w 'git pull' -d 'Fetch from and merge with another repository or a local branch'
  git pull --rebase --autostash $argv
end
