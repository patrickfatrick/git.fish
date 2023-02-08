function gpf -w 'git push' -d 'Push changes elsewhere'
  git push --force-with-lease $argv
end
