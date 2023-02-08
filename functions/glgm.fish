function glgm -w 'git log' -d 'Show commit logs'
  git log --graph --max-count=10 $argv
end
