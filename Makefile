all: deploy

configure:
	./configure.sh

build: configure
	cd build && $(MAKE) VERBOSE=1

deploy: build
	cd build && "$(ANDROID_HOME)/platform-tools/adb" push my-native /data/local/tmp/

run: deploy
	"$(ANDROID_HOME)/platform-tools/adb" shell /data/local/tmp/my-native

distclean:
	rm -rf build
