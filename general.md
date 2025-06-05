# general

## alias
create new alias for 'll':
```sh
alias ll='ls -lah'
```

## archives
create a zipped tar archive only containing files:
```sh
tar cvfz archive.tar.gz `find . -maxdepth 1 -type f -print`
```

## customized listing
list group of files and cut some letters from the names:
```sh
ls <prefix>??.<extension> | xargs -I{} cat {} | cut -b 1-19
```

## time conversions
current unix time (localtime):
```sh
date +%s
```

date format to unix time (localtime):
```sh
date +%s -d "2023-01-05 12:00:00"
```

unix time to date format (localtime):
```sh
date -d@1672740300
```

## compare directories/ files
Using the given option allows compare even if files have different line endings:  

### compare 2 files:
plain:
```sh
diff -r --strip-trailing-cr <file1> <file2>
```
filter changes w.r.t differences:
```
diff --changed-group-format='%<' --unchanged-group-format='' file1 file2 > only_f1
diff --changed-group-format='%>' --unchanged-group-format='' file1 file2 > only_f2
```
```
comm -23 file1 file2 > only_f1
comm -13 file1 file2 > only_f2
```

### compare 2 directories (show also file content diff):
show also file content diff:
```sh
diff -r --strip-trailing-cr <directory1> <directory2>
```

show only differing files:
```sh
diff -qr --strip-trailing-cr <directory1> <directory2> | grep 'differ'
```

sort diff:
```sh
diff -qr --strip-trailing-cr <directory1> <directory2> | sort
```

## DNS cache reset
```sh
sudo resolvectl flush-caches
```

## reading log files
read new lines at file end:
```sh
tail -f <filename>
```

read log file with ANSI colors and line numbers:
```sh
less -NR <filename>
```

## read file line by line
if line contents are separated by tabs:
```sh
for line in $(cat <filename>);do echo $line | cut -f1 -d$'\t'; done
```

pipe file into while loop:
```sh
while read p;do echo $p | cut -f1-3 -d' '; done < <filename>
```

pipe into loop, split to variables:
```sh
while IFS=$'\t' read <var1> <var2> <var3>; do echo -n "<var1> "; done < <filename>
```

pipe into file:
```sh
cat << EOF >> /path/filename

content
content
content
EOF
```

## automation
repeat command continuously:
```sh
watch -n <time_seconds> "<command>"
```

repeat command continuously in loop:
```sh
while true; do <command>; sleep 5; done
```

## mounting
SMB mount:
```sh
sudo mount -t cifs -o username=<user> //<rem_host>/<rem_path> /<local_path>
```
NFS mount:
```sh
sudo mount -t nfs -o soft <rem_host>:/<rem_path> /<local_path>
```

## one line loops
do something 5 times:
```sh
for i in {1..5}; do echo $i; sleep 1; done
```
rename multiple files with a prefix:
```sh
for f in ./<prefix>*.<type>; do mv "$f" "${f#./<prefix>}"; done
```

## remove ansi color codes
regex for Notepad++:
```sh
\e\[(.*?)m
```
with sed:
```sh
sed -e 's/\x1b\[[0-9;]*m//g'
```

## string replacement
using awk (advanced tool):
```sh
awk '/<pattern>/,/<substitute>/' <filename>
```

using sed (simple tool):
```sh
sed -i 's/<pattern1>/<substitute1>/g; s/<pattern2>/<substitute2>/g;' <filename>
```

## gpio
read all pins state:
```sh
gpio readall -a
```

export with:
```sh
gpio export <pin> <in/out>
```

undo export:
```sh
gpio unexport <pin>
```

check specific gpio:
```sh
cat /sys/class/gpio/gpio<pin>/value
```

undo export:
```sh
gpio -g read <pin>
```

with value '1' or '0':
```sh
gpio -g write <pin> <value>
```

## greps greps greps
non-printable characters:
```sh
grep -R $'\t' --color
```

case insensitive, recursive, file type filtered:
```sh
grep -ir --include=*.c <>
```

search regexe with line number:
```sh
grep -nirE '<>'
```

show filename only, case-invariant:
```sh
grep -ilr <>
```

with regex, repetition, match only:
```sh
grep -oE "[0-9]{3} ms"
```

exclude binaries:
```sh
grep -I <>
```

filter out with antipattern, case-invariant:
```sh
grep -ir <> | grep -v <>
```

match only, without filename:
```sh
grep -oh <>
```

inverted - sort - remove duplicates:
```sh
grep -v <> | sort | uniq
```

first characters of a line:
```sh
cat names.list | grep '^PRFX_'
```

[guru99_expressions](https://www.guru99.com/linux-regular-expressions.html)

## users & groups

show all users with their groups:
```sh
cat /etc/passwd
```

show all groups and their users:
```sh
cat /etc/group
getent group | grep "<groupname>"
```

check if user exists and add:
```sh
if ! id -u "<name>" >/dev/null 2>&1; then
    useradd -r -d "/home/<name>" -s /bin/sh <name>
    echo "added user \"<name>\""
fi
```

## do SQL DB backup
```

user=<>
passwd=<>
db=<>


mysqldump \
--add-drop-database \
--add-drop-table \
--create-options \
--default-character-set=utf8 \
--disable-keys \
--order-by-primary \
--quick \
--quote-names \
--set-charset \
--dump-date \
--comments \
--no-autocommit \
--skip-dump-date \
--single-transaction \
--user="$user" \
--password="$passwd" \
--databases "$db" |
bzip2 -c9 > "backup.sql.bz2" ||
{
        # Remove, as it is either empty or contains garbage on failure
        rm -f "backup.sql.bz2"
        exit 2
}
echo "$db done"
```
