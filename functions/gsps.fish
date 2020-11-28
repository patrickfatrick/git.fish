function gsps -w 'git show' -d '-branch	Shows the commits on branches Shows the last commit of a branch'
  git show --pretty=short --show-signature $argv
end
