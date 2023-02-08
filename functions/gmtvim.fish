function gmtvim -w 'git mergetool' -d 'Run merge conflict resolution tool'
  git mergetool --no-prompt --tool=vimdiff $argv
end
