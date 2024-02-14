# Makefile for managing plugin creation, installation, and cleanup

# Define variables
PLUGIN_NAME := $(shell basename $(CURDIR))
DIST_DIR := dist
ZIP_FILE := $(DIST_DIR)/$(PLUGIN_NAME).zip

# Phony targets
.PHONY: all dir zip install uninstall clean

# Default target for creating the plugin
all: install

# Target for creating the directory
dir:
	@mkdir -p $(DIST_DIR)

# Target for creating the plugin zip file
zip: dir
	@zip -r $(ZIP_FILE) . -x $(DIST_DIR)/* -x *.zip > /dev/null

# Target for installing the plugin
install: zip
	@dita install $(ZIP_FILE)

# Target for uninstalling the plugin
uninstall:
	@dita uninstall $(PLUGIN_NAME)

# Target for cleaning up the project
clean:
	@rm -rf $(DIST_DIR) *.zip *.log *.tmp *.bak *.swp *~ .DS_Store ._*```
