function gdw -w 'git diff' -d 'Show changes between commits or commit and working tree'
  git diff --word-diff $argv
end
