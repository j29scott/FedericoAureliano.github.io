#!/bin/sh

rm -rf z3
git clone git@github.com:mtrberzi/z3.git
cd z3
python scripts/mk_make.py
cd build
make
