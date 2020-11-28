function glg -w 'git log' -d 'Show commit logs'
  git log --stat $argv
end
