function gams -w 'git am' -d 'Apply patches from a mailbox'
  git am --skip $argv
end
