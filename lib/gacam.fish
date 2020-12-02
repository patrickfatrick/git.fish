function gacam -w 'git commit' -d 'Stage all files (including untracked) and then commit'
  gaa; and git commit -m $argv
end
