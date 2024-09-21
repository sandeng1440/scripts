#!/usr/bin/env bash

set -euo pipefail

nix-env -irf ~/.scripts/user.nix
