#!/bin/bash

exit

DATADIR="/Users/ekmolloy/Dropbox/tutorials/workshop-on-phylo/ck-phylo-workshop/data"

cd $DATADIR/abayes-gene-trees/info/backup/UCEs
mkdir exclude
for GENE in `cat $DATADIR/concatenation/list_of_105_UCEs_to_exclude.txt`; do
    mv $GENE.tre.abayes exclude.$GENE.tre.abayes
    mv exclude.* exclude
done

cd $DATADIR/alignments/UCEs
mkdir exclude
for GENE in `cat $DATADIR/concatenation/list_of_105_UCEs_to_exclude.txt`; do
    mv $GENE.fasta exclude.$GENE.fasta
    mv $GENE.csv exclude.$GENE.csv
    mv exclude.* exclude
done

