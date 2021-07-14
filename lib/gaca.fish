function gaca -w 'git commit' -d 'Stage all files (including untracked) and then record changes to the repository'
  gaa; git commit -v -a $argv
end
