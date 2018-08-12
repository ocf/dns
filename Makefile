# A bit of a hacky way to generate make targets based off files in a directory
ZONE_CHECKS = $(shell find etc/zones/ -type f -printf 'check_zone_%f\n')

.PHONY: all
all: build

# This has to be PHONY because we can't express LDAP as a dependency.
.PHONY: build
build:
	./build-zones

venv: vendor/venv-update Makefile
	vendor/venv-update \
		venv= $@ -ppython3 \
		install= -r requirements-dev.txt

.PHONY: test
test: venv install-hooks check_zones
	venv/bin/pre-commit run --all-files

.PHONY: check_zones
check_zones: $(ZONE_CHECKS)

# We have to change directories in this so we can check that relative file
# includes work properly inside zones.
#
# This also requires that the bind9utils package is installed
.PHONY: check_zone_db.%
check_zone_db.%:
	cd etc/zones && named-checkzone $* db.$*

.PHONY: install-hooks
install-hooks: venv
	venv/bin/pre-commit install -f --install-hooks

.PHONY: clean
clean:
	rm -rf venv
