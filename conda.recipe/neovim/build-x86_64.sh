#!/bin/bash
#

# First we compile third party
mkdir ${SRC_DIR}/.deps
pushd ${SRC_DIR}/.deps >/dev/null
cmake ${SRC_DIR}/third-party
make -j ${CPU_COUNT}
popd >/dev/null

# Then compile with bundled third party and install
mkdir build
pushd build >/dev/null
cmake -DCMAKE_BUILD_TYPE="Release" \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} ${SRC_DIR}
make -j ${CPU_COUNT}
make install
popd >/dev/null

