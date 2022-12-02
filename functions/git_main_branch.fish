function git_main_branch -d "Returns the name of the main branch: main or trunk if it exists, master otherwise"
  command git rev-parse --git-dir &>/dev/null; or return
  for branch in main trunk
    if command git show-ref -q --verify refs/heads/$branch
      echo $branch
      return
    end
  end

  echo master
end
