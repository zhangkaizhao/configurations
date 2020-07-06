# EFI

Boot with rEFInd:

* Windows 10
* FreeBSD (removed since 2020-07, replaced by Fedora via Syslinux)
* Syslinux (for XFS file system support)
* Arch Linux
* OpenBSD

Boot with Syslinux:

* Fedora


----

Q: Why not boot Fedora with rEFInd directly?

A: Reasons:

* The file system type of root partition of Fedora is XFS.
* At the moment, rEFInd 0.12.0 does not have official support for XFS file system.
* The recommened EFI drivers by rEFInd [1] (Pete Batard's efifs drivers [2]) do not work for XFS on my machine.

Latest versions at the moment (2020-07):

* rEFInd 0.12.0
* efifs 1.6 (tested from 1.1 to 1.6 and they all do not work with rEFInd for XFS)


----

[1]: https://rodsbooks.com/refind/drivers.html#finding

[2]: https://efi.akeo.ie/
