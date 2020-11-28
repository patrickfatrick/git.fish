function grmc -w 'git rm' -d 'Remove files from the working tree and the index'
  git rm --cached $argv
end
