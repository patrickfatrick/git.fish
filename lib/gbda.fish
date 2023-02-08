function gbda -d "Delete all branches merged in current HEAD"
  git branch --merged | \
    command grep -vE  (echo '^(\+|\*|\s*('(git_main_branch)'|development|develop|devel|dev)\s*$)') | \
    command xargs -n 1 git branch -d
end
