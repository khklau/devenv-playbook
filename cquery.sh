#!/bin/sh

HERE=`pwd`
mkdir ${HOME}/.cquery
mkdir -p ${HOME}/opt
(
    cd ${HOME}/opt
    git clone https://github.com/cquery-project/cquery.git --recursive ./cquery-master
    cd ${HOME}/opt/cquery-master
    mkdir build
    cd build
    (
	export CXX="clang"
	export CXXFLAGS="--std=c++14 -Wl,--rpath,/home/kean/opt/clang-6.0.0/lib"
	cmake .. -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=${HOME}/opt/cquery-master -DCMAKE_EXPORT_COMPILE_COMMANDS=YES -DSYSTEM_CLANG=YES -DCMAKE_PREFIX_PATH="/home/kean/opt/clang-6.0.0"
	make install
    )
)
cd "${HERE}"
