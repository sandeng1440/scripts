
#!/usr/bin/env bash
set -eou pipefail

### Script to update my git repos

directories=(
  "$HOME/repo/scripts"
  "$HOME/repo/docs" 
  "$HOME/repo/notes" 
  "$HOME/repo/devel"
  "$HOME/repo/aoc"
  "$HOME/.config/nvim"
  # "$HOME/.config/kickstart"
)

echo "Starting Gitup..."
echo "--------------------------------------------------------------------------------"
for dir in ${directories[@]}; do
  echo "Gitting $(basename $dir)..."
  cd $dir || exit
  if [[ $(git status --porcelain) ]]; then
    git add .
    git commit -m "Gitup commit"
    git pull --rebase
  else
    echo "Nothing to commit in $(basename $dir)"
  fi
  git push
  echo "Push successful"
  cd - >/dev/null || exit
  echo "--------------------------------------------------------------------------------"
done
echo "Gitup done"


