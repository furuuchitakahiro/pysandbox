#!/bin/sh

rm -rf .cache
rm .bash_history
rm .python_history
find . -name "__pycache__" -type d | xargs rm -rf
