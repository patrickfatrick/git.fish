function gc! -w 'git commit' -d 'Record changes to the repository'
  git commit -v --amend $argv
end
