#!/bin/bash

mkdir -p $(dirname "$0")/build
cd $(dirname "$0")/build

# meaningful values for ANDROID_ABI:
#    armeabi-v7a - use this for real non-ancient phones
#    x86 - use this for the Mac Android Emulator
#    x86_64
#    arm64-v8a
#    mips - unsupported as of NDK r17
ANDROID_ABI=x86

# possible values for ANDROID_TOOLCHAIN:
#    gcc - deprecated in more recent Android versions but required for Qt <= 5.11
#    clang
ANDROID_TOOLCHAIN=gcc

cmake "-DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake" \
      "-DANDROID_ABI=$ANDROID_ABI" \
      "-DANDROID_TOOLCHAIN=$ANDROID_TOOLCHAIN" \
      ..

#echo 'To build and deploy, run:'
#echo '  cd build && make VERBOSE=1 && $ANDROID_HOME/platform-tools/adb push my-native /data/local/tmp/'
