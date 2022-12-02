function grba -w 'git rebase' -d 'Forward-port local commits to the updated upstream head Forward-port local commits to the updated upstream head'
  git rebase --abort $argv
end
