SRC := UCOSII/port-win32/os_cpu.c UCOSII/port-win32/os_hook.c
# SRC += $(wildcard UCOSII/port-win32/*.c)

KERNEL_SRC:=os_core.c  os_flag.c  os_mem.c    os_q.c    os_task.c  os_tmr.c\
	os_dbg.c   os_mbox.c  os_mutex.c  os_sem.c  os_time.c

SRC += $(KERNEL_SRC:%.c=UCOSII/src/%.c)
# SRC += $(KERNEL_SRC:%.c=Source/%.c)

SRC += hello_ucosii.c

OBJ := $(SRC:%.c=build/%.o)

CC := gcc
APP_CFLAGS := -IUCOSII/port-win32 -g
# APP_CFLAGS += -ISource
APP_CFLAGS += -IUCOSII/inc
LINK := gcc
LINK_FLAG := -g
ECHO := echo
MKDIR := mkdir -p

MINGW_LIB:=C:/mingw64/x86_64-w64-mingw32/lib
LIB:=$(MINGW_LIB)/libwinmm.a 

define compile_c
@$(ECHO) Info: Compiling $< to $@
@$(MKDIR) $(@D)
$(CC) -MP -MMD -c $(APP_CFLAGS) -o $@ $<
$(CC_POST_PROCESS)
endef

build/%.o: %.c UCOSII/inc/os_cfg.h
	$(compile_c)

all: ${OBJ}
	$(LINK) $(LINK_FLAG) -o main.exe ${OBJ} ${LIB}

clean:
	@rm -rf build
