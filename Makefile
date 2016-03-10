.PHONY: all
all: build

# This has to be PHONY because we can't express LDAP as a dependency.
.PHONY: build
build:
	./build-zones
