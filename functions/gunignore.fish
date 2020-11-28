function gunignore -w 'git update-index'
  git update-index --no-assume-unchanged $argv
end
