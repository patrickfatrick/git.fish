function gamscp -w 'git am' -d 'Apply patches from a mailbox'
  git am --show-current-patch $argv
end
