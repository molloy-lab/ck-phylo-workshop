#!/bin/bash

INDIR="../../data/concatenation"
TOOLDIR="../../data/tools"

gunzip $INDIR/UCE_minus_105.phy

caster-pair \
    --root galGal \
    -t 4 \
    -f phylip \
    -i $INDIR/UCE_minus_105.phy \
    -o casterpair-UCE_minus_105.tre


caster-site \
    --root galGal \
    -t 4 \
    -f phylip \
    -i $INDIR/UCE_minus_105.phy \
    -o castersite-UCE_minus_105.tre

python3.10 $TOOLDIR/seqtools.py \
	-f "nexus" \
    -i $INDIR/UCE_minus_105.phy \
    -o UCE_minus_105.nex

echo "exe UCE_minus_105.nex; OUTGROUP galGal; svd nthreads=8 evalQuartets=all; rootTrees; savetrees file=svdquartets-UCE_minus_105.tre format=newick;" | paup4a168_osx -n

gzip UCE_minus_105.nex
gzip $INDIR/UCE_minus_105.phy
