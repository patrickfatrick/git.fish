function gke -w 'gitk (git log'
  gitk --all (git log -g --pretty=%h) $argv
end
