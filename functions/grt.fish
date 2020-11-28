function grt -w 'cd' -d 'cd to the repository root'
  cd (git rev-parse --show-toplevel || echo .) $argv
end
