function gamscp -w 'git am' -d 'Apply a series of patches from a mailbox Apply a series of patches from a mailbox'
  git am --show-current-patch $argv
end
