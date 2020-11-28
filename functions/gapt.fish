function gapt -w 'git apply' -d 'Apply a patch on a git index file and a working tree'
  git apply --3way $argv
end
