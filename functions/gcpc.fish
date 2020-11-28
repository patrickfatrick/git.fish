function gcpc -w 'git cherry-pick' -d 'Apply the change introduced by an existing commit'
  git cherry-pick --continue $argv
end
