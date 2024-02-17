# cmake
generate eclipse project for cross compilation:
```
cmake -G"Eclipse CDT4 - Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=<name>.cmake <source_path>
```

only link what you use:
```
set(CMAKE_LINK_WHAT_YOU_USE TRUE)
```

