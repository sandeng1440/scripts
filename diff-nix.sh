#!/usr/bin/env bash
#!nix-shell -i bash -p janet jq bash
set -euo pipefail

query() {
  nix-env -q "$@" --json | jq -r '.[] | .pname + " " + .version'
}

janet "$HOME/repo/scripts/version-diff.janet" \
  <(query) \
  <(query -af ~/repo/scripts/packages.nix)
