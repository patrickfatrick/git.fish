function git_current_user_name -d "Returns the user.name config value"
  git config --get user.name
end
