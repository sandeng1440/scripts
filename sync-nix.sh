#!/usr/bin/env bash

set -euo pipefail

nix-env -irf ~/repo/scripts/packages.nix
