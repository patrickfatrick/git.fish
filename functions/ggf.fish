function ggf -w 'git push' -d 'Force push the the current branch to origin'
  git push --force origin (__git_current_branch) $argv
end
