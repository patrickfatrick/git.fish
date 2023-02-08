function gcpa -w 'git cherry-pick' -d 'Reapply a commit on another branch'
  git cherry-pick --abort $argv
end
