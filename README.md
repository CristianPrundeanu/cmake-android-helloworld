# Hello World for Android using CMake

This is a simple project example showing how to build an Android project using CMake.

Before building, make sure the following are exported to the environment:
* ANDROID_HOME - root of the Android SDK, something like `/Users/<you>/Library/Android/sdk`
* ANDROID_NDK - root of the Android NDK, something like `$ANDROID_HOME/ndk-bundle`

To build, simply type `make compile` - it will set up the build, invoke cmake with all the command line arguments needed to build for an x86 Android Emulator, and finally compile the thing.
To make changes or learn the details, check `configure.sh`.

Tested on MacOS Mojave (10.14), with the following prerequisites:
* Android SDK version 24 installed with Android Studio: https://developer.android.com/studio/
* Android NDK version r17c: https://developer.android.com/ndk/downloads/older_releases
* Java JDK version 8u181: https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
