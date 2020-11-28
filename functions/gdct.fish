function gdct -w 'git describe' -d 'Give an object a human readable name based on an available ref'
  git describe --tags (git rev-list --tags --max-count=1)
end
