function gmum -w 'git merge' -d 'Merge the upstream main branch into the current local branch'
  git merge upstream/(git_main_branch) $argv
end
