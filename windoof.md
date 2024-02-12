# Windoof

## for loops and sed
replace `\r\n` by `\n` in all *.c files:
```
FOR /R . %%f in (*.c) do sed -i "s/\r$//" "%%f"
```

replace `\r\n `by `\n` in all *.h files:
```
FOR /R . %%f in (*.h) do sed -i "s/\r$//" "%%f"
```

or single file:
```
sed -i "s/\r\r$// <file_name>"
```


## day by day
add dir to PATH:

```
set PATH=%PATH%;e:\Tools\MinGW\bin\
```