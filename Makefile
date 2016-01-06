test:
	for file in tests/*.sh; \
	do \
	    PATH=$(CURDIR)/bin:$$PATH shunit2 $$file ;\
	done

.PHONY: test
