function glgp -w 'git log' -d 'Show commit logs'
  git log --stat -p $argv
end
