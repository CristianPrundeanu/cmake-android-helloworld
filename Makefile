all: distclean configure compile deploy run

configure:
	./configure.sh

compile:
	cd build && $(MAKE) VERBOSE=1

deploy:
	cd build && "$(ANDROID_HOME)/platform-tools/adb" push my-native /data/local/tmp/

run:
	"$(ANDROID_HOME)/platform-tools/adb" shell /data/local/tmp/my-native

distclean:
	rm -rf build

help:
	echo "Supported targets: $$(grep '^[a-z]*:' Makefile | cut -d : -f 1 | tr '\n' ' ')"
