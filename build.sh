#!/bin/bash
#

export PATH=${HOME}/miniconda/bin:$PATH

rm -rf ${HOME}/assets
mkdir -p ${HOME}/assets
for n in conda.recipe/*; do
  echo "====================== Building $n =========================="
  conda build $n --output-folder ${HOME}/assets
done

for n in $(find ${HOME}/assets *.tar.bz2); do
  anaconda -t $CONDA_UPLOAD_TOKEN upload -u programfan $n --force
done

exit 0
