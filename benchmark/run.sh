#!/bin/sh

rm status.txt
rm -r data graphs
mkdir data
mkdir graphs
# ./grabz3.sh
./bench.py 2> status.txt
./overall.py

# git add data graphs
# git commit -m "Benchmarks"
# git push origin master