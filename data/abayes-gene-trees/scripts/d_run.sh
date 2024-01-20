#!/bin/bash

exit

TYPES=( "CNEEs" "introns" "UCEs" )
for TYPE in ${TYPES[@]}; do
    GENES=$(cat $TYPE-list.txt)
    for GENE in ${GENES[@]}; do
        bash d_count_informative_sites.sh $TYPE $GENE
    done
done
