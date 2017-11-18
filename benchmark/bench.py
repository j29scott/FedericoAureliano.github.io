#!/usr/bin/env python3

import os
import sys
import json
import glob
import subprocess
import signal
import datetime

from collections import namedtuple

# constants
SAT_RESULT = 'sat'
UNSAT_RESULT = 'unsat'
UNKNOWN_RESULT = 'unknown'
TIMEOUT_RESULT = 'timeout'
ERROR_RESULT = 'error'

TIMEOUT = 15.0

DIRECTORY = os.getcwd()
PROBLEMS = os.path.join(DIRECTORY, 'problems')
DATA = os.path.join(DIRECTORY, 'data')
GRAPHS = os.path.join(DIRECTORY, 'graphs')
BIN = os.path.join(DIRECTORY, 'bin')

Z3 = os.path.join(DIRECTORY, "z3/build/z3 ")
SOLVERS = {"Z3str3":Z3+"smt.string_solver=z3str3 ", "CVC4":"cvc4 --lang smt --strings-exp "}

# data
Result = namedtuple('Result', ('solver', 'problem', 'elapsed', 'result', 'command'))

# helpers
def output2result(output):
    # it's important to check for unsat first, since sat
    # is a substring of unsat
    if 'UNSAT' in output or 'unsat' in output:
        return UNSAT_RESULT
    if 'SAT' in output or 'sat' in output:
        return SAT_RESULT
    if 'UNKNOWN' in output or 'unknown' in output:
        return UNKNOWN_RESULT

    print('couldn\'t parse output: \'' + output + '\'', file=sys.stderr)
    return ERROR_RESULT

def run_problem(solver, invocation, problem):
    # pass the problem to the command
    command = invocation + problem
    # get start time
    start = datetime.datetime.now().timestamp()
    # run command
    process = subprocess.Popen(
        command,
        shell      = True,
        stdout     = subprocess.PIPE,
        stderr     = subprocess.PIPE,
        preexec_fn = os.setsid
    )
    # wait for it to complete
    try:
        process.wait(timeout=TIMEOUT)
    # if it times out ...
    except subprocess.TimeoutExpired as e:
        # kill it
        print('TIMED OUT:', repr(command), '... killing', process.pid, file=sys.stderr)
        os.killpg(os.getpgid(process.pid), signal.SIGINT)
        # set timeout result
        elapsed = TIMEOUT
        result  = TIMEOUT_RESULT
    # if it completes in time ...
    else:
        # measure run time
        end     = datetime.datetime.now().timestamp()
        elapsed = end - start
        # get result
        stdout = process.stdout.read().decode('utf-8')
        stderr = process.stderr.read().decode('utf-8')
        result = output2result(stdout + stderr)
    # make result
    result = Result(
        command=invocation + 'PROBLEM',
        solver=solver,
        problem=problem,
        elapsed=elapsed,
        result=result
    )
    return result

def gen_compare(category):
    # generate comparison graph
    # BIN_DIR/json2compare.py "Comparison for Small Concats" $cvc4_json $z3str3_json > $GRAPHS_DIR/comparison.png
    compare = os.path.join(BIN, "json2compare.py")
    title = " Comparison for " + category +" "
    z3 = os.path.join(DATA,category+"-Z3str3.json")
    cvc4 = os.path.join(DATA,category+"-CVC4.json")
    out = os.path.join(GRAPHS, category+"-"+"comparison.png")
    with open(out, 'w') as outfile:
        subprocess.call([compare, title, cvc4, z3], stdout=outfile)

def gen_cactus(category):
    # generate cactus graph
    # BIN_DIR/json2cactus.py "Cactus plot for Small Concats" 15 $cvc4_json $z3str3_json > $GRAPHS_DIR/cactus.png
    cactus = os.path.join(BIN, "json2cactus.py")
    title = " Cactus plot for " + category +" "
    z3 = os.path.join(DATA,category+"-Z3str3.json")
    cvc4 = os.path.join(DATA,category+"-CVC4.json")
    out = os.path.join(GRAPHS, category+"-"+"cactus.png")
    with open(out, 'w') as outfile:
        subprocess.call([cactus, title, "15", cvc4, z3], stdout=outfile)

def main():
    for (path, _, problems) in os.walk(PROBLEMS):
        if (problems == []):
            continue
        category = os.path.basename(path)
        for solver, command in SOLVERS.items():
            # run the problems
            results = []
            for problem in problems:
                result = run_problem(solver, command, os.path.join(path, problem))
                results.append(result)
            # transform results (which are namedtuples) to dicts
            result_dicts = [r._asdict() for r in results]
            # print straight from JSON serialiser
            f = os.path.join(DATA,category+"-"+solver+".json")
            with open(f, 'w') as outfile:
                json.dump(result_dicts, outfile)
        gen_compare(category)
        gen_cactus(category)

if __name__ == '__main__':
    main()
