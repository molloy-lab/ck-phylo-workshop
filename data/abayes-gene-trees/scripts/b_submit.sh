#!/bin/bash

exit

TYPES=( "CNEEs" "introns" "UCEs" )

for TYPE in ${TYPES[@]}; do
    NGEN=$(wc -l $TYPE-list.txt | awk '{print $1}')
    SHIFT=1000

    GSS=( $(seq 0 $SHIFT $NGEN) )

    for GS in ${GSS[@]}; do
        GE=$[GS + SHIFT - 1]

        if [ $GE -gt $[NGEN-1] ]; then
            GE=$[NGEN-1]
        fi

NAME="b.$TYPE.$GS.$GE"
echo "Submitting $NAME..."

sbatch \
    --nodelist="legacy[00-11,13-28,30]" \
    --job-name="$NAME" \
    --output="$NAME.%j.out" \
    --error="$NAME.%j.err" \
    --export=TYPE="$TYPE",GS="$GS",GE="$GE" \
b_drive.sbatch

    done
done

