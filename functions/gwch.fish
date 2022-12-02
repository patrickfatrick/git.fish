function gwch -w 'git whatchanged' -d 'Show logs with difference each commit introduces Show logs with difference each commit introduces'
  git whatchanged -p --abbrev-commit --pretty=medium $argv
end
