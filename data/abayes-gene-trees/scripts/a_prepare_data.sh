#!/bin/bash

exit

# Download alignments, RAxML best ML gene trees, and species trees
# from https://doi.org/10.5061/dryad.fj02s0j

# Create list of gene ids
for TYPE in "CNEEs" "introns" "UCEs"; do
    cd $alignments/$TYPE
    OUTF=$TYPE-list.txt 
    if [ ! -e $OUTF ]; then
        ls *.fasta | sed 's/.fasta//g' > $OUTF
    fi
done

