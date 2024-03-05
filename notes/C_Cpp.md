
All the things, i usually like to remember but always forget about:

# C 



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