function git_develop_branch -d "Returns the name of the main branch: dev, develop, or development if it exists, develop otherwise"
  command git rev-parse --git-dir &>/dev/null; or return
  for branch in dev devel development
    if command git show-ref -q --verify refs/heads/$branch
      echo $branch
      return
    end
  end

  echo develop
end
