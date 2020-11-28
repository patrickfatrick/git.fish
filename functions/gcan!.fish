function gcan! -w 'git commit' -d 'Record changes to the repository'
  git commit -v -a --no-edit --amend $argv
end
