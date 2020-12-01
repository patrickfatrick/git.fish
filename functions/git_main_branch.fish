function git_main_branch -d "Output the main branch name (one of main, trunk, master)"
  for branch in main trunk
    if command git show-ref -q --verify refs/heads/$branch
      echo $branch
      return
    end
  end

  echo master
end
