function gmom -w 'git merge' -d 'Merge the local main branch into the current local branch'
  git merge origin/(git_main_branch) $argv
end
