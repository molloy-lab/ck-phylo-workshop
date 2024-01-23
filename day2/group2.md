Group 2
===

In this lab, we will estimate species trees on data sets from [Cloutier *et al.* (2019)](https://doi.org/10.1093/sysbio/syz019) using coalescent quartet-based methods. We will then compare and contrast the relationship between clades A, B1, B2, and C across the different methods and data types.

<p align="center">
<img src="clades_low.jpg" alt="clades" width="100%" height="auto"/>
</p>


Table
---

| Data | Study / Group | Method Type | Method | Species Tree Topology | Probability under MSC model species tree from day 1 | 
| --- | --- | --- | --- | --- | --- |
| CNEE | group 2 | GT Summary | TREE-QMC-support |  |  |
| intron | group 2 | GT Summary | TREE-QMC-support |  |  |
| UCE +105 | group 2 | GT Summary | TREE-QMC-support  |  |  |
| UCE -105 | group 2 | GT Summary | TREE-QMC-support |  |  |
| UCE -105 | Simmons *et al.* (2022) | Concatenation | Partitioned RAxML | `(((((B1,C),B2),A),strCam),galGal);` | 0.0019 |


Data
---

| Data | Directory |
| --- | --- |
| CNEE gene trees with abayes support | [`../data/abayes-gene-trees/CNEE_abayes_gene_trees_sorted.tre`](../data/abayes-gene-trees/CNEE_abayes_gene_trees_sorted.tre) |
| Intron gene trees with abayes support | [`../data/abayes-gene-trees/intron_abayes_gene_trees_sorted.tre`](../data/abayes-gene-trees/intron_abayes_gene_trees_sorted.tre) |
| UCE gene trees with abaye support | [`../data/abayes-gene-trees/UCE_minus_105_abayes_gene_trees_sorted.tre`](../data/abayes-gene-trees/UCE_minus_105_abayes_gene_trees_sorted.tre) |
| UCE gene trees with abayes support (minus 105 with homology errors) | [`../data/abayes-gene-trees`](../data/abayes-gene-trees) |


Analysis
---
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) with **support weighting** on all four sets of gene trees: CNEEs, introns, UCEs, and UCEs (minus 105 loci with homology errors). To interpret the results, consider quartet support in the estimated species tree as well as the [summary metrics](../data/abayes-gene-trees/README.md) reported for the input gene trees and their alignments.

Notes:
* Recall that the gene tree summary methods TREE-QMC and ASTRAL were introduced in the [Day 1 Lab](../day1/activityC.md).
* Gene tree summary methods are susceptible to gene tree estimation error (GTEE), which could be the result of low phylogenetic signal (if sequences are highly conserved), model violations (e.g., selection or heterotachy), or earlier errors made during ortholog identification and/or multiple sequence alignment.
* **Quartet weighting based on branch support** in the input gene trees was introduced by [Zhang & Mirarab (2022)](https://doi.org/10.1093/molbev/msac215) to improve the robustness of ASTRAL to gene tree estimation error (GTEE). It weights quartets by the support of their *internal* branch (lower support is downweighted and higher support is upweighted); this approach is consistent under the "MSC+Random Noise+Support model".
* To take advantage of this weighting scheme within TREE-QMC, we developed a new algorithm for (normalized) quartet graph construction; a related weighting scheme has also been implemented in the distance-based summary method ASTRID [[Liu & Warnow, 2023]](https://doi.org/10.1186/s13015-023-00230-6).
* The support weighting scheme did not automatically build with ASTRAL/ASTER so we did not run it.
