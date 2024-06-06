# configurations of Gentoo running on Linode VPS

2024-05:
The Linode VPS was deleted in 2024-05 due to unused for a long time.
And the Gentoo OS on it was removed in the meanwhile, of course.

Package system: Portage.

Other programs: local programs, and user binaries.

And some soft links.

## Portage

[portage-world.txt](portage-world.txt): installed packages

## Others

[Local programs](local-programs.txt) which mostly put in `/usr/local`

[User binaries](user-binaries.txt) which mostly put in `~/`

[Soft links](soft-links.txt)

And more:

[cron jobs](crontab-l.txt): `crontab -l` as root account

[eselect](eselect.txt): selected eselect options

[letsencrypt certificates](certbot-certificates.txt): `certbot certificates` as root account

[services of default level](rc-config-list-default.txt): `rc-config list default` as root account
