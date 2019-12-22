#!/bin/bash

# Install plotlylab wrapper
python -m pip install --no-deps --ignore-installed .

# Avoid "JavaScript heap out of memory" errors during extension installation
export NODE_OPTIONS=--max-old-space-size=4096

# Set JUPYTERLAB_DIR before installing to isolate our extensions
export JUPYTERLAB_DIR=$PREFIX/share/jupyter/plotlylab

ARGS="--no-build --log-level=INFO"
# Extensions to install
jupyter labextension install @jupyterlab/toc ${ARGS} 
jupyter labextension install @jupyterlab/git ${ARGS}
jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.1.0 ${ARGS}
jupyter labextension install jupyterlab-dash@0.1.0-alpha.3 ${ARGS}

jupyter lab build --name='PlotlyLab'
jupyter lab clean

unset NODE_OPTIONS
