function git_work_in_progress -d "Echoes a warning if the current branch is a wip"
  if git log -n 1 2>/dev/null | grep -q -c -e "--wip--"
    echo "WIP!!"
  end
end