function grt
  cd "(git rev-parse --show-toplevel || echo .)" $argv
end
