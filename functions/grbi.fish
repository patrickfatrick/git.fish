function grbi -w 'git rebase' -d 'Reapply commit sequence on a new base'
  git rebase -i $argv
end
