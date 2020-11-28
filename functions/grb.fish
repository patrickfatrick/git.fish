function grb -w 'git rebase' -d 'Forward-port local commits to the updated upstream head'
  git rebase $argv
end
