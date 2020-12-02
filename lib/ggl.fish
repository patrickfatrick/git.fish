function ggl -w 'git pull' -d 'Pull the current branch from origin'
  git pull origin (git_current_branch) $argv
end
