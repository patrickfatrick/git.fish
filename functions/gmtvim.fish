function gmtvim -w 'git mergetool' -d 'Run merge conflict resolution tools to resolve merge conflicts Run merge conflict resolution tools to resolve merge conflicts'
  git mergetool --no-prompt --tool=vimdiff $argv
end
