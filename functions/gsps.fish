function gsps -w 'git show' -d 'Show the last commit of a branch'
  git show --pretty=short --show-signature $argv
end
