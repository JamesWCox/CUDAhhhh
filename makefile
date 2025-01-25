#!/bin/bash 
#"""! @brief """
## Makefile for interface development  
# @file makefile
# @section libraries_makefile Libraries/Modules
# @section notes_makefile     Notes
# - This defines the very core of project makefiles
# - This is used only for development and is intended to be 
#       merged into Genesis/makefile once interface is mature 
# @section todo_makefile      TODO
# - 
include config/env.mk
include config/os.mk
include config/interface.mk
include config/manifest.mk
include config/install_pkg.mk
.PHONY= all help status

all:
	@echo -e '\t- makefile.mk all' 
help:
	@echo -e '\t- makefile.mk halp!'
status: 
	git status 
