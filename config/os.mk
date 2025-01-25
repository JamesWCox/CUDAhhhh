#!/bin/bash 
#"""! @brief """
# Detects operating system 
##
# @file os.mk
# @section libraries_os.mk Libraries/Modules
# @section notes_os.mk     Notes
# @section todo_os.mk      TODO
# @section resources_os.mk Resources

ifeq '$(findstring ;,$(PATH))' ';'
    detected_OS := Windows
else
    detected_OS := $(shell uname 2>/dev/null || echo Unknown)
    detected_OS := $(patsubst CYGWIN%,Cygwin,$(detected_OS))
    detected_OS := $(patsubst MSYS%,MSYS,$(detected_OS))
    detected_OS := $(patsubst MINGW%,MSYS,$(detected_OS))
endif

# TODO Identify 'OS' WSL 
ifeq ($(detected_OS),Windows)
    CFLAGS   +=   -D Windows
    DOXY_OUTPUT=docs/Windows
endif
ifeq ($(detected_OS),Darwin)        # Mac OS X
    CFLAGS   +=   -D Darwin
    DOXY_OUTPUT=docs/Darwin
endif
ifeq ($(detected_OS),Linux)
    CFLAGS   +=   -D Linux
    DOXY_OUTPUT=docs/Linux
    # @TODO Might could check for 'WSLENV' in ENV 
endif
ifeq ($(detected_OS),GNU)           # Debian GNU Hurd
    CFLAGS   +=   -D GNU_HURD
    DOXY_OUTPUT=docs/GNU_HURD
endif
ifeq ($(detected_OS),GNU/kFreeBSD)  # Debian kFreeBSD
    CFLAGS   +=   -D GNU_kFreeBSD
    DOXY_OUTPUT=docs/GNU_kFreeBSD
endif
ifeq ($(detected_OS),FreeBSD)
    CFLAGS   +=   -D FreeBSD
    DOXY_OUTPUT=docs/FreeBSD
endif
ifeq ($(detected_OS),NetBSD)
    CFLAGS   +=   -D NetBSD
    DOXY_OUTPUT=docs/NetBSD
endif
ifeq ($(detected_OS),DragonFly)
    CFLAGS   +=   -D DragonFly
    DOXY_OUTPUT=docs/DragonFly
endif
ifeq ($(detected_OS),Haiku)
    CFLAGS   +=   -D Haiku
    DOXY_OUTPUT=docs/Haiku
endif
