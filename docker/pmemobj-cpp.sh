#!/bin/bash -ex

git clone https://github.com/pmem/libpmemobj-cpp
cd libpmemobj-cpp
# stable-1.7 with fixed memcheck error of uninitialized size field; June 27th
#git checkout 693a53d5c5303c0f20be76e438133635a67b9f6a
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make
make install
cd ../..
rm -r libpmemobj-cpp
