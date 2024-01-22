Coalescent Lab - Day 2
===

In this lab, we will estimate species trees on data sets from [Cloutier *et al.* (2019)](https://doi.org/10.1093/sysbio/syz019) using coalescent quartet-based methods. We will then compare and contrast the relationship between clades A, B1, B2, and C across the different methods and data types.

<p align="center">
<img src="clades_low.jpg" alt="clades" width="100%" height="auto"/>
</p>


To fill in the table below, let's divide-and-conquer into ~7 groups. If your group finishes your portion of the table, try out some of the other analyses, prioritizing what you are interested in, or go back and work on the day 1 lab, or relax. :)

| Data | Study | Method Type | Method | Species Tree Topology | Probability under MSC model species tree from day 1 | 
| --- | --- | --- | --- | --- | --- |
| CNEE | group 1 | Gene Tree Summary | TREE-QMC |  |  |
| CNEE | group 2 | Gene Tree Summary | TREE-QMC-support |  |  |
| CNEE | group 3 | Gene Tree Summary | TREE-QMC-length |  |  |
| CNEE | group 4 | Gene Tree Summary | TREE-QMC-hybrid |  |  |
| CNEE | Cloutier *et al.* (2019) | Concatenation | ExaML | `(((((B1,C),B2),A),strCam),galGal);` | 0.0019 |
| intron | group 1 | Gene Tree Summary | TREE-QMC |  |  |
| intron | group 2 | Gene Tree Summary | TREE-QMC-support |  |  |
| intron | group 3 | Gene Tree Summary | TREE-QMC-length |  |  |
| intron | group 4 | Gene Tree Summary | TREE-QMC-hybrid |  |  |
| intron | Cloutier *et al.* (2019) | Concatenation | ExaML | `(((((B1,B2),C),A),strCam),galGal);` | 0.0132 |
| UCE (plus 105) | group 1 | Gene Tree Summary | TREE-QMC  |  |  |
| UCE (plus 105) | group 2 | Gene Tree Summary | TREE-QMC-support  |  |  |
| UCE (plus 105) | group 3 | Gene Tree Summary | TREE-QMC-length  |  |  |
| UCE (plus 105) | group 4 |  Gene Tree Summary | TREE-QMC-hybrid |  |  |
| UCE (plus 105) | Cloutier *et al.* (2019) | Concatenation | ExaML |  `(((((B1,C),B2),A),strCam),galGal);` | 0.0019 |
| UCE (minus 105) | group 1 | Gene Tree Summary | TREE-QMC |  |  |
| UCE (minus 105) | group 2 | Gene Tree Summary | TREE-QMC-support |  |  |
| UCE (minus 105) | group 3 | Gene Tree Summary | TREE-QMC-length |  |  |
| UCE (minus 105) | group 4 | Gene Tree Summary | TREE-QMC-hybrid |  |  |
| UCE (minus 105) | Simmons *et al.* (2022) | Concatenation | Partitioned RAxML | `(((((B1,C),B2),A),strCam),galGal);` | 0.0019 |
| UCE (minus 105) | group 5 | Site (ACGT) | SVDquartets |  |  |
| UCE (minus 105) | group 6 | Site (ACGT) | CASTER-site |  |  |
| UCE (minus 105) | group 6 | Site (ACGT) | CASTER-pair |  |  |
| CR1 | group 7 | Site (01) | TREE-QMC-bp |  |  |


Data
---

| Data | Directory |
| --- | --- |
| Intron gene trees with abayes support | [`../data/abayes-gene-trees/intron_abayes_gene_trees_sorted.tre`](../data/abayes-gene-trees/intron_abayes_gene_trees_sorted.tre) |
| UCE gene trees with abaye support | [`../data/abayes-gene-trees/UCE_minus_105_abayes_gene_trees_sorted.tre`](../data/abayes-gene-trees/UCE_minus_105_abayes_gene_trees_sorted.tre) |
| UCE gene trees with abayes support (minus 105 with homology errors) | [`../data/abayes-gene-trees`](../data/abayes-gene-trees) |
| CR1 presence/absence matrix | [`../data/CR1/4345ratites.nex.gz`](../data/CR1/4345ratites.nex.gz) |
| Concatenated alignment (UCEs minus 105)| [`../data/concatenation/UCE_minus_105.phy.gz`](../data/concatenation/UCE_minus_105.phy.gz) |
| Species trees from prior studies | [`../data/species-trees`](../data/species-trees) |


Group 1
---
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) (default mode) on all four sets of gene trees: CNEEs, introns, UCEs, and UCEs (minus 105 loci with homology errors). To interpret the results, consider quartet support in the estimated species tree as well as the [summary metrics](../data/abayes-gene-trees/README.md) reported for the input gene trees and their alignments.

