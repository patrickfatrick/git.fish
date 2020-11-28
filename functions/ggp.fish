function ggp -w 'git push' -d 'Push the current branch to origin'
  git push origin (__git_current_branch) $argv
end
