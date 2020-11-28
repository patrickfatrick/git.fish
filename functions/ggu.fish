function ggu -w 'git pull' -d 'Pull current branch from origin and rebase'
  git pull --rebase origin (__git_current_branch) $argv
end
