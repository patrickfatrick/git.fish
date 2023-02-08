function glo -w 'git log' -d 'Show commit logs'
  git log --oneline --decorate $argv
end
