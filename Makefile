all: deploy

configure:
	./configure.sh

build: configure
	cd build && $(MAKE) VERBOSE=1

deploy: build
	cd build && "$(ANDROID_HOME)/platform-tools/adb" push my-native /data/local/tmp/

distclean:
	rm -rf build
