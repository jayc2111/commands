# general

## alias
|command|description|
|-|-|
| `alias ll='ls -lah'` | create new alias for 'll'|

## archives
|command|description|
|-|-|
| ```tar cvfz archive.tar.gz `find . -maxdepth 1 -type f -print` ``` | create a zipped tar archive only containing files|

## customized listing
|command|description|
|-|-|
| `ls <prefix>??.<extension> \| xargs -I{} cat {} \| cut -b 1-19` | list group of files and cut some letters from the names|

## time conversions
|command|description|
|-|-|
| `date +%s` | current unix time (localtime)|
| `date +%s -d "2023-01-05 12:00:00" ` | specific unix time (localtime)|
| `date -d@1672740300` | current unix time (localtime)|

## compare directories/ files
Using the given option allows compare even if files have different line endings:
|command|description|
|-|-|
| `diff -r --strip-trailing-cr <file1> <file2>` | compare 2 files|
| `diff -r --strip-trailing-cr <directory1> <directory2>` | compare 2 directories (show also file content diff)|
| `diff -qr --strip-trailing-cr <directory1> <directory2> \| grep 'differ'` | compare 2 directories, show only differencing files|
| `diff -qr --strip-trailing-cr <directory1> <directory2> \| sort` | compare 2 directories and sort diff|

## reading log files
|command|description|
|-|-|
| `tail -f <filename>` | read new lines at file end|
| `less -NR <filename>` | read log file with ANSI colors and line numbers|

## read file line by line
|command|description|
|-|-|
| `for line in $(cat <filename>);do echo $line \| cut -f1 -d$'\t'; done` | if line contents are separated by tabs|
| `while read p;do echo $p \| cut -f1-3 -d' '; done < <filename>` | pipe into loop|
| `while IFS=$'\t' read <var1> <var2> <var3>; do echo -n "<var1> "; done < <filename>` | pipe into loop, split to variables|

## automation
|command|description|
|-|-|
| `watch -n <time_seconds> "<command>"` | repeat command continuously|
| `while true; do <command>; sleep 5; done` | do continuously|

### one line loops
|command|description|
|-|-|
| `for i in {1..5};do echo $i; sleep 1; done` | do something 5 times|
| `for f in ./<prefix>*.<type>; do mv "$f" "${f#./<prefix>}"; done` | rename multiple files with a prefix|

## remove ansi color codes
|command|description|
|-|-|
| `\e\[(.*?)m` | regex for Notepad++|
| `sed -e 's/\x1b\[[0-9;]*m//g'` | with sed |

## greps greps greps
|command|description|
|-|-|
| `grep -R $'\t' --color`       | non-printable characters                   |
| `grep -ir --include=*.c  <>`  | case insensitive, recursive, file filtered |
| `grep -nirE '<>'`             | search regexe with line number             |
| `grep -ilr <>`                | filename only                              |
| `grep -oE "[0-9]{3} ms"`      | with regex, repetition, match only         |
| `grep -I  <>`                 | exclude binaries                           |
| `grep -ir <> \| grep -v  <>`  | filter out with antipattern                |


## ip link
|command|description|
|-|-|
| `ip link set dev <interface> down` | bring interface down|
| `ip link set dev <interface> up` | bring interface up|
