#!/bin/bash
#

python ./setup.py install

if [ "$(uname)" = "Linux" ]; then
  ${CC:-gcc} -O3 -g -o ${PREFIX}/bin/powerline ${SRC_DIR}/client/powerline.c -lrt 
fi
