function gacamb -w 'git commit' -d 'Stage all files (including untracked) and then commit with branch name prepended'
  gaa; and git commit -m (echo [(git_current_branch)] $argv)
end
