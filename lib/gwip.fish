function gwip -d "Commit a WIP commit"
  git add -A
  git rm (git ls-files --deleted) 2> /dev/null
  git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"
end
