#!/bin/bash 
#"""! @brief """
# Makefile template to identify and set environment variables 
##
# @file env.sh
# @section libraries_env.sh Libraries/Modules
# @section notes_env.sh     Notes
# @section todo_env.sh      TODO
# @section resources_env.sh Resources

# Settings
SHELL=bash
MAKE=make
SEP='====='
GH=https://github.com
USER=JamesWCox

# Aliases 
GREEN=\033[0;32m
RED=\033[0;31m
BLUE=\033[0;34m
CLEAR=\033[0m

BUILD=DEV
BUILD=PROD
INSTALL_DIR:=$(HOME)
DEV_INSTALL_DIR:=$(PWD)/DEV_HOME
ifeq ($(BUILD),DEV) 
INSTALL_DIR:=$(DEV_INSTALL_DIR)
endif

# This is your redheads, your strippers, anyone named Tiffany, hairdressers, 
# your car is gonna gets keyed, you got a honey in the pot, tires get slashed 
# and you end up in jail 
DANGER_ZONE=danger_zone
GH=GitHub
GH_URL=https://github.com
GL=GitLab
GL_URL=https://gitlab.com

BA=$(HOME)/.bash_aliases
ALIASES=$(HOME)/.aliases
