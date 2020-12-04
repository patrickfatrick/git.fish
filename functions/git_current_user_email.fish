function git_current_user_email -d "Returns the user.email config value"
  git config --get user.email
end
