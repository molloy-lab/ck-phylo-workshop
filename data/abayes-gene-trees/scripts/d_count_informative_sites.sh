#!/bin/bash

TYPE=$1  # Data type
GENE=$2  # Gene ID

# Define input files
DATADIR="/Users/ekmolloy/Dropbox/tutorials/workshop-on-phylo/ck-phylo-workshop/data/alignments/$TYPE"

# Do work
cd $DATADIR

pwd

# Check inputs
if [ ! -e $GENE.fasta ]; then
    echo "$GENE.fasta does not exist!"
    exit 1
fi

# Convert to nexus and run PAUP*
if [ ! -e $GENE.csv ]; then
    seqmagick convert \
        --output-format nexus \
        --alphabet dna \
        $GENE.fasta \
        $GENE.nex
    echo "exe $GENE.nex; cstatus; q;" | paup4a168_osx > $GENE.paup_info


    # Repeat, excluding galGal
    if [ ! -e exclude.txt ]; then
        echo "galGal" > exclude.txt
    fi
    seqmagick convert \
        --output-format nexus \
        --alphabet dna \
        $GENE.fasta \
        $GENE-nogal.nex \
        --exclude-from-file exclude.txt
    echo "exe $GENE-nogal.nex; cstatus; q;" | paup4a168_osx > $GENE.nogal.paup_info

    # Store data to CSV
    NTAX1=$(cat $GENE.paup_info | grep "taxa" | awk '{print $4}')
    NCHR1=$(cat $GENE.paup_info | grep "taxa" | awk '{print $6}')
    NPAR1=$(cat $GENE.paup_info | grep "parsimony-informative" | awk '{print $6}')

    NTAX2=$(cat $GENE.nogal.paup_info | grep "taxa" | awk '{print $4}')
    NCHR2=$(cat $GENE.nogal.paup_info | grep "taxa" | awk '{print $6}')
    NPAR2=$(cat $GENE.nogal.paup_info | grep "parsimony-informative" | awk '{print $6}')

    echo "$TYPE,$GENE,$NTAX1,$NCHR1,$NPAR1,$NTAX2,$NCHR2,$NPAR2" > $GENE.csv

    # Final clean up
    rm $GENE.nex
    rm $GENE-nogal.nex
    rm $GENE.paup_info
    rm $GENE.nogal.paup_info
fi


