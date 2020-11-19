function gwip
  git add -A; and git rm (git ls-files --deleted) 2> /dev/null; and git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"
end
