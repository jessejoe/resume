# Include config if exists
-include  config.make

# Put these into config.make to override with your setup
RESUME ?= resumes/example.yaml
PUBLISH_LOCATION ?= ../resume/

PYTHON ?= $(shell which python3)
CP ?= $(shell which cp)
CP_ARGS ?= r
BUILD_DIR ?= build
BUILD_ARGS ?= --output_dir $(BUILD_DIR)
BUILD ?= $(PYTHON) build.py $(BUILD_ARGS)


.PHONY: clean html pdf publish

all: clean html pdf

html:
	$(BUILD) --format html $(RESUME)
	@echo "Done"

pdf:
	$(BUILD) --format pdf $(RESUME)

clean:
	@rm -rf $(BUILD_DIR)

publish:
	$(CP) -$(CP_ARGS) $(BUILD_DIR)/* $(PUBLISH_LOCATION)
