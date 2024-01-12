# adb android

# use adb for android
- `sudo adb kill-server`: kill adb server (host)
- `sudo adb start-server`: restart adb server (host)
- `adb shell pidof -s <namespace>`: get PID for app with certain namespace
- `adb logcat --pid=<pid>`: filter log output using PID