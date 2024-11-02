#!/bin/sh
# 2024-09-17 https://wiki.nixos.org/wiki/FAQ
ls -1 /nix/store | sort -R -t - -k 2 | less
