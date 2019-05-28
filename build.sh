#!/bin/bash
#

export PATH=${HOME}/miniconda/bin:$PATH

rm -rf ${HOME}/assets
mkdir -p ${HOME}/assets
for n in conda.recipe/*; do
  echo "====================== Building $n =========================="
  conda build $n --output-folder ${HOME}/assets
done

ls ${HOME}/assets

exit 0
