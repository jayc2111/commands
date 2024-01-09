# LPIC-1

## 101

### Hardwarekomponenten (dynamisches Laufwerk)
```
/proc/
 ├── interrupts             system interrupts
 ├── ioports                IO-Adressen
 ├── ~scsi~                 serielle Geräte
 ├── ~dma~                  direct memory access
 ├── ~pci~                  siehe unten
 ├── bus/
 │   └── pci                alle angeschlossenen PCI Geräte   lspci <-vvv> 
 ├── modules                alle geladenen Kernel Module      lsmod
 └── sys/   
     └── kernel
         ├── osrelease
         ├── ostype         Kernel config im RAM
         ├── hostname
         └── modprobe
``` 
### virtuelle Dateisystem (dynamisches Laufwerk)
```
/sys/
 ├── block
 ├── bus
 ├── class                  Treibermodule des laufend. Kernels
 ├── dev
 ├── devices
  ...
 └──
```

### Gerätedateien (dynamisches Laufwerk)
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
 │   └── usb        alle angeschlossenen USB Geräte   lsusb <-t> 
 └── sda1/
  ...
 ├── sdaN/
 ├── sdb1/
 └── sdc1/
```

### systemd
```
/usr/
 └── lib/systemd/system   Startskripte
 
/lib/
 └── systemd/system       Startskripte (wenn nicht unter /usr/)

/etc/
 └── systemd/system       Symlinks auf Startskripte
```

### wichtige Programme
```
/sbin/
 ├── init           init deamon
 ├── mingetty       Helferlein, um virtuelle Konsolen zu öffnen
 └── modprobe       schweizer Taschenmesser für Kernel Module
```


### misc
```
/boot/
 ├── efi            EFI partition
 ├── initrd         Initiales RAM disk image ("Lesen von der HDD bevor Treiber geladen")
 └── grub/
     └── grub.cfg   kernel boot parameter 

/etc/
 ├── init.d         Verzeichnis mit Skripten, die der init-deamon startet (auch /etc/rc.d)
 └── inittab        Konfigurationsdabei für den init-daemon

/var/
 └── log/
     └── messages   (oder auch syslog) dmesg-Ausgaben von vorherigen Systemstarts

```
