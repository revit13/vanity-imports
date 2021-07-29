SKIP_INSTALL_CHECK ?= true

INSTALL_TOOLS += $(TOOLBIN)/vangen
$(TOOLBIN)/vangen:
	cd $(TOOLS_DIR); chmod +x ./install_vangen.sh; ./install_vangen.sh

