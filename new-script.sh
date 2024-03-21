
#!/usr/bin/env bash
set -eou pipefail

scrDir="$HOME/.scripts"
binDir="$HOME/.local/bin"

if [ ! -d $binDir ]; then
  mkdir -p $binDir
fi

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
