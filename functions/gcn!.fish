function gcn! -w 'git commit' -d 'Record changes to the repository Record changes to the repository'
  git commit -v --no-edit --amend $argv
end
