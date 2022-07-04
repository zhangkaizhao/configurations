wsl.conf for WSL distributions

https://docs.microsoft.com/en-us/windows/wsl/wsl-config

> You can configure the settings for your installed Linux distributions
> that will automatically be applied every time you launch WSL in two
> ways, by using:

> * `.wslconfig` to configure settings *globally* across all installed distributions running on WSL 2.
> * `wsl.conf` to configure settings *per-distribution* for Linux distros running on WSL 1 or WSL 2.

> Both file types are used for configuring WSL settings, but the
> location where the file is stored, the scope of the configuration,
> and the version of WSL running your distribution all impact which file
> type to choose.

Place `wsl.conf` as `/etc/wsl.conf` in installed WSL distributions.
