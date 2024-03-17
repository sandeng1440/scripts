
#!/usr/bin/env bash
set -eou pipefail

### Script to update my git repos

directories=(
  "$HOME/.scripts"
  "$HOME/docs" 
  "$HOME/notes" 
  "$HOME/.config/nvim"
)

echo "Starting Gitup..."
echo "---------------------------------"
for dir in ${directories[@]}; do
  echo "Gitting $(basename $dir)..."
  cd $dir || exit
  if [[ $(git status --porcelain) ]]; then
    git add .
    git commit -m "Auto commit"
    git push origin main
    echo "Push successful"
  else
    echo "Nothing to commit in $(basename $dir)"
  fi
  cd - >/dev/null || exit
  echo "---------------------------------"
done
echo "Gitup done"


