function gdnolock -w 'git diff $argv ":(exclude)package-lock.json" ":(exclude)*.lock"'
  git diff $argv ":(exclude)package-lock.json" ":(exclude)*.lock"
end
