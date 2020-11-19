function gke -w 'gitk --all (git log -g --pretty=%h)'
  gitk --all (git log -g --pretty=%h) $argv
end
