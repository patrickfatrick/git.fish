function gunwip -d 'Undo WIP commit'
  git log -n 1 | grep -q -c -e "--wip--"; and git reset HEAD~1
end
