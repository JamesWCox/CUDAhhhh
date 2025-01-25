#!/bin/bash 
#"""! @brief """
## interface makefile 
# @file interface
# @section libraries_interface Libraries/Modules
# @section notes_interface     Notes
# @section todo_interface      TODO
# [ ] Need to add handlers for when the manifest target doesn't exist
#     - as is, a dir not found aborts the script(s) 
# [ ] Target 'status-all' needs to print out the manifest target name  
.PHONY= status-all recurse-help

deploy: 
	@for f in $(MANIFEST); do if [ ! -d "$(INSTALL_DIR)/$$(basename $$f)" ]; then git clone $$f.git $(INSTALL_DIR)/$$(basename $$f); fi; done
deploy-install-pkg: 
	@for f in $(INSTALL_PKG); do if [ ! -d "$(INSTALL_DIR)/$$(basename $$f)" ]; then git clone $$f.git $(INSTALL_DIR)/$$(basename $$f); fi; done
	
status-all:
	@for f in $(MANIFEST); do if [ -d "$(INSTALL_DIR)/$$(basename $$f)" ]; then echo -e '>> '$$(basename $$f) && pushd $(INSTALL_DIR)/$$(basename $$f) &>/dev/null && make --no-print-directory status-all && popd &>/dev/null ; fi; done
	@git status 
	@echo -e $(SEP) $@ $(SEP)

recurse-help:
	@for f in $(MANIFEST); do if [ -d "$(INSTALL_DIR)/$$(basename $$f)" ]; then pushd $(INSTALL_DIR)/$$(basename $$f) &>/dev/null && make --no-print-directory help && popd &>/dev/null ; fi; done
	@echo -e $(SEP) $@ $(SEP)

