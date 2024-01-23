# performance testing & tracing

## introduce CPU load

### onboard utils
- `nproc | xargs seq | xargs -n1 -P2 md5sum /dev/zero`: useless md5sum calculation
- `while true; do sleep 1; yes > /dev/null & done`: using 'yes' utility (while loop)
- `nproc | xargs seq | xargs -P0 -n1 timeout 5 yes > /dev/null`: using 'yes' utility (number of processors)


### script
[stress-cppu shell script](https://github.com/elandsness/stresscpubash/blob/master/stresscpu.sh)
- `nice -n 10 ./stresscpu.sh  10 300`: run script and set nice values as well



## tracing

### strace
- `strace -p 1383`:  observe process with pid 1383
- `strace -p 1383 -e trace=write`:  observe process with pid 1383 filter "write" messages
- `strace -p 1383 -e trace=write -T`:  observe process with pid 1383 filter "write" messages and show delta -time

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