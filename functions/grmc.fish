function grmc -w 'git rm' -d 'Remove files from the working tree and/or staging area'
  git rm --cached $argv
end
