#!/bin/bash
#

python ./setup.py install

${CC:-gcc} -O3 -g -o ${PREFIX}/bin/powerline ${SRC_DIR}/client/powerline.c -lrt 
