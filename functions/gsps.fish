function gsps -w 'git show' -d 'Shows the last commit of a branch Shows the last commit of a branch'
  git show --pretty=short --show-signature $argv
end
