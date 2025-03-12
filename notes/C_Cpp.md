
All the things, i usually like to remember but always forget about:

# C 

## don't miss cable disconnect
```
int enableKeepAlive = 1;
int maxIdle = 3;
int count = 3;
int interval = 1;

setsockopt(fd, SOL_SOCKET, SO_KEEPALIVE, &enableKeepAlive, sizeof(enableKeepAlive));
setsockopt(fd, IPPROTO_TCP, TCP_KEEPIDLE, &maxIdle, sizeof(maxIdle));
setsockopt(fd, IPPROTO_TCP, TCP_KEEPCNT, &count, sizeof(count));
setsockopt(fd, IPPROTO_TCP, TCP_KEEPINTVL, &interval, sizeof(interval));
```


# C++

## smart pointers
|example|description|
|-|-|
| `std::unique_ptr<type> ptr = std::unique_ptr<type>` (constructor) | A pointer that cleans up behind itself, living in the scope, can not be copied |
| `std::shared_ptr<type> ptr = std::make_shared<type>` (params)     | Like the `unique_ptr`, but lives as long as there are references to it |
| `std::weak_ptr<type>  ptr = std::weak_ptr<type>` (constructor)    | Allows to copy a `shared_ptr` but does not increase the *refCount* |
| `ptr = std::enable_shared_from_this<type>` (constructor)          | Helper to create a `shared_ptr` for a specific object (instead of member variable that counts all instances)

## casts
- `static_cast`: *Equivalent of a C-style cast that does value conversion, or when we need to explicitly up-cast a pointer from a class to its superclass*
- `dynamic_cast`: *Works only with polymorphic class pointers*
- `const_cast`: *Remove the const qualifier*
- `reinterpret_cast `: *Unsafe conversions of pointer types to and from integer and other pointer types. Use this only if we know what we are doing*


[casts on stackoverflow](https://stackoverflow.com/questions/332030/when-should-static-cast-dynamic-cast-const-cast-and-reinterpret-cast-be-used)

## type checking on template
```cpp
template <typename T>
void foo(int a, T b)
{
    if (std::is_same<T, int>::value)
		{ /* ... */ } 

    if (std::is_same<T, double>::value)
		{ /* ... */ } 

}
```
See also `type_traits` in later versions of C++.  
[template parameter on stackoverflow](https://stackoverflow.com/questions/13636540/how-to-check-for-the-type-of-a-template-parameter)


# gdb
coredump an ubuntu 24.04:
```
export LD_LIBRARY_PATH=<additional libs>
ulimit -c unlimited
gdb <path_executable> <path_core>
```

also usefull:
```
find <path> -iname *.core
ll /var/lib/apport/coredump/core.*
cat /var/log/apport.log
```

## cross compiled binary
In case you have no gdb on target but the cross-compiler toolchain on your PC, you can also run the host system's version of GDB and load the target's libararies from the SDK.
```
TOOLCHAIN="<path1>"
GDB=$TOOLCHAIN/<path>/<prefix>-gdb

SYSROOT="<path2>"


EXECUTABLE=<binary_name>
CORE=<core_name>

$GDB -ex "set sysroot $SYSROOT"\
     -ex "set auto-load safe-path /"\
     -ex "file $EXECUTABLE"\
     -ex "core-file $CORE"
     -ex "thread apply all bt full"\
     -ex "quit" > trace.log
```

sometimes easier:
```
$GDB -ex "file $EXECUTABLE"\
     -ex "core-file $CORE"\
	 -ex "set sysroot $SYSROOT"
```


further options:
```
     -ex "set solib-absolute-prefix <>"\
     -ex "set solib-search-path <>"\
     -ex "set debug-file-directory <>"\
```
see also [link](https://tomsalmon.eu/2020/01/gdb-coredump-backtrace-for-cross-platform-debugging/)



