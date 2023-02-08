function gcount -w 'git shortlog' -d 'Show commit shortlog'
  git shortlog -sn $argv
end
