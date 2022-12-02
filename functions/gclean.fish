function gclean -w 'git clean' -d 'Remove untracked files from the working tree Remove untracked files from the working tree'
  git clean -id $argv
end
