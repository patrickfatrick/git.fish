function glol -w 'git log' -d 'Show commit logs'
  git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" $argv
end
