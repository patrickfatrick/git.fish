function glgga -w 'git log' -d 'Show commit logs'
  git log --graph --decorate --all $argv
end
