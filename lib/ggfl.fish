function ggfl -w 'git push' -d 'Force push with lease protection'
  git push --force-with-lease origin (git_current_branch) $argv
end
