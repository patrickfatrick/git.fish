function grbm -w 'git rebase' -d 'Rebase the current local branch with the main branch'
  git rebase (__git_main_branch) $argv
end
