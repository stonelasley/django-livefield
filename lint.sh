#!/usr/bin/env sh

flake8 tests src setup.py
if [ $? -ne 0 ]; then
    echo "Flake8 linting failed."
    exit 1
fi

pylint --rcfile=pylint.rc src/livefield
if [ $? -ne 0 ]; then
    echo "PyLint found errors in src/."
    exit 1
fi

pylint --rcfile=pylint.rc setup.py
if [ $? -ne 0 ]; then
    echo "PyLint found errors in setup.py."
    exit 1
fi
