# LPIC-1

## 101

### hardware components (dynamic drive)
```
/proc/
 ├── interrupts             system interrupts
 ├── ioports                IO-addresses
 ├── ~scsi~                 serial devices
 ├── ~dma~                  direct memory access
 ├── ~pci~                  see below
 ├── bus/
 │   └── pci                all connected PCI devices    lspci <-vvv>
 ├── modules                all loaded kernel modules    lsmod
 └── sys/
     └── kernel
         ├── osrelease
         ├── ostype         kernel config in RAM
         ├── hostname
         └── modprobe
```
### virtuall file system (dynamic drive)
```
/sys/
 ├── block
 ├── bus
 ├── class                  driver modules of the running kernel
 ├── dev
 ├── devices
  ...
 └──
```

### device files (dynamic drive)
```
/dev/
 ├── null
 ├── zero
 ├── stdin
 ├── stdout
 ├── stderr
 ├── tty*
 ├── random
 ├── bus/
 │   └── usb                all connected USB devices   lsusb <-t>
 └── sda1/
  ...
 ├── sdaN/
 ├── sdb1/
 └── sdc1/
```

### systemd
```
/usr/
 └── lib/systemd/system     start scripts

/lib/
 └── systemd/system         start scripts (if not under /usr/)

/etc/
 └── systemd/system         symlinks to start scripts
```

### important apps
```
/sbin/
 ├── init                   init deamon
 ├── mingetty               helper to open virtual consoles
 └── modprobe               swiss army knife for kernel modules
```


### misc
```
/boot/
 ├── efi                    EFI partition
 ├── initrd                 Initial RAM disk image ("read from HDD before driver has been loaded")
 └── grub/
     └── grub.cfg           kernel boot parameter

/etc/
 ├── init.d                 directory with Scripts that start the init-deamon (also /etc/rc.d)
 └── inittab                config-file for init-daemon

/var/
 └── log/
     └── messages           (or syslog) dmesg-output from the previous system start

```
