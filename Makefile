test:
	PATH=$(CURDIR)/bin:$$PATH shunit2 tests/*

.PHONY: test
