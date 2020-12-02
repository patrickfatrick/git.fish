function gacam -w 'git commit' -d 'stage all files (including untracked) and then commit'
  git add --all; and git commit -m $argv
end
