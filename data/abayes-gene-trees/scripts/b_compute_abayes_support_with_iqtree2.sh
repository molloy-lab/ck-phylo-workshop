#!/bin/bash

TYPE=$1  # Data type
GENE=$2  # Gene ID

# Define directories
GROUPDIR="/fs/cbcb-lab/ekmolloy/"
PROJDIR="$GROUPDIR/molloy2024"

# Define software files
IQTREE2="$GROUPDIR/group/software/iqtree-2.2.2.6-Linux/bin/iqtree2"

# Define input files
ALGNDIR="$PROJDIR/alignments/$TYPE"
GTREDIR="$PROJDIR/RAxML_bestML_gene_trees/$TYPE"
ALGN="$ALGNDIR/$GENE.fasta"
GTRE="$GENE.tre"

# Do work
cd $GTREDIR

# Check inputs
if [ ! -e $ALGN ]; then
    echo "$ALGN does not exist!"
    exit 1
fi

if [ ! -e $GTRE ]; then
    echo "$GTREDIR/$GTRE does not exist!"
    exit 1
fi

# Estimate abayes support for gene tree with iqtree2
if [ ! -e $GTRE.abayes ]; then
    $IQTREE2 \
        -s $ALGN \
        -te $GTRE \
        -m GTR+G \
        -abayes \
        -pre tmp-$GTRE.abayes \
        -T 1

    sed 's/\///g' tmp-$GTRE.abayes.treefile > $GTRE.abayes

    rm tmp-$GTRE.abayes.*
fi
