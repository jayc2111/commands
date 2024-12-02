# systemD

## dbus unit tests

list of all services:
```sh
dbus-send --print-reply --dest=org.freedesktop.DBus  /org/freedesktop/DBus org.freedesktop.DBus.ListNames
``` 
(see also `busctl tree`, `busctl list --system`)

sending test messages:
```sh
#!/bin/bash

my_dbusSend()
{
    dbus-send --print-reply --dest=$1 /${1//[.]//} $1.$2 $3 1>/dev/null
}

my_dbusSend <namespace> <method> <arg_type>:<arg>
```
alternative:
```
busctl call <service> <path> <interface> -- <method> <argument_format_string> <arguments>
busctl call org.freedesktop.Avahi / org.freedesktop.Avahi.Server -- ResolveAddress "iisu" -1 -1 "127.0.0.1" 0
```


monitoring messages:
```sh
dbus-monitor interface='<namespace>'
dbus-monitor "type='signal',sender='org.gnome.TypingMonitor',interface='org.gnome.TypingMonitor'"
``` 

## links
[creating a timer](https://wiki.archlinux.de/title/Systemd/Timers)  
[add a unit](https://pygobject.readthedocs.io/en/latest/getting_started.html#ubuntu-getting-started)
[DBUS type system](https://dbus.freedesktop.org/doc/dbus-specification.html#type-system)