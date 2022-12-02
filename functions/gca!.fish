function gca! -w 'git commit' -d 'Record changes to the repository Record changes to the repository'
  git commit -v -a --amend $argv
end
