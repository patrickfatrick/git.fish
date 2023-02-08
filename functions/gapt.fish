function gapt -w 'git apply' -d 'Apply a patch'
  git apply --3way $argv
end
