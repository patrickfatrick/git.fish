function ggp -w 'git push' -d 'Push the current branch to origin'
  git push origin (git_current_branch) $argv
end
