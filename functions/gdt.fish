function gdt -w 'git diff-tree --no-commit-id --name-only -r'
  git diff-tree --no-commit-id --name-only -r $argv
end
