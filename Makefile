.PHONY: all
all: build

# This has to be PHONY because we can't express LDAP as a dependency.
.PHONY: build
build:
	./build-zones

.PHONY: venv
venv: vendor/venv-update Makefile
	vendor/venv-update \
		venv= $@ -ppython3 \
		install= -r requirements-dev.txt

.PHONY: test
test: venv install-hooks
	venv/bin/pre-commit run --all-files

.PHONY: install-hooks
install-hooks: venv
	venv/bin/pre-commit install -f --install-hooks

.PHONY: clean
clean:
	rm -rf venv
