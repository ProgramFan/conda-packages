#!/bin/bash
#
set -e

export PATH=${HOME}/miniconda/bin:$PATH

rm -rf ${HOME}/assets
mkdir -p ${HOME}/assets
for n in $(cat conda.recipe/lists.txt); do
  echo "====================== Building $n =========================="
  conda build conda.recipe/$n --output-folder ${HOME}/assets
done

for n in $(find ${HOME}/assets -name "*.tar.bz2"); do
  anaconda -t $CONDA_UPLOAD_TOKEN upload -u programfan $n --force
done
