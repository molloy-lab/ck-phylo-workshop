#!/bin/bash

exit

INDIR="../../data/CR1/"

gunzip $INDIR/4345ratites.nex.gz 

treeqmc --bp \
		--root galGal \
		--support \
		--writetable treeqmc-bp-cr1-table.csv \
		-i $INDIR/4345ratites.nex \
		-o treeqmc-bp-cr1.tre

    cat treeqmc-bp-cr1.tre | \
        sed "s/\'/\n/g" | \
        sed '/^\[/d' | \
        tr -d "\n" > noqs-treeqmc-bp-cr1.tre

gzip $INDIR/4345ratites.nex