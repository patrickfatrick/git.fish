function gbl -w 'git blame' -d 'Show what last modified each line of a file'
  git blame -b -w $argv
end