Notes:
* Recall that the gene tree summary methods TREE-QMC and ASTRAL were introduced in the [Day 1 Lab](../day1/activityC.md).
* Gene tree summary methods are susceptible to gene tree estimation error (GTEE), which could be the result of low phylogenetic signal (if sequences are highly conserved), model violations (e.g., selection or heterotachy), or earlier errors made during ortholog identification and/or multiple sequence alignment.
* In today's lab, both TREE-QMC and ASTRAL return the same tree given the same data set (as expected since these data sets have a small number of taxa and low missingness); thus we focus on TREE-QMC.


Group 2
---
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) with **support weighting** on all four sets of gene trees: CNEEs, introns, UCEs, and UCEs (minus 105 loci with homology errors). To interpret the results, consider quartet support in the estimated species tree as well as the [summary metrics](../data/abayes-gene-trees/README.md) reported for the input gene trees and their alignments.

Notes:
* Recall that the gene tree summary methods TREE-QMC and ASTRAL were introduced in the [Day 1 Lab](../day1/activityC.md).
* Gene tree summary methods are susceptible to gene tree estimation error (GTEE), which could be the result of low phylogenetic signal (if sequences are highly conserved), model violations (e.g., selection or heterotachy), or earlier errors made during ortholog identification and/or multiple sequence alignment.
* **Quartet weighting based on branch support** in the input gene trees was introduced by [Zhang & Mirarab (2022)](https://doi.org/10.1093/molbev/msac215) to improve the robustness of ASTRAL to gene tree estimation error (GTEE). It weights quartets by the support of their *internal* branch (lower support is downweighted and higher support is upweighted); this approach is consistent under the "MSC+Random Noise+Support model".
* To take advantage of this weighting scheme within TREE-QMC, we developed a new algorithm for (normalized) quartet graph construction; a related weighting scheme has also been implemented in the distance-based summary method ASTRID [[Liu & Warnow, 2023]](https://doi.org/10.1186/s13015-023-00230-6).
* The support weighting scheme did not automatically build with ASTRAL/ASTER so we did not run it.


Group 3
---
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) with **length weighting** on all four sets of gene trees: CNEEs, introns, UCEs, and UCEs (minus 105 loci with homology errors). To interpret the results, consider quartet support in the estimated species tree as well as the [summary metrics](../data/abayes-gene-trees/README.md) reported for the input gene trees and their alignments.

Notes:
* Recall that the gene tree summary methods TREE-QMC and ASTRAL were introduced in the [Day 1 Lab](../day1/activityC.md).
* Gene tree summary methods are susceptible to gene tree estimation error (GTEE), which could be the result of low phylogenetic signal (if sequences are highly conserved), model violations (e.g., selection or heterotachy), or earlier errors made during ortholog identification and/or multiple sequence alignment.
* **Quartet weighting based on branch length** in the input gene trees was introduced by [Zhang & Mirarab (2022)](https://doi.org/10.1093/molbev/msac215) to improve the robustness of ASTRAL to gene tree estimation error (GTEE). It weights quartets by the lengths of their *terminal* branches (longer branches are downweighted and shorter branches are upweighted); this approach is consistent under the MSC.
* To take advantage of this weighting scheme within TREE-QMC, we developed a new algorithm for (normalized) quartet graph construction; a related weighting scheme has also been implemented in the distance-based summary method ASTRID [[Liu & Warnow, 2023]](https://doi.org/10.1186/s13015-023-00230-6).
* Length weighting did not automatically build with ASTRAL/ASTER so we did not run it.


Group 4
---
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) with **hybrid weighting** on all four sets of gene trees: CNEEs, introns, UCEs, and UCEs (minus 105 loci with homology errors). To interpret the results, consider quartet support in the estimated species tree as well as the [summary metrics](../data/abayes-gene-trees/README.md) reported for the input gene trees and their alignments.

Notes: 
* Recall that the gene tree summary methods TREE-QMC and ASTRAL were introduced in the [Day 1 Lab](../day1/activityC.md).
* Gene tree summary methods are susceptible to gene tree estimation error (GTEE), which could be the result of low phylogenetic signal (if sequences are highly conserved), model violations (e.g., selection or heterotachy), or earlier errors made during ortholog identification and/or multiple sequence alignment.
* The **hybrid quartet weighting scheme**, which combines length and support weighting, was introduced by [Zhang & Mirarab (2022)](https://doi.org/10.1093/molbev/msac215) to improve the robustness of ASTRAL to gene tree estimation error (GTEE).
* To take advantage of this weighting scheme within TREE-QMC, we developed a new algorithm for (normalized) quartet graph construction.
* In today's lab, both TREE-QMC and ASTRAL return the same tree given the same data set (as expected since these data sets have a small number of taxa and low missingness); thus we focus on TREE-QMC.

Group 5
---
Run the coalescent site-based method **SVDQuartets** on the concatenated UCE alignment (minus 105 loci with homology errors).

Notes:
* SVDquartets estimates a species tree from the conatenated alignment on subsets of four taxa using the singular value decomposition (SVD); these quartets are then assembled into a species tree. This approach is consistent under the MSC+GTR model [[Wascher & Kubatko, 2021]](https://doi.org/10.1093/sysbio/syaa039) and conveniently bypasses gene tree estimation -- and thus problems with gene tree estimation error. However, there can still be errors (from ortholog identification and alignment) as well as model violations (e.g., selection or heterotachy).
* To learn about the SVDquartets method, see [Chifman & Kubatko (2014)](https://doi.org/10.1093/bioinformatics/btu530) and [Chifman & Kubatko (2015)](https://doi.org/10.1016/j.jtbi.2015.03.006).
* SVDquartets is implemented in [PAUP*](https://paup.phylosolutions.com).
* Check out this [tutorial](https://www.asc.ohio-state.edu/kubatko.2//phylogenomics2019/SpeciesTreeTutorial.html).

Group 6
---
Run the new coalescent site-based methods **CASTER-site** and **CASTER-pair** on the concatenated UCE alignment (minus 105 loci with homology errors).

Notes:
* CASTER is implemented as part of [ASTRAL/ASTER](https://github.com/chaoszhang/ASTER/).
* To learn more about the CASTER, check out this very recent and exciting preprint: [Zhang *et al.* (2023)](https://doi.org/10.1101/2023.10.04.560884).


Group 7
---
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) to reconstruct a species tree from the CR1 presence / absence patterns via quartets

Notes:
* To learn more about this approach, see [Springer *et al.* (2020)](https://doi.org/10.1093/jhered/esz076) and [Molloy *et al.* (2021)](https://doi.org/10.1093/sysbio/syab086).
* The main benefit is that the presence/absence of low-homoplasy insertions across genomes may be more robust to error than estimated gene trees. Moreover, such insertions may be less likely to be observed in regions of the genome under selection, thus fitting the neutrality assumption of the MSC. However, they can still undergo ILS; thus the utility of quartets.
* On the other hand, each CR1 presence/absence character is like a tree with just one branch, separating species with the insertion (derived state) from those without it (ancestral state). Thus, a single character may not contain *any* quartets that inform how to resolve a particular branch in the species tree.
* Thus, when interpreting the results, it's important to confirm the effective number (`EN`) of markers with information to resolve each branch in the estimated species tree is sufficiently high.


Alternative activities if you have free time and don't want to try out other methods
---
Try evaluating the quality of **two** different species tree topologies found in the table, looking quartet frequencies around branches of interest (with TREE-QMC or ASTRAL), branch support values (with ASTRAL or CASTER), pseudolikelihood scores (with PhyloNetworks), and/or goodness of fit (with PhyloNetworks). Be sure to use the same input data when doing the comparison.


Dicussion Questions
---

1. What are some possible reasons for the differences in species trees across methods and/or data types? How would you explain the differences in species trees when running TREE-QMC with different settings on the UCEs? How would you explain the differences in species trees when running different versions of CASTER?
2. Given the pros/cons of different methods and the data types explored in this lab, are you convinced of a single species tree for *Palaeognathae*? If so, why? If not, what follow-up analyses would you recommend given unlimited resources?
3. This lab focused on gene tree heterogeneity due to ILS, GTEE, and data type. What are some other sources of gene tree heterogeneity? Could these be an issue for *Palaeognathae*? How would explore these issues further?
4. Are ILS, GTEE, and data type concerns for your study system?
