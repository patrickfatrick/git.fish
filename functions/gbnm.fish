function gbnm -w 'git branch' -d 'List, create, or delete branches'
  git branch --no-merged $argv
end
