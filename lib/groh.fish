function groh -w 'git reset' -d 'Hard reset to the HEAD of the current branch'
  git reset origin/(git_current_branch) --hard $argv
end
