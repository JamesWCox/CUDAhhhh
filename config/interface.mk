#!/bin/bash 
#"""! @brief """
## interface makefile 
# @file interface
# @section libraries_interface Libraries/Modules
# @section notes_interface     Notes
# @section todo_interface      TODO
# @section resources_interface Resources
.PHONY= domains deploy deploy-submodules deploy-private 
.PHONY+= status-all help-all help-interface
.PHONY+= tree-view

INTERFACE_VERSION_MAJOR=1
INTERFACE_VERSION_MINOR=0
INTERFACE_VERSION_PATCH=0
INTERFACE_VERSION=$(INTERFACE_VERSION_MAJOR).$(INTERFACE_VERSION_MINOR).$(INTERFACE_VERSION_PATCH)

# Clone high-level domains
domains: 
	@for f in $(MANIFEST); do if [ ! -d "$(INSTALL_DIR)/$$(basename $$f)" ]; then git clone $$f.git $(INSTALL_DIR)/$$(basename $$f); fi; done
# Foreach domain: pushd domain and clone submodules 
deploy: 
	@for f in $(MANIFEST); do if [ -d "$(INSTALL_DIR)/$$(basename $$f)" ]; then pushd $(INSTALL_DIR)/$$(basename $$f) && make deploy-submodules --no-print-directory && popd &>/dev/null; fi; done

# For now deploy submodules into the domain 
deploy-submodules: 
	@for f in $(SUBMODULES); do if [ ! -d "$$(basename $$f)" ]; then git clone $$f.git $$(basename $$f); else echo -e "    - Skipping: $$(basename $$f)"; fi; done

deploy-private: 
	@for f in $(PRIVATE_REPOS); do if [ ! -d "$$(basename $$f)" ]; then git clone $$f.git $$(basename $$f); else echo -e "    - Skipping: $$(basename $$f)"; fi; done

status-all:
	@for f in $(MANIFEST); do if [ -d "$(INSTALL_DIR)/$$(basename $$f)" ]; then echo -e '>> '$$(basename $$f) && pushd $(INSTALL_DIR)/$$(basename $$f) &>/dev/null && make --no-print-directory status-all && popd &>/dev/null ; fi; done
	@git status 
	@echo -e $(SEP) $@ $(SEP)

help-all:
	@for f in $(MANIFEST); do if [ -d "$(INSTALL_DIR)/$$(basename $$f)" ]; then echo -e '>> '$$(basename $$f) && pushd $(INSTALL_DIR)/$$(basename $$f) &>/dev/null && make --no-print-directory help && popd &>/dev/null ; fi; done
	@echo -e $(SEP) $@ $(SEP)
	
# Print interface specific help message(s) 
help-interface:
	@echo -e Interface Version: $(INTERFACE_VERSION) 
	@echo -e $(SEP) TODO $@ $(SEP)

tree-view:
	@for f in $(MANIFEST); do \
	number=1 ; while [[ $$number -le $(LVL) ]] ; do \
        echo -n '-'; \
        ((number = number + 1)) ; \
    done; \
	echo -e " $$(basename $$f)"; \
	if [ -d "$(INSTALL_DIR)/$$(basename $$f)" ]; then pushd $(INSTALL_DIR)/$$(basename $$f) &>/dev/null && make --no-print-directory LVL=$(LVL)+1 rollup && popd &>/dev/null ; fi; done
