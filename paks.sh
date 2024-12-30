#!/usr/bin/env bash

yay -S --needed - < <(grep -v '^#' ~/repo/scripts/packages.pacman.txt)

