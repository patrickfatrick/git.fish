function gds -w 'git diff' -d 'Show changes between commits or commit and working tree'
  git diff --staged $argv
end
