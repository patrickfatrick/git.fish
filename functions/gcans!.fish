function gcans! -w 'git commit' -d 'Record changes to the repository'
  git commit -v -a -s --no-edit --amend $argv
end
