function gdcw -w 'git diff' -d 'Show changes between commits, commit and working tree, etc'
  git diff --cached --word-diff $argv
end
