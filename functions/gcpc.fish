function gcpc -w 'git cherry-pick' -d 'Reapply a commit on another branch'
  git cherry-pick --continue $argv
end
