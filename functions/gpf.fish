function gpf -w 'git push' -d 'Update remote refs along with associated objects'
  git push --force-with-lease $argv
end
