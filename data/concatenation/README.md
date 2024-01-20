This directory contains concatenated alignments and RAxML trees from [Simmons *et al.* (2022)](https://doi.org/10.1016/j.ympev.2021.107344).

| Data | File |
| --- | --- |
| Concatenated UCE alignment | [`UCE_minus_105.phy.gz`](UCE_minus_105.phy.gz)|
| Partition file for RAxML analysis | [`UCE_minus_105_partitions.txt`](UCE_minus_105_partitions.txt) |
| RAxML UCE tree | [`UCE_minus_105_raxml.tre`](UCE_minus_105_raxml.tre) |

**IMPORANT:** To complete the lab, unzip the data matrix in this directory e.g. with the following command:
```
gunzip UCE_minus_105.phy.gz
```

---

These files come from the following steps.

1. Downloaded data from [FigShare](https://figshare.com/articles/dataset/Supplemental_data_for_Gene-tree_misrooting_drives_conflicts_in_phylogenomic_coalescent_analyses_of_palaeognath_birds_/8866274) in January 2024.

2. Unzipped `Simmons\ et\ al\ trees\ and\ matrices.zip`.

3. Opened `Simmons\ et\ al\ trees\ and\ matrices/UCE\ MAFFT\ alignment\ homology\ errors/concatenation/UCE_minus_105/UCE_homology_errors.xlsx`, deleted rows with red notes, and then saved the first column, producing this [list of 105 UCEs](list_of_105_UCEs_to_exclude.txt) with homology errors.

4. Copied two files from `Simmons\ et\ al\ trees\ and\ matrices/UCE\ MAFFT\ alignment\homology\ errors/concatenation/`. 

5. Copied `Simmons\ et\ al\ trees\ and\ matrices/concatenation/likelihood/plus_Gallus/RAxML_bipartitions.UCE_mafft_BS.tre` and renamed to `UCE_minus_105_raxml.tre`.
