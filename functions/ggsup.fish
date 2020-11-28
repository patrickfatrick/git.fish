function ggsup -w 'git branch' -d 'Set upstream to current branch on origin'
  git branch --set-upstream-to=origin/(__git_current_branch) $argv
end
