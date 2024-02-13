# performance testing & tracing

## introduce CPU load

### onboard utils
useless md5sum calculation:
```
nproc | xargs seq | xargs -n1 -P2 md5sum /dev/zero
```

using 'yes' utility (while loop):
```
while true; do sleep 1; yes > /dev/null & done
```

using 'yes' utility (number of processors):
```
nproc | xargs seq | xargs -P0 -n1 timeout 5 yes > /dev/null
```


### script
run script and set nice values as well:
```
nice -n 10 ./stresscpu.sh  10 300
```

[stress-cppu shell script](https://github.com/elandsness/stresscpubash/blob/master/stresscpu.sh)


## tracing

### strace
observe process with pid 1383:
```
strace -p 1383
```

observe process with pid 1383 filter "write" messages:
```
strace -p 1383 -e trace=write
```

observe process with pid 1383 filter "write" messages and show delta -time:
```
strace -p 1383 -e trace=write -T
```

### gcov - how often is a function executed?
1. build your app with flags: `-fprofile-arcs -ftest-coverage`
2. run app (no SIGINT ! otherwise you need to catch it with a signal handler)
3. `gcov <app>`
4. Look into *.gcov files


### find a growing file
1. `iotop` - who is currently writing to disk?
2. `lsof | grep <progress>` - which file is opened by our suspect?
3. maybe also: `htop`
4. `watch du -sh <path>/*`
5. `inotifywait -m -e modify <directory>`


### continously read interfaces
see tool 'bmon'