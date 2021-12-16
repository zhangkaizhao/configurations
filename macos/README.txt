# configurations on macOS

Package systems: Homebrew, MacPorts, Nix, pkgsrc.

Other applications/programs: applications installed manually, local programs, user programs and user local programs.

## Homebrew

[brew.txt](brew.txt): what kind of package to install

[brew-taps.txt](brew-taps.txt): Taps used

[brew-install.txt](brew-install.txt): `brew install` history

[brew-leaves.txt](brew-leaves.txt): `brew leaves --installed-on-request`

[brew-cask-list.txt](brew-cask-list.txt): `brew list --cask`

## MacPorts

[port-install.txt](port-install.txt): installed packages

[port-select.txt](port-select.txt): selected derivations

[port-load.txt](port-load.txt): loaded services

[port-absent.txt](port-absent.txt): absent packages

Notes: removed since 2020-11-23.

## Nix

[nix-env-install.txt](nix-env-install.txt): installed packages

[nixpkgs-absent.txt](nixpkgs-absent.txt): absent packages

Notes: removed since macOS Catalina due to [/nix will not be writable on macOS Catalina #2925][nix-issue-2925].

[nix-issue-2925]: https://github.com/NixOS/nix/issues/2925

## pkgsrc

## Other applications

[Applications installed manually](applications-installed-manually.txt) which mostly installed to `/Applications`

[Local programs](local-programs.txt) which mostly put in `/usr/local/programs` or `/usr/local`

[User programs](user-programs.txt) which mostly put in `~/`

[User local programs](user-local-programs.txt) which mostly put in `~/.local/bin`
