function gdct -w 'git describe --tags (git rev-list --tags --max-count=1)'
  git describe --tags (git rev-list --tags --max-count=1) $argv
end
