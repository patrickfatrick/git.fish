function gdca -w 'git diff' -d 'Show changes between commits or commit and working tree'
  git diff --cached $argv
end
