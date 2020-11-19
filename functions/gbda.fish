function gbda
  git branch --no-color --merged | command grep -vE '^(+|*|\s*((__git_main_branch)|development|develop|devel|dev)\s*$)' | command xargs -n 1 git branch -d $argv
end
