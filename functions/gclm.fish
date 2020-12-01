function gclm -w 'git pull' -d 'Checkout main branch, and then pull remote changes'
  git checkout (git_main_branch); and git pull origin (git_main_branch) $argv
end