import argparse
import tswrapper
import treeswift
import sys


def get_taxon_set(data):
    taxa = []
    if data != "":
        if isinstance(data, str):
            taxa = data.strip().split(',')
        else:
            with open(data, 'r') as fin:
                for line in fin:
                    taxa.append(line)

    return set(taxa)


def main(args):
    if not args.keep is None:
        keep_set = get_taxon_set(args.keep)

    if not args.remove is None:
        remove_set = get_taxon_set(args.remove)

    with open(args.input, 'r') as fin:
        for line in fin:
            tree = treeswift.read_tree(line, "newick")

            if not args.remove is None:
                tree = tree.extract_tree_without(remove_set)
            if not args.keep is None:
                tree = tree.extract_tree_with(keep_set)

            sys.stdout.write(tswrapper.newick(tree) + '\n')


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument("-i", "--input", type=str,
                        help="Input file containing trees (newick strings)", required=True)
    parser.add_argument("-k", "--keep", type=str,
                        help="List of taxa to keep", required=False)
    parser.add_argument("-r", "--remove", type=str,
                        help="List of taxa to remove", required=False)

    main(parser.parse_args())
