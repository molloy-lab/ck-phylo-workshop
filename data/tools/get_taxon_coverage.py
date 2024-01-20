import argparse
import treeswift
import sys


def main(args):
    taxon2count = {}
    total = 0

    with open(args.input, 'r') as fin:
        for line in fin:
            tree = treeswift.read_tree(line, "newick")

            for leaf in tree.traverse_leaves():
                try:
                    taxon2count[leaf.label] += 1
                except KeyError:
                    taxon2count[leaf.label] = 1

            total += 1

    #print(taxon2count)

    for key in taxon2count:
        taxon2count[key] /= total

    keys = ["rhePen", "rheAme",
            "droNov", "casCas", "aptRow", "aptOwe", "aptHaa", "aptMan",
            "tinGut", "notPer", "eudEle", "cryCin", "anoDid",
            "galGal", "strCam"]

    for key in keys:
        try:
            val = taxon2count[key]
        except KeyError:
            val = 0.0
        
        print("%s %f" % (key, val))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()

    parser.add_argument("-i", "--input", type=str,
                        help="Input containing gene trees",
                        required=True)

    main(parser.parse_args())


"""
SUMMARY FROM RUNNING ON DATA: 

introns
{'galGal': 5016, 'strCam': 5016, 'rhePen': 5016, 'rheAme': 5016, 'anoDid': 4982, 'eudEle': 5016, 'notPer': 5016, 'tinGut': 5016, 'cryCin': 5016, 'droNov': 5016, 'casCas': 5016, 'aptRow': 5016, 'aptOwe': 5016, 'aptHaa': 5016, 'aptMan': 2560}
{'galGal': 1.0, 'strCam': 1.0, 'rhePen': 1.0, 'rheAme': 1.0, 'anoDid': 0.9932216905901117, 'eudEle': 1.0, 'notPer': 1.0, 'tinGut': 1.0, 'cryCin': 1.0, 'droNov': 1.0, 'casCas': 1.0, 'aptRow': 1.0, 'aptOwe': 1.0, 'aptHaa': 1.0, 'aptMan': 0.5103668261562998}

UCEs
{'galGal': 3053, 'strCam': 3053, 'rhePen': 3038, 'rheAme': 3039, 'anoDid': 3041, 'notPer': 3036, 'eudEle': 3043, 'tinGut': 2893, 'cryCin': 3040, 'droNov': 3042, 'casCas': 3043, 'aptMan': 1966, 'aptRow': 3052, 'aptOwe': 3047, 'aptHaa': 3046}
{'galGal': 1.0, 'strCam': 1.0, 'rhePen': 0.9950867998689813, 'rheAme': 0.9954143465443825, 'anoDid': 0.996069439895185, 'notPer': 0.9944317065181788, 'eudEle': 0.9967245332459875, 'tinGut': 0.9475925319358008, 'cryCin': 0.9957418932197838, 'droNov': 0.9963969865705863, 'casCas': 0.9967245332459875, 'aptMan': 0.643956763838847, 'aptRow': 0.9996724533245988, 'aptOwe': 0.9980347199475925, 'aptHaa': 0.9977071732721913}

CNEEs
{'aptMan': 11534, 'anoDid': 12643, 'strCam': 12676, 'galGal': 12676, 'rhePen': 12676, 'rheAme': 12676, 'tinGut': 12676, 'notPer': 12676, 'eudEle': 12676, 'cryCin': 12676, 'droNov': 12676, 'casCas': 12676, 'aptRow': 12676, 'aptOwe': 12676, 'aptHaa': 12676}
{'aptMan': 0.909908488482171, 'anoDid': 0.9973966550962449, 'strCam': 1.0, 'galGal': 1.0, 'rhePen': 1.0, 'rheAme': 1.0, 'tinGut': 1.0, 'notPer': 1.0, 'eudEle': 1.0, 'cryCin': 1.0, 'droNov': 1.0, 'casCas': 1.0, 'aptRow': 1.0, 'aptOwe': 1.0, 'aptHaa': 1.0}

aptMan is present in 51% of introns and 64% of UCEs - could try removing aptMan
"""

