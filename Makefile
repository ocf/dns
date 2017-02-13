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
		install= ckuehl-pre-commit-types==0.7.6.dev1

.PHONY: test
test: venv install-hooks
	venv/bin/pre-commit run --all-files

.PHONY: install-hooks
install-hooks: venv
	venv/bin/pre-commit install -f --install-hooks
