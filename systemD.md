# systemD

## create timer on systemd
https://wiki.archlinux.de/title/Systemd/Timers

## python systemD unit
https://pygobject.readthedocs.io/en/latest/getting_started.html#ubuntu-getting-started


## dbus unit tests

## List of services
- `dbus-send --print-reply --dest=org.freedesktop.DBus  /org/freedesktop/DBus org.freedesktop.DBus.ListNames`: 
(see also `busctl tree`, `busctl list --system`)

## sending
```
#!/bin/bash

my_dbusSend()
{
    dbus-send --print-reply --dest=$1 /${1//[.]//} $1.$2 $3 1>/dev/null
}

my_dbusSend de.jvag.dbus.starfireconfig setSfActivationKey string:01234567890123456789012345678901

```

## receiving
- `dbus-monitor interface='de.jvag.dbus.starfireconfig'`: 