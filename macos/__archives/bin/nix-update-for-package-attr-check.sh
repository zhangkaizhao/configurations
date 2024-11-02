#!/bin/sh
# usage: cat [package (with attr) list file] | nix-update-for-package-attr-check.sh
xargs -t -L 1 nix-env -iA --dry-run
