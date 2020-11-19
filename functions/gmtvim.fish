function gmtvim -w 'git mergetool --no-prompt --tool=vimdiff'
  git mergetool --no-prompt --tool=vimdiff $argv
end
