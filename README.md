# conda-packages

[![Build Status](https://travis-ci.org/ProgramFan/conda-packages.svg?branch=master)](https://travis-ci.org/ProgramFan/conda-packages)

A set of conda recipes for several packages not currently included in conda-forge.

This repository uses TravisCI to automatically build packages and upload them to https://anaconda.org/programfan/.

## Add a new package

Use `conda-skeleton` to add a new package or update a package from python. If
the package support python 2.7 and python 3.3+, use `noarch: python`. A
typical command to add a package looks like:

```bash
conda skeleton pypi --recursive --noarch-python compiledb
```
