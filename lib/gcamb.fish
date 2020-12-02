function gcamb -w 'git commit' -d 'Commit changes with branch name prepended to message'
  git commit -a -m (echo [(git_current_branch)] $argv)
end
