function gcml -w 'git pull' -d 'Checkout main branch, and then pull remote changes'
  git checkout (__git_main_branch); and git pull origin (__git_main_branch) $argv
end
