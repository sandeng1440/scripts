
#!/usr/bin/env bash
set -eou pipefail

scrDir="$HOME/repo/scripts"
binDir="$HOME/.local/bin"

if [ ! -d $binDir ]; then
  mkdir -p $binDir
fi

echo "Symlinking scripts..."
for i in $scrDir/*; do
  if [[ $i == *.sh ]]; then
    chmod u+x $i

    filename=$(basename "$i" .sh)
    
    if [[ -f $binDir/$filename ]]; then
      continue
    fi
    (ln -s $i $binDir/$filename)
    echo "Symlinking $filename"
  fi
done
echo "Done"
