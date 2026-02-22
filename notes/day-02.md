# Day 2

**wndclass**

typedef struct tagWNDCLASSA 
{
  UINT      STYLE;
  WNDPROC   LPFNWNDPROC;
  INT       CBCLSEXTRA;
  INT       CBWNDEXTRA;
  HINSTANCE HINSTANCE;
  HICON     HICON;
  HCURSOR   HCURSOR;
  HBRUSH    HBRBACKGROUND;
  LPCSTR    LPSZMENUNAME;
  LPCSTR    LPSZCLASSNAME;
}

### Why is it called tagWNDCLASSA?

The reason is because the windows headers are trying to support older compiler version (C vs C++ compilations)

* c++ -> If we create a struct Foo we can imediatly useit

```
struct foo
{
    int X;
}
foo Foo;
```

* c -> In the original C we cannot we the stuct name `foo` because it do not look up for name types when we did not decorate then, what we need to do is:

```
struct foo
{
    int X;
}
struct foo Foo; // Put the decorator before
```

So windows used `typedef`
`typedef` is a way of defining a new type name

```
struct foo
{
    int X;
}
typedef struct foo Foo;
struct foo Foo;
```
So windows decided to compress all of that into one concide definition.

And then the typedef declares other different types inlineright after `tagWNDCLASSA` -> WNDCLASSA, *PWNDCLASSA, *NPWNDCLASSA, *LPWNDCLASSA;

typedef struct tagWNDCLASSA 
{
  UINT      STYLE;
  WNDPROC   LPFNWNDPROC;
  INT       CBCLSEXTRA;
  INT       CBWNDEXTRA;
  HINSTANCE HINSTANCE;
  HICON     HICON;
  HCURSOR   HCURSOR;
  HBRUSH    HBRBACKGROUND;
  LPCSTR    LPSZMENUNAME;
  LPCSTR    LPSZCLASSNAME;
} WNDCLASSA, *PWNDCLASSA, *NPWNDCLASSA, *LPWNDCLASSA;

- `WNDCLASSA` => struct tagWNDCLASSA
- `*PWNDCLASSA` → pointer to struct (pointer)
- `*NPWNDCLASSA` → pointer to struct (near pointer - 16bit)
- `*LPWNDCLASSA` → pointer to struct (long pointer - 32bit)

`*NPWNDCLASSA` and `*LPWNDCLASSA` are legacy naming leftovers.


We can initialize it like this:

```
	WNDCLASS WindowClass = {};
```

we can use GetModuleHandle(0) to get the hIntance


```
sizeof(LRESULT)	8	unsigned __int64
```

ATOM -> Windows






