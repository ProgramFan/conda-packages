#!/bin/bash

# Install plotlylab wrapper
python -m pip install --no-deps --ignore-installed .

# Avoid "JavaScript heap out of memory" errors during extension installation
export NODE_OPTIONS=--max-old-space-size=4096

# Set JUPYTERLAB_DIR before installing to isolate our extensions
export JUPYTERLAB_DIR=$PREFIX/share/jupyter/plotlylab

ARGS="--no-build --log-level=INFO"
# Extensions to install
# table-of-contents extension
jupyter labextension install @jupyterlab/toc ${ARGS} 
# git extension, be sure to use the same version as meta.yaml
jupyter labextension install @jupyterlab/git@0.9.0 ${ARGS}
# Jupyter widgets extension
jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.1 ${ARGS}
# FigureWidget support
jupyter labextension install plotlywidget@1.4.0 ${ARGS}
# jupyterlab renderer support
jupyter labextension install jupyterlab-plotly@1.4.0 ${ARGS}
# jupyterlab plotly chart editor
jupyter labextension install jupyterlab-chart-editor ${ARGS}

# Build extensions all at once
jupyter lab build --name='PlotlyLab'
jupyter lab clean

unset NODE_OPTIONS
