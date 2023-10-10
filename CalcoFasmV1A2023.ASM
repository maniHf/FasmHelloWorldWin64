format PE Console
entry Start
include 'win32a.inc'
section '.code' code readable executable
        Start:
                push HD
                call [print]
                call [_getch]
                call [ExitProcess]
section '.data' data readable writeable
        HD db 'Hello World!', 0
section '.idata' import data readable
  library \
    kernel, 'KERNEL32.DLL',\
    msvcrt, 'msvcrt.dll'
  import kernel,\
    ExitProcess, 'ExitProcess'
  import msvcrt,\
         print,'printf',\
         _getch,'_getch'
