function git_main_branch -d "Returns the name of the main branch: main if it exists, master otherwise"
  for branch in main trunk
    if command git show-ref -q --verify refs/heads/$branch
      echo $branch
      return
    end
  end

  echo master
end
