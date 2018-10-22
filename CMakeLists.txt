# Sources:
#    https://developer.android.com/studio/projects/configure-cmake
#    https://developer.android.com/ndk/guides/cmake
# Sets the minimum version of CMake required to build your native library.
# This ensures that a certain set of CMake features is available to
# your build.

cmake_minimum_required(VERSION 3.4.1)

if(NOT DEFINED ANDROID_NDK)
    if(NOT DEFINED ENV{ANDROID_NDK})
        message(FATAL_ERROR "Please define ANDROID_NDK or export it from your environment.")
    endif()
    set(ANDROID_NDK $ENV{ANDROID_NDK})
endif()
if (NOT EXISTS ${ANDROID_NDK}/sysroot)
    message(FATAL_ERROR "ANDROID_NDK is defined but missing the sysroot directory.")
endif()
set(CMAKE_ANDROID_NDK $ENV{ANDROID_NDK})

set(ANDROID_PLATFORM android-24)
set(ANDROID_STL c++_static)

set(ANDROID_NATIVE_API_LEVEL 24)

#set(ANDROID_TOOLCHAIN clang)
set(ANDROID_TOOLCHAIN gcc)

# this only has effect from the command line (or possibly from a toolchain file)
##set(ANDROID_ABI armeabi-v7a)
##set(ANDROID_ABI x86)
##set(ANDROID_ABI x86_64)
##set(ANDROID_ABI arm64-v8a)
##set(ANDROID_ABI mips) # unsupported as of NDK r17
#set(CMAKE_ANDROID_ABI x86_64)
#set(CMAKE_ANDROID_ARCH_ABI x86_64)

# Android 5.0+ only support position-independent executables
add_definitions("-fPIE")
set(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -fPIE -pie")

# Specifies a library name, specifies whether the library is STATIC or
# SHARED, and provides relative paths to the source code. You can
# define multiple libraries by adding multiple add_library() commands,
# and CMake builds them for you. When you build your app, Gradle
# automatically packages shared libraries with your APK.

#add_library( # Specifies the name of the library.
#             my-native
#
#             # Sets the library as a shared library.
#             SHARED
#
#             # Provides a relative path to your source file(s).
#             #src/main/cpp/native-lib.cpp
#             main.c )

# Similar to how you can tell CMake to create a native library from 
# source files, you can use the add_executable() command to tell CMake 
# to instead create an executable from those source files.

add_executable(my-native main.cpp)

# Specifies a path to native header files.
#include_directories(src/main/cpp/include/)

# Link to external library
#find_library( # Defines the name of the path variable that stores the
#              # location of the NDK library.
#              log-lib
#
#              # Specifies the name of the NDK library that
#              # CMake needs to locate.
#              log )

# Links your native library against one or more other native libraries.
#target_link_libraries( # Specifies the target library.
#                       my-native
#
#                       # Links the log library to the target library.
#                       ${log-lib} )

# This manages NativeActivity lifecycle events and touch input,
#add_library( app-glue
#             STATIC
#             ${ANDROID_NDK}/sources/android/native_app_glue/android_native_app_glue.c )
##target_link_libraries( my-native app-glue ${log-lib} )
#target_link_libraries( my-native app-glue )

# To add a prebuilt library:
#add_library( imported-lib
#             SHARED
#             IMPORTED )
#set_target_properties( # Specifies the target library.
#                       imported-lib
#
#                       # Specifies the parameter you want to define.
#                       PROPERTIES IMPORTED_LOCATION
#
#                       # Provides the path to the library you want to import.
#                       imported-lib/src/${ANDROID_ABI}/libimported-lib.so )
#include_directories( imported-lib/include/ )
#target_link_libraries( my-native imported-lib app-glue ${log-lib} )
