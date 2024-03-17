
#!/usr/bin/env bash
set -eou pipefail

scrDir="$HOME/.scripts"
binDir="$HOME/.local/bin"

mkdir -p $binDir

echo "Symlinking scripts..."
for i in $scrDir/*; do
  chmod u+x $i

  filename=$(basename "$i" .sh)
  
  if [[ -f $binDir/$filename ]]; then
    continue
  fi
  (ln -s $i $binDir/$filename)
  echo "Symlinking $filename"
done
echo "Done"
