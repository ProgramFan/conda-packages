#!/bin/bash

# Install plotlylab wrapper
python -m pip install --no-deps --ignore-installed .

# Avoid "JavaScript heap out of memory" errors during extension installation
export NODE_OPTIONS=--max-old-space-size=4096

# Set JUPYTERLAB_DIR before installing to isolate our extensions
export JUPYTERLAB_DIR=$PREFIX/share/jupyter/plotlylab

# Extensions to install
jupyter labextension install @jupyterlab/toc --no-build
jupyter labextension install @jupyterlab/git --no-build
jupyter labextension install @jupyterlab/plotly-extension --no-build
jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build
jupyter labextension install jupyterlab-dash --no-build
jupyter labextension install jupyterlab-chart-editor --no-build
jupyter labextension install plotlywidget --no-build
jupyter labextension install plotlylab-light-theme --no-build
jupyter labextension install @mflevine/jupyterlab_html --no-build

jupyter lab build --name='PlotlyLab'
jupyter lab clean

unset NODE_OPTIONS
