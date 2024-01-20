
This directory contains gene trees estimated by [Cloutier *et al.* (2019)](https://doi.org/10.1093/sysbio/syz019), with abayes supported estimated for this tutorial. Gene trees are sorted from highest to lowest mean branch support.

| Data | File |
| --- | --- |
| intron gene trees | [`intron_abayes_gene_trees_sorted.tre`](intron_abayes_gene_trees_sorted.tre) |
| UCE gene trees| [`UCE_abayes_gene_trees_sorted.tre`](UCE_abayes_gene_trees_sorted.tre) |
| UCE gene trees (plus 105 with homology errors)| [`UCE_abayes_gene_trees_sorted_plus105.tre`](UCE_abayes_gene_trees_sorted_plus105.tre) |
| CNEE gene trees | [`intron_abayes_gene_trees_sorted.tre`](CNEE_abayes_gene_trees_sorted.tre) |


**NOTE 1:** The mean branch support in the UCE and intron gene trees is mucher higher than in the CNEE gene trees.

| Data Type | \# of loci | Alignment Length | # of Informative Sites | Mean branch support | Median branch support |
| :---: | :---: | :---: | :---: | :---:  | :---: |
| intron | 5016| 5560 &pm; 7165 | 1211 &pm; 1489 | 0.850 &pm; 0.094 | 0.985 &pm; 0.056 |
| UCE (minus 105) | 3053| 2676 &pm; 685 | 430 &pm; 183 | 0.839 &pm; 0.066 | 0.994 &pm; 0.032 |
| CNEE | 12676 | 378 &pm; 149 | 21 &pm; 15 | 0.530 &pm; 0.116 | 0.573 &pm; 0.309 |

*Values in table are means (&pm; standard deviation) across all genes. Branch support is mapped from [0.333, 1.0] to [0.0, 1.0].*

**NOTE 2:** Taxon occupancy across all gene trees is very good, with one outlier: North Island Brown Kiwi (`aptMan`).

| Group | Taxon Name | Taxon Code | CNEEs Occupancy  | Intron Occupancy | UCE Occupancy |
| :---: | :---: | :---: | :---:  | :---: | :---:  |
| A | Lesser Rhea                 | `rhePen` | 1.0    | 1.0    | 0.9951 |
| A | Greater Rhea                | `rheAme` | 1.0    | 1.0    | 0.9954 |
| B | Emu                         | `droNov` | 1.0    | 1.0    | 0.9964 |
| B1 | Southern Cassowary          | `casCas` | 1.0    | 1.0    | 0.9967 |
| B1 | Okarito Brown Kiwi          | `aptRow` | 1.0    | 1.0    | 0.9997 |
| B2 | Little Spotted Kiwi         | `aptOwe` | 1.0    | 1.0    | 0.9980 | 
| B2 | Great Spotted Kiwi          | `aptHaa` | 1.0    | 1.0    | 0.9977 | 
| B2 | **North Island Brown Kiwi** | `aptMan` | 0.9099 | 0.5104 | 0.6440 |
| C | White-throated Tinamou      | `tinGut` | 1.0    | 1.0    | 0.9476 |
| C | Chilean Tinamou             | `notPer` | 1.0    | 1.0    | 0.9944 | 
| C | Elegant Crested Tinamou     | `eudEle` | 1.0    | 1.0    | 0.9967 |
| C | Thicket Tinamou             | `cryCin` | 1.0    | 1.0    | 0.9957 |
| C | Little Bush Moa             | `anoDid` | 0.9974 | 0.9932 | 0.9961 |
| D | Chicken                     | `galGal` | 1.0    | 1.0    | 1.0    |
| D | Ostrich                     | `strCam` | 1.0.   | 1.0    | 1.0    |


---

These files come from the following steps.

1. Downloaded from `alignments.tar.gz` and `RAxML_bestML_gene_trees.tar.gz` from [Dryad](https://datadryad.org/stash/dataset/doi:10.5061/dryad.fj02s0j) in January 2024.

2. Estimated [abayes](https://doi.org/10.1093/sysbio/syr041) support for each gene tree with [IQTREE2](http://www.iqtree.org). 

3. Removed [105 UCEs with homology errors](../concatenation/list_of_105_UCEs_to_exclude.txt) from [Simmons *et al.* (2022)](https://doi.org/10.1016/j.ympev.2021.107344).

4. Computed mean branch support for each gene tree and then sorted the gene tree files from highest to lowest based on mean branch support.

5. Computed summary metrics for alignments and gene trees (second table above).

6. Evaluated taxon occupancy (third table above).
