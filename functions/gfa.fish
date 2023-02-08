function gfa -w 'git fetch' -d 'Download objects from another repo'
  git fetch --all --prune $argv
end
