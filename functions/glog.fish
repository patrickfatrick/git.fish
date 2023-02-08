function glog -w 'git log' -d 'Show commit logs'
  git log --oneline --decorate --graph $argv
end
