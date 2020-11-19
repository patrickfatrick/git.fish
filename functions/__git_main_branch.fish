function __git_main_branch
  for branch in main trunk
    if command git show-ref -q --verify refs/heads/$branch
      echo $branch
      return
    end
  end

  echo master
end
