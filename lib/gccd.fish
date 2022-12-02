function gccd -w 'git clone --recurse-submodules' -d 'Clone a repository into a new directory Clone a repository into a new directory, and then cd into the newly made directory'
  git clone --recurse-submodules $argv
  cd (basename $argv[-1] .git)
end
