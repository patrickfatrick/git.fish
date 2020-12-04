function gunwip -d 'Uncommit wip branch'
  git log -n 1 2>/dev/null | grep -q -c -e "--wip--"; and git reset HEAD~1
end
