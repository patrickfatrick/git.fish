function grst -w 'git restore' -d 'Restore working tree files'
  git restore --staged $argv
end
