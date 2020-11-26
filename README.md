# Zikina (dirty in basque)
crapy example to access (on linux) from C to a Fortran common block in a shared library
## Compilation
- a la mano
```bash
gfortran -g -fPIC -o libzut.so -shared zut.f90
gfortran -g -o call_zut call_zut.c -lzut -L.
LD_LIBRARY_PATH="." ./call_zut
```
- using cmake
```bash
cmake -B build -DCMAKE_BUILD_TYPE=Debug && make -C build && make -C build test
```
## view data from gdb
launch gdb
```bash
gdb ./call_zut
(...)
(gdb) b trucmuche_
Breakpoint 1 at 0x1030
(gdb) run
Starting program: (...)/call_zut

Breakpoint 1, trucmuche () at (...)/zut.f90:13
13  subroutine trucmuche()
(gdb) info variables .*csts.*
All variables matching regular expression ".*csts.*":

Non-debugging symbols:
0x0000555555558030  csts
(gdb) x /d &csts
0x555555558030 <csts>:  299792459

