test:
	for file in tests/*.sh; \
	do \
	    PATH=$(CURDIR)/bin:$$PATH shunit2 $$file || exit 1;\
	done

.PHONY: test
