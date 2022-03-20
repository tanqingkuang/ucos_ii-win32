## This project port ucoss_ii to run on windows
##
# Require
migw-gcc or msvc

# How to use with your project
Add UCOSII/port-win32 and UCOSII/inc to include path

Configure ucos_ii at file UCOSII/inc/os_cfg.h

Ensure has libwinmm.a if using compiler gcc

# Build test
```
make clean
make all
```

# Run test
excute main.exe
```
MicroC/OS-II
Hello from task1
Hello from task2
Hello from task1
Hello from task2
Hello from task1
Hello from task2
```

# Limit
Can not compile alt_env_lock.c and alt_malloc_lock.c. They require newlib
