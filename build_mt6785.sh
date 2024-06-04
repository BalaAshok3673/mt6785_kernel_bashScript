#!/bin/bash

export ARCH=arm64
export SUBARCH=arm64
export CLANG PATH=/home/bala/mykernel/linux-x86/clang-r522817/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=/home/bala/mykernel/android-ndk-r26d/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android-

make_kernel_init(){
        rm -rf out
        echo clean
        make clean && make mrproper
        mkdir -p out

       echo Set DEFCONFIG
       make CC=clang O=out RM6785_defconfig
       
}

make_and_config(){
         make_kernel_init
         
         make ARCH=$ARCH menuconfig
}

make_simply(){
     make_kernel_init
     echo Build Kernel
     make CC=clang O=out  -j4

}




make_and_config
