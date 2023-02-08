function gcasm -w 'git commit' -d 'Record changes to the repository'
  git commit -a -s -m $argv
end
