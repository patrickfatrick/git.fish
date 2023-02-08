function gamc -w 'git am' -d 'Apply patches from a mailbox'
  git am --continue $argv
end
