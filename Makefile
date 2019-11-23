SHELL = /bin/bash

prefix ?= /usr/local
bindir ?= $(prefix)/bin
libdir ?= $(prefix)/lib
srcdir = Sources

REPODIR = $(shell pwd)
BUILDDIR = $(REPODIR)/.build
SOURCES = $(wildcard $(srcdir)/**/*.swift)

.DEFAULT_GOAL = all

.PHONY: all
all: lemma

.PHONY: lemma
lemma: $(SOURCES)
	@swift build \
		-c release \
		--disable-sandbox \
		--build-path "$(BUILDDIR)"

.PHONY: install
install: lemma
	@install -d "$(bindir)" "$(libdir)"
	@install "$(BUILDDIR)/release/lemma" "$(bindir)"

.PHONY: uninstall
uninstall:
	@rm -rf "$(bindir)/lemma"

.PHONY: clean
distclean:
	@rm -rf $(BUILDDIR)/release

.PHONY: clean
clean: distclean
	@rm -rf $(BUILDDIR)
