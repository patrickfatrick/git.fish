function gignore -w 'git update-index'
  git update-index --assume-unchanged $argv
end
