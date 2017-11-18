#!/usr/bin/env python3

import os
import json
import glob
import subprocess
import datetime


DIRECTORY = os.getcwd()
PROBLEMS = os.path.join(DIRECTORY, 'problems')
DATA = os.path.join(DIRECTORY, 'data')
GRAPHS = os.path.join(DIRECTORY, 'graphs')
BIN = os.path.join(DIRECTORY, 'bin')


def main():
    now = datetime.datetime.now()

    now = "%d/%d/%d" % (now.day, now.month, now.year)

    z3 = glob.glob(os.path.join(DATA, "*Z3str3.json"))
    cvc4 = glob.glob(os.path.join(DATA, "*CVC4.json"))

    z3_results = []
    cvc4_results = []

    for path in z3:
        with open(path, 'r') as f:
            data = f.read()
            j_data = json.loads(data)
            z3_results += j_data

    # print straight from JSON serialiser
    f = os.path.join(DATA,"overall-Z3str3.json")
    with open(f, 'w') as outfile:
        json.dump(z3_results, outfile)

    for path in cvc4:
        with open(path, 'r') as f:
            data = f.read()
            j_data = json.loads(data)
            cvc4_results += j_data

    # print straight from JSON serialiser
    f = os.path.join(DATA,"overall-CVC4.json")
    with open(f, 'w') as outfile:
        json.dump(cvc4_results, outfile)

    compare = os.path.join(BIN, "json2compare.py")
    out = os.path.join(GRAPHS, "overall-comparison.png")
    z3 = os.path.join(DATA,"overall-Z3str3.json")
    cvc4 = os.path.join(DATA,"overall-CVC4.json")
    with open(out, 'w') as outfile:
        subprocess.call([compare, now, cvc4, z3], stdout=outfile)

    cactus = os.path.join(BIN, "json2cactus.py")
    out = os.path.join(GRAPHS, "overall-cactus.png")
    z3 = os.path.join(DATA,"overall-Z3str3.json")
    cvc4 = os.path.join(DATA,"overall-CVC4.json")
    with open(out, 'w') as outfile:
        subprocess.call([cactus, now, "15", cvc4, z3], stdout=outfile)


if __name__ == '__main__':
    main()
