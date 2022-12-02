function gloga -w 'git log' -d 'Show commit logs Show commit logs'
  git log --oneline --decorate --graph --all $argv
end
