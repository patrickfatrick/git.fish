function grbs -w 'git rebase' -d 'Reapply commit sequence on a new base'
  git rebase --skip $argv
end
