function gcl -w 'git clone' -d 'Clone a repository into a new directory'
  git clone --recurse-submodules $argv
end
