#!/bin/sh

HERE=`pwd`
mkdir -p ${HOME}/opt/clang-6.0.0
(
    cd ${HOME}/opt/clang-6.0.0
    wget http://releases.llvm.org/6.0.0/llvm-6.0.0.src.tar.xz
    wget http://releases.llvm.org/6.0.0/cfe-6.0.0.src.tar.xz
    wget http://releases.llvm.org/6.0.0/compiler-rt-6.0.0.src.tar.xz
    tar -xvJf ./llvm-6.0.0.src.tar.xz
    tar -xvJf ./cfe-6.0.0.src.tar.xz
    mv cfe-6.0.0.src llvm/tools/clang
    mv compiler-rt-6.0.0.src llvm/projects/compiler-rt
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=${HOME}/opt/clang-6.0.0 -DLLVM_LINK_LLVM_DYLIB=ON -DLLVM_BUILD_LLVM_DYLIB=ON -G "Unix Makefiles" ../llvm
    make install
)
cd "${HERE}"
