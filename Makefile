ROOT_DIR := .
export TOOLS_DIR := $(ROOT_DIR)/hack/tools
export TOOLBIN := $(TOOLS_DIR)/bin
include $(ROOT_DIR)/hack/make-rules/tools.mk



.PHONY: generate
generate: $(TOOLBIN)/vangen
	PATH=$(TOOLBIN) vangen -config vangen.json 

