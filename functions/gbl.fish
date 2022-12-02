function gbl -w 'git blame' -d 'Show what revision and author last modified each line of a file Show what revision and author last modified each line of a file'
  git blame -b -w $argv
end
