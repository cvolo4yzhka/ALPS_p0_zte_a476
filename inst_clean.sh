#!/bin/bash
export USE_CCACHE=1
export CCACHE_DIR=/home/cvolo4yzhka/source/.ccache
ccache -M 50G
source build/envsetup.sh
lunch full_zte_blade_a476_3_18-userdebug
make installclean
#make -j8 2>&1 | tee out/build_k318.log

source build/envsetup.sh
lunch full_zte_blade_a476-userdebug
make installclean

