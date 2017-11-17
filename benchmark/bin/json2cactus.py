#!/usr/bin/env python3

import sys
import os
import tempfile
import json
import argparse
import copy

from collections import OrderedDict

# constants
LABEL_FONTSIZE    = 10
TITLE_FONTSIZE    = 14
SUBTITLE_FONTSIZE = 10
AXIS_MIN          = 0

DESCRIPTION = '''
Make a cactus plot from given datasets and print it in PNG format on stdout.

notes:
  no check is made to see if the datasets have the same problems
  the datasets are not required to be of the same size

dataset format:
  [
      {
          "problem": "/path/to/problem",
          "result":  "sat"|"unsat"|"unknown"|"timeout"|"error",
          "solver":  "solver name",
          "elapsed": 1.0 // time it took, as a float
      },
      ...
  ]
'''

MARKERS = [
    4, # >
    5, # v
    6, # <
    7, # ^
    8  # x
]

# globals
args_timeout = 0.0

# helpers
def plottable(row):
    return (
        row['result'] == 'sat' or
        row['result'] == 'unsat' or
        row['result'] == 'unknown' or
        row['result'] == 'timeout'
    )

def unknown2timeout(row):

    # interpret 'unknown' rows as if they were 'timeout' rows
    if row['result'] == 'unknown':

        # copy the row
        rowcopy = copy.deepcopy(row)

        # change the result to look like a timeout
        global args_timeout
        rowcopy['elapsed'] = args_timeout
        rowcopy['result'] = 'timeout'

        return rowcopy
    else:
        return row

def get_solver_name(dataset):
    return dataset[0]['solver']

def data2png(raw_data, title):

    # configure plot library to use SVG
    import matplotlib
    matplotlib.use('svg')
    import matplotlib.pyplot as pyplot

    # set axis labels and graph title
    pyplot.suptitle(title + '\n', fontsize=TITLE_FONTSIZE)
    pyplot.xlabel('problems', fontsize=SUBTITLE_FONTSIZE)
    pyplot.ylabel('time (s)', fontsize=LABEL_FONTSIZE, labelpad=12)

    # sort the data sets by solver name
    raw_data = sorted(raw_data, key=lambda x: get_solver_name(x))

    # groom the data:
    #   - remove the incomplete points
    #   - sort the remaining points
    groomed_data = []
    for points in raw_data:
        kept_points   = filter(plottable, map(unknown2timeout, points))
        sorted_points = sorted(kept_points, key=lambda x: x['elapsed'])
        groomed_data.append(sorted_points)

    # determine axis limits
    min_x = AXIS_MIN
    max_x = max(len(points) for points in groomed_data)
    min_y = AXIS_MIN
    max_y = max(max(point['elapsed'] for point in points) for points in groomed_data)

    # set axis limits
    pyplot.axis([min_x, max_x, min_y, max_y])

    # add the data points
    for i, dataset in enumerate(groomed_data):

        # figure out x coordinates, y coordinates, and marker
        x      = range(len(dataset))
        y      = [point['elapsed'] for point in dataset]
        marker = MARKERS[i % len(MARKERS)]

        pyplot.scatter(x, y, marker=marker, label=get_solver_name(dataset))

    # show the legend
    pyplot.legend(loc='upper left');

    # adjust plot spacing to fit the data
    pyplot.autoscale(tight=False)

    # make a temporary file to store the graph
    # FIXME:
    #       this is here because I don't know how to make pyplot
    #       print the graph to something other than a file
    # NOTE:
    #      doing an instant close() of the file because pyplot will open it
    #      on its own, and will close it on its own, after which we will
    #      manually open it on our own
    fd, path = tempfile.mkstemp(suffix='.png')
    os.close(fd)

    # save the graph
    pyplot.savefig(path)

    # read the graph back
    with open(path, 'rb') as graph_file:
        png = graph_file.read()

    return png

def main():

    # create arg parser
    parser = argparse.ArgumentParser(
        description     = DESCRIPTION,
        formatter_class = argparse.RawTextHelpFormatter
    )
    parser.add_argument(
        'name',
        type = str,
        help = 'name of the experiment (used in the title)'
    )
    parser.add_argument(
        'timeout',
        type = float,
        help = 'timeout with which the results were gathered (used in the title)'
    )
    parser.add_argument(
        'datasets',
        metavar = 'dataset',
        type    = str,
        nargs   = '+',
        help    = 'JSON file with benchmark results in the described format'
    )

    # parse args
    args = parser.parse_args()

    # set globals
    global args_timeout
    args_timeout = args.timeout

    # load data
    data = {}
    for dataset_path in args.datasets:

        # read file
        with open(dataset_path, 'r') as file:
            points = json.load(file)

        # add points
        for point in points:
            solver = point['solver']

            # create dataset for the solver
            if solver not in data:
                data[solver] = []

            # add the point to the dataset if it's plottable
            if plottable(point):
                data[solver].append(point)

    # check data size
    if len(data) < 1:
        print('ERROR: no data', file=sys.stderr)
        exit(1)

    # drop empty data sets
    empty_set_names = []
    for solver, points in data.items():
        if len(points) < 1:
            print('WARNING: no plottable points for solver {}'.format(solver), file=sys.stderr)
            empty_set_names.append(solver)

    for name in empty_set_names:
        data.pop(name)

    # get largest data set size
    size = max(map(len, data.values()))

    # make title
    title = '{}: {} problems, {}-s timeout'.format(args.name, size, args.timeout)

    # print PNG image
    sys.stdout.buffer.write(data2png(data.values(), title))

if __name__ == '__main__':
    main()
