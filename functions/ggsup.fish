function ggsup
  git branch --set-upstream-to=origin/(__git_current_branch) $argv
end
