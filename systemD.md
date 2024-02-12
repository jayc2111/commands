# systemD

## dbus unit tests

list of all services:
```
dbus-send --print-reply --dest=org.freedesktop.DBus  /org/freedesktop/DBus org.freedesktop.DBus.ListNames
``` 
(see also `busctl tree`, `busctl list --system`)

sending test messages:
```
#!/bin/bash

my_dbusSend()
{
    dbus-send --print-reply --dest=$1 /${1//[.]//} $1.$2 $3 1>/dev/null
}

my_dbusSend de.jvag.dbus.starfireconfig setSfActivationKey string:01234567890123456789012345678901
```

monitoring messages:
```
dbus-monitor interface='de.jvag.dbus.starfireconfig'
``` 

## links
[creating a timer](https://wiki.archlinux.de/title/Systemd/Timers)  
[add a unit](https://pygobject.readthedocs.io/en/latest/getting_started.html#ubuntu-getting-started)
