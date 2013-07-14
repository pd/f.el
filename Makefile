EMACS ?= emacs
CARTON ?= carton

all: test

test: unit

test-compiled: compile unit clean-elc

unit:
	${CARTON} exec ert-runner run -l test/ert-loader.el

docs:
	${CARTON} exec bin/make-docs

compile:
	${CARTON} exec ${EMACS} -Q -batch -f batch-byte-compile f.el

clean-elc:
	rm f.elc

.PHONY:	all test docs unit compile clean-elc test-compiled
