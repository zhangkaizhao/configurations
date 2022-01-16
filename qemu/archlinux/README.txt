https://drewdevault.com/2018/09/10/Getting-started-with-qemu.html

Arch-Linux-x86_64-basic-20211201.40458.qcow2

----
https://bbs.archlinux.org/viewtopic.php?id=262818
A basic image was added recently which comes preconfigured with a user (user/pw: arch/arch). I think it is what you want
----

https://gitlab.archlinux.org/archlinux/arch-boxes

2021-12-21

-------
https://www.arthurkoziel.com/qemu-ubuntu-20-04/

Boot machine with Ubuntu ISO mounted

We can now boot up the machine with the Ubuntu ISO attached as a

In this step we boot up the machine with the Ubuntu ISO mounted in the CD drive:

qemu-system-x86_64 \
    -machine type=q35,accel=hvf \
    -smp 2 \
    -hda ubuntu-20.04.1-desktop-amd64.qcow2 \
    -cdrom ./ubuntu-20.04.1-desktop-amd64.iso \
    -m 4G \
    -vga virtio \
    -usb \
    -device usb-tablet \
    -display default,show-cursor=on

The options are:

    -machine: The emulated machine and the accelerator. q35 is the newest machine type and HVF is the macOS native hypervisor.
    -smp: Number of CPUs to use
    -m: Amount of memory to use
    -hda: Disk drive (the one we created earlier)
    -cdrom: The ISO image to put into the CD drive
    -vga: The graphic card to use. I found virtio (based on Virgil to have the best performance
    -usb: Enable USB host controller
    -device Adding a “usb-tablet” as an input device. I’m running this on a laptop and without this setting the mouse did not work.
    -display: To show the mouse cursor (disabled by default)

During testing I had problems with the Linux kernel as it would panic during the boot process. The issue was the -cpu parameter. I fixed it by specifying the CPU architecture manually (see qemu-system-x86_64 -cpu help for a list of all available architectures).

My machine has an IvyBridge processor (Core i7):

$ sysctl -n machdep.cpu.brand_string

Intel(R) Core(TM) i7-3740QM CPU @ 2.70GHz

And using -cpu IvyBridge would fail. However when using -cpu Nehalem (also an i7 CPU) everything worked well.

Now after the machine is booted up the Ubuntu installer will run. Follow the installation steps and don’t restart the VM at the end of the installation, instead shut it down by stopping the qemu process with CTRL-C on the host.

Boot without ISO mounted

When running the VM we don’t need the Ubuntu ISO mounted and can remove it by leaving out the -cdrom option:

qemu-system-x86_64 \
    -machine type=q35,accel=hvf \
    -smp 2 \
    -hda ubuntu-20.04.1-desktop-amd64.qcow2 \
    -m 4G \
    -vga virtio \
    -usb \
    -device usb-tablet \
    -display default,show-cursor=on

-------
