function ggl -w 'git pull' -d 'Pull the current branch from origin'
  git pull origin (__git_current_branch) $argv
end
