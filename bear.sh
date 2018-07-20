#!/bin/sh

HERE=`pwd`
mkdir -p ${HOME}/opt/bear-2.3.11
(
    cd ${HOME}/opt/bear-2.3.11
    wget https://github.com/rizsotto/Bear/archive/2.3.11.tar.gz
    tar -xvzf 2.3.11.tar.gz
    mv Bear-2.3.11 src
    mkdir build
    cd build
    cmake3 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${HOME}/opt/bear-2.3.11 ../src
    make install
)
cd "${HERE}"
