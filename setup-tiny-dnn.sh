#!/usr/bin/env sh
#
#Tiny-dnn requires gcc 4.8+
scl enable devtoolset-2 bash

#Tbbvars
export TBBROOT="/research/brg/install/bare-pkgs/x86_64-centos6/intel-tbb" #
export tbb_bin="$TBBROOT/build/linux_intel64_gcc_cc4.8.2_libc2.12_kernel2.6.32_release" #
if [ -z "$CPATH" ]; then #
    export CPATH="${TBBROOT}/include" #
else #
    export CPATH="${TBBROOT}/include:$CPATH" #
fi #
if [ -z "$LIBRARY_PATH" ]; then #
    export LIBRARY_PATH="${tbb_bin}" #
else #
    export LIBRARY_PATH="${tbb_bin}:$LIBRARY_PATH" #
fi #
if [ -z "$LD_LIBRARY_PATH" ]; then #
    export LD_LIBRARY_PATH="${tbb_bin}" #
else #
    export LD_LIBRARY_PATH="${tbb_bin}:$LD_LIBRARY_PATH" #
fi #
 #
