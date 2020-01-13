#!/bin/bash
#

case "$(uname -m)" in
  "x86_64")
    source ${RECIPE_DIR}/build-x86_64.sh
    ;;
  "aarch64")
    source ${RECIPE_DIR}/build-aarch64.sh
    ;;
  *)
    echo "Unknown architecture"
    exit -1
esac
