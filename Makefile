ifdef PLATFORM
	CROSS:=$(PLATFORM)-
else
	CROSS:=
	PLATFORM:=linux
endif

ifeq ($(RELEASE),1)
	BUILD:=release
else
	BUILD:=debug
endif

all:
	$(MAKE) -C libaio
	$(MAKE) -C libhttp
	
clean:
	$(MAKE) -C libaio clean
	$(MAKE) -C libhttp clean

.PHONY : test
test:
	$(MAKE) -C test clean
	$(MAKE) -C test
	cd libaio/$(BUILD).$(PLATFORM) && ../../test/$(BUILD).$(PLATFORM)/test