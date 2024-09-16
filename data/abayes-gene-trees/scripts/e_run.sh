#!/bin/bash

exit

TYPES=( "CNEEs" "introns" "UCEs" )
for TYPE in ${TYPES[@]}; do
    GENES=$(cat $TYPE-list.txt)
    for GENE in ${GENES[@]}; do
        bash e_get_branch_support.sh $TYPE $GENE
    done
done

