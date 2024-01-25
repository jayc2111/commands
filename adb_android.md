# adb android

# use adb for android
- `adb shell`: open shell on android device
- `adb devices`: list connected devices
- `adb tcpip <port>`: set port for ip connection
- `adb connect <ip_addr>`: connect to device via IP
- `sudo adb kill-server`: kill adb server (host)
- `sudo adb start-server`: restart adb server (host)
- `adb shell pidof -s <namespace>`: get PID for app with certain namespace
- `adb logcat --pid=<pid>`: filter log output using PID