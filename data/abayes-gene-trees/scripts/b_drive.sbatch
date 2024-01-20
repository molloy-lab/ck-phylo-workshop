#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8gb
#SBATCH --partition=cbcb
#SBATCH --account=cbcb
#SBATCH --qos=highmem
#SBATCH --time=06:00:00

#TYPE=$1
#GS=$2
#GE=$3

GENES=( $(cat $TYPE-list.txt) )

NGEN=${#GENES[@]}
if [ $GE -gt $NGEN ]; then
    GE=$NGEN
fi

for GNUM in `seq $GS $GE`; do
    GENE=${GENES[$GNUM]}
    echo "Processing gene $GENE..."
    ./b_compute_abayes_support_with_iqtree2.sh $TYPE $GENE
    echo "...done"
done

