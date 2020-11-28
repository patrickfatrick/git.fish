function gpd -w 'git push' -d 'Update remote refs along with associated objects'
  git push --dry-run $argv
end
