function grbc -w 'git rebase' -d 'Reapply commit sequence on a new base'
  git rebase --continue $argv
end
