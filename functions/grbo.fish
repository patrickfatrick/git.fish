function grbo -w 'git rebase' -d 'Reapply commit sequence on a new base'
  git rebase --onto $argv
end
