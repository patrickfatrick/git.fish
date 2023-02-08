function gama -w 'git am' -d 'Apply patches from a mailbox'
  git am --abort $argv
end
