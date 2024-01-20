import argparse
import numpy
import treeswift
import sys


def main(args):
    # Get prefix of CSV line
    if args.prefix is None:
        prefix = ""
    else:
        prefix = str(args.prefix + ',')

    # Read tree
    with open(args.input, 'r') as fin:
        line = fin.readline()
        #while len(line.strip()) == 0:
        #    line = fin.readline()
        tree = treeswift.read_tree(line, "newick")

    support = []
    for node in tree.traverse_preorder():
        if node.is_leaf():
            pass
        elif node.is_root():
            pass
        else:
            if not node.label is None:
                support.append(float(node.label))

    # Normalize and compute summary statistics
    support = numpy.array(support)
    support = (support - args.low) / (args.high - args.low)

    savg = round(round(numpy.mean(support), 5), 4)
    smed = round(round(numpy.median(support), 5), 4)
    sstd = round(round(numpy.std(support), 5), 4)
    smin = round(round(numpy.min(support), 5), 4)
    smax = round(round(numpy.max(support), 5), 4)

    # Write CSV to standard output
    sys.stdout.write("%s%1.4f,%1.4f,%1.4f,%1.4f,%1.4f\n" \
        % (prefix, savg, smed, sstd, smin, smax))

if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument("-i", "--input", type=str,
                        help="Input containing tree",
                        required=True)

    parser.add_argument("-n", "--low", type=float, default=0.333,
                        help="Minimum support value",
                        required=False)

    parser.add_argument("-x", "--high", type=float, default=1.0,
                        help="Maximum support value",
                        required=False)

    parser.add_argument("-p", "--prefix", type=str,
                        help="Add prefix to CSV output",
                        required=False)

    main(parser.parse_args())
