function gdnolock -w 'git diff' -d 'Show changes between commits, commit and working tree, etc'
  git diff $argv ":(exclude)package-lock.json" ":(exclude)*.lock"
end
