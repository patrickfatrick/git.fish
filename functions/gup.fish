function gup -w 'git pull' -d 'Fetch from and merge with another repository or a local branch'
  git pull --rebase $argv
end
