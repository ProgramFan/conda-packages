#!/bin/bash
#

export LUA_DIR=${SRC_DIR}/.deps/usr

# Patch the top CMakeLists.txt to use bundled lua
sed -i 's@find_package(Lua 5.1@# find_package(Lua 5.1@g' ${SRC_DIR}/CMakeLists.txt

# First we compile third party
mkdir ${SRC_DIR}/.deps
pushd ${SRC_DIR}/.deps >/dev/null
cmake -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_LUA=ON \
  ${SRC_DIR}/third-party
make -j ${CPU_COUNT}
popd >/dev/null

# Then compile with bundled third party and install
mkdir build
pushd build >/dev/null
cmake -DPREFER_LUA=ON -DCMAKE_BUILD_TYPE="Release" \
  -DLUA_INCLUDE_DIR=${LUA_DIR}/include \
  -DLUA_LIBRARIES=${LUA_DIR}/lib/liblua.a \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} ${SRC_DIR}
make -j ${CPU_COUNT}
make install
popd >/dev/null

