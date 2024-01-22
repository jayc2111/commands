# Windoof

## for loops and replacements
- `FOR /R . %%f in (*.c) do sed -i "s/\r$//" "%%f"`: replace \r\n by \n in all *.c files
- `FOR /R . %%f in (*.h) do sed -i "s/\r$//" "%%f"`: replace \r\n by \n in all *.h files
- `sed -i "s/\r\r$//"`


## Add to PATH in CMD
```
set PATH=%PATH%;e:\Tools\MinGW\msys\1.0\bin\
set PATH=%PATH%;e:\Tools\MinGW\bin\
set PATH=%PATH%;e:\Tools\Cygwin\bin\
set PATH=%PATH%;c:\Program Files\Git\bin\
set PATH=%PATH%;C:\Program Files (x86)\GnuWin32\bin;e:\Tools\X-compilers\CoVAP\lin_611_windows\bin\ 

set PATH=%PATH%;
set PATH=%PATH%;C:\Users\axxessio\AppData\Local\Programs\Python\Python310\
```