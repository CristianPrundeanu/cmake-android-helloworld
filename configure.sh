#!/bin/bash

mkdir -p $(dirname "$0")/build
cd $(dirname "$0")/build
cmake -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake \
      -DANDROID_ABI=x86 \
      ..

#echo 'To build and deploy, run:'
#echo '  cd build && make VERBOSE=1 && $ANDROID_HOME/platform-tools/adb push my-native /data/local/tmp/'
