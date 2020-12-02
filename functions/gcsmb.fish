function gcsmb -w 'git commit' -d 'Commit changes with signoff and with branch name prepended to message'
  git commit -s -m (echo [(git_current_branch)] $argv)
end
