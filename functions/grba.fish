function grba -w 'git rebase' -d 'Reapply commit sequence on a new base'
  git rebase --abort $argv
end
