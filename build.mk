
fsmark-cmd-file-list = fs_mark lib_timing

fsmark-cmd-objects = $(foreach x, $(fsmark-cmd-file-list), fs_mark-3.3/$x.o)

cflags-fsmark-cmd-includes =

$(fsmark-cmd-objects): kernel-defines =

$(fsmark-cmd-objects): CFLAGS += -D_GNU_SOURCE -D__OSV__

$(fsmark-cmd-objects): local-includes += $(cflags-fsmark-cmd-includes)

$(fsmark-cmd-objects): CFLAGS += -Wno-switch -D__va_list=__builtin_va_list '-DTEXT_DOMAIN=""' \
			-Wno-maybe-uninitialized -Wno-unused-variable -Wno-unknown-pragmas -Wno-unused-function


fs_mark.so: $(fsmark-cmd-objects)
	$(q-build-so)