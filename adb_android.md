# adb android

## basics
open shell on android device:
```sh
adb shell
```

list connected devices:
```sh
adb devices
```

set port for ip connection:
```sh
adb tcpip <port>
```

connect to device via IP:
```sh
adb connect <ip_addr>
```

kill adb server (host):
```sh
sudo adb kill-server
```

restart adb server (host):
```sh
sudo adb start-server
```

## working with logs

get PID for app with certain namespace:
```sh
adb shell pidof -s <namespace>
```

filter log output using PID:
```sh
adb logcat --pid=<pid>
```
