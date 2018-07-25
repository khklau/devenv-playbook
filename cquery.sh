#!/bin/sh

HERE=`pwd`
mkdir ${HOME}/.cquery
mkdir -p ${HOME}/opt
(
    cd ${HOME}/opt
    git clone --branch v20180718 --recursive https://github.com/cquery-project/cquery.git ./cquery-v20180718
    cd ${HOME}/opt/cquery-v20180718
    mkdir build
    cd build
    (
	CXXFLAGS="-std=c++14 -Wl,--rpath,/home/kean/opt/clang-6.0.0/lib" cmake .. \
		-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=${HOME}/opt/cquery-v20180718 \
		-DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
		-DSYSTEM_CLANG=YES \
		-DCMAKE_PREFIX_PATH="/home/kean/opt/clang-6.0.0"
	make install
    )
)
cd "${HERE}"
