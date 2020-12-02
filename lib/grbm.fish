function grbm -w 'git rebase' -d 'Rebase the current local branch with the main branch'
  git rebase (git_main_branch) $argv
end
