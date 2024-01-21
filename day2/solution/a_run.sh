#!/bin/bash 

exit

INDIR="../../data/abayes-gene-trees/"

GTRES=( "CNEE_abayes_gene_trees_sorted.tre" \
        "UCE_minus_105_abayes_gene_trees_sorted.tre" \
        "UCE_minus_105_abayes_gene_trees_sorted_plus105.tre" \
        "intron_abayes_gene_trees_sorted.tre" )


for GTRE in ${GTRES[@]}; do
     Run TREEQMC
    treeqmc \
        --root galGal \
        --support \
        --writetable treeqmc-$GTRE-table.csv \
        -i $INDIR/$GTRE \
        -o treeqmc-$GTRE

    # For making nice plot https://www.iroki.net/viewer
    cat treeqmc-$GTRE | \
        sed "s/\'/\n/g" | \
        sed '/^\[/d' | \
        tr -d "\n" > noqs-treeqmc-$GTRE

    # Run Weighted TREEQMC
    treeqmc \
        --hybrid \
        --bayes \
        --root galGal \
        --support \
        --writetable treeqmc-hybrid-$GTRE-table.csv \
        -i $INDIR/$GTRE \
        -o treeqmc-hybrid-$GTRE

    # For making nice plot https://www.iroki.net/viewer
    cat treeqmc-hybrid-$GTRE | \
        sed "s/\'/\n/g" | \
        sed '/^\[/d' | \
        tr -d "\n" > noqs-treeqmc-hybrid-$GTRE

    # Run ASTRAL
    astral \
        --root galGal \
        -i $INDIR/$GTRE \
        -o astral-$GTRE

    # Run Weighted ASTRAL
    astral-hybrid \
        --bayes \
        --root galGal \
        -i $INDIR/$GTRE \
        -o astral-hybrid-$GTRE
done

