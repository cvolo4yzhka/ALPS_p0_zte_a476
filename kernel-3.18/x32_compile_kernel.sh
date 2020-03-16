#!/bin/bash
#set architectute
export ARCH=arm
#set cross compiller path
export CROSS_COMPILE=~/source/zte_a476/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-
#set directory for build output
export  KBUILD_OUTPUT=out32
#set defconfig
make zte_blade_a476_3_18_defconfig
#start compile
make zImage-dtb -j16 2>&1 | tee out32/build.log
#make menuconfig