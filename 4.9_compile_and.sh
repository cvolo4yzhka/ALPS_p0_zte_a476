#!/bin/bash
export CCACHE_DIR=/home/cvolo4yzhka/source/.ccache
export USE_CCACHE=1
ccache -M 50G
#export _JAVA_OPTIONS="-Xms4G -Xmx4G"
source build/envsetup.sh
lunch full_zte_blade_a476-user
#make installclean
make -j8 2>&1 | tee out/build_k49.log

