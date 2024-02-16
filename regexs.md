# regexs

strings with part-wise same content:
```
PB_2_71_.*0x.{22}89|PB_71_2_.*0x.{22}89
```

strings acreoos multiple lines:
```
send_data .*(\n.*){3,}?\n.*send_data end--------
```

find across line break:
```
RecAddr=2\t*SndAddr=90.*[^\n]*\n.*Data 
```

OR-concatenation:
```
MVBTPort880|MVBTPort8A0|MVBTPort622
```

find not equal to giving string:
```
sap (?!19)
```

convert date string to dotted format:
```
echo '1032020' | sed 's/[0-9]\{4\}$/.&/g' | sed 's/[0-9]\{2\}\./.&/g'
```
> remember: `$` before the linebreak, digits always with `[0-9]`, escape bracket and dots
