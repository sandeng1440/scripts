
#!/usr/bin/env bash
set -eou pipefail

### Script to update my git repos

directories=(
  "$HOME/.scripts"
  "$HOME/Docs" 
  "$HOME/Notes" 
  "$HOME/PLP"
  "$HOME/.config/nvim"
  "$HOME/.config/kickstart"
  "$HOME/Devel"
)

echo "Starting Gitup..."
echo "--------------------------------------------------------------------------------"
for dir in ${directories[@]}; do
  echo "Gitting $(basename $dir)..."
  cd $dir || exit
  if [[ $(git status --porcelain) ]]; then
    git add .
    git commit -m "Gitup commit"
  else
    echo "Nothing to commit in $(basename $dir)"
  fi

  if ![[$(git push)]]; then
    git push origin main
  fi
  echo "Push successful"
  cd - >/dev/null || exit
  echo "--------------------------------------------------------------------------------"
done
echo "Gitup done"


