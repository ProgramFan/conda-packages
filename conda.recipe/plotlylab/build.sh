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
jupyter labextension install @jupyterlab/toc@3.0 ${ARGS} 
# Jupyter widgets extension
jupyter labextension install @jupyter-widgets/jupyterlab-manager@2.0 ${ARGS}
# FigureWidget support
jupyter labextension install plotlywidget@4.6 ${ARGS}
# jupyterlab renderer support
jupyter labextension install jupyterlab-plotly@4.6 ${ARGS}
# jupyterlab plotly chart editor
jupyter labextension install jupyterlab-chart-editor@4.6 ${ARGS}

# Build extensions all at once
jupyter lab build --name='PlotlyLab'
jupyter lab clean

unset NODE_OPTIONS
