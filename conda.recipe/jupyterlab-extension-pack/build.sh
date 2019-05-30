#!/bin/bash
#

# Avoid "JavaScript heap out of memory" errors during extension installation
export NODE_OPTIONS=--max-old-space-size=4096
export JUPYTER="$PREFIX/bin/jupyter"

# Extensions to install
${JUPYTER} labextension install @jupyterlab/toc@0.6 --no-build
${JUPYTER} labextension install @jupyterlab/git@0.5 --no-build
${JUPYTER} labextension install @jupyterlab/plotly-extension@0.18 --no-build
${JUPYTER} labextension install @jupyterlab/vega4-extension@0.18 --no-build
${JUPYTER} labextension install @jupyterlab/vega5-extension@1.0.0-alpha.4 --no-build
${JUPYTER} labextension install @jupyter-widgets/jupyterlab-manager@0.38 --no-build
${JUPYTER} labextension install jupyterlab-dash@0.1.0-alpha.2 --no-build
${JUPYTER} labextension install jupyterlab-chart-editor@1.1 --no-build
${JUPYTER} labextension install plotlywidget@0.10 --no-build
${JUPYTER} labextension install plotlylab-light-theme --no-build
${JUPYTER} labextension install @mflevine/jupyterlab_html --no-build

unset NODE_OPTIONS
