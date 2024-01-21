Coalescent Lab - Day 2
===

In this lab, we will analyze data from [Cloutier *et al.* (2019)](https://doi.org/10.1093/sysbio/syz019) and examine the relationship between clades A, B1, B2, C, and outgroups: chicken (`galGal`) and ostrich (`strCam`).

<p align="center">
<img src="clades.png" alt="clades" width="100%" height="auto"/>
</p>


To fill in the table below, let's divide-and-conquer into ~7 groups. If your group finishes your portion of the table, try out some of the other analyses, prioritizing what you are interested in.

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
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) (default mode) on all four sets of gene trees: CNEEs, introns, UCEs, and UCEs (minus 105 loci with homology errors). 

*  TREE-QMC is a divide-and-conquer heuristic for the maximum quartet species tree problem that also weights quartets based on their relevance to a current subproblem in a way that does not perturb expected frequencies under MSC; this has benefits for larger numbers of taxa. To learn about the TREE-QMC method, see [Han & Molloy (2023)](https://doi.org/10.1101/gr.277629.122).
* Noe that [ASTRAL](https://github.com/chaoszhang/ASTER/) gave the same result as TREE-QMC in our analyses.


Group 2
---
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) with **support only weighting** on all four sets of gene trees: CNEEs, introns, UCEs, and UCEs (minus 105 loci with homology errors). 

* The support only weighting scheme was introduced by [Zhang & Mirarab (2022)](https://doi.org/10.1093/molbev/msac215) to improve robustness of ASTRAL to GTEE; this approach is consistent under the "MSC+Random Noise+Support model". It has since been implemented in TREE-QMC and a related approach is implemented in ASTRID; see [Liu & Warnow, 2023](https://doi.org/10.1186/s13015-023-00230-6).
* TREE-QMC is a divide-and-conquer heuristic for the maximum quartet species tree problem that also weights quartets based on their relevance to a current subproblem in a way that does not perturb expected frequencies under MSC; this has benefits for larger numbers of taxa. To learn about the TREE-QMC method, see [Han & Molloy (2023)](https://doi.org/10.1101/gr.277629.122).
* Note that support only weighting does not automatically build with ASTRAL/ASTER anymore so we did not run it.


Group 3
---
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) with **length only weighting** on all four sets of gene trees: CNEEs, introns, UCEs, and UCEs (minus 105 loci with homology errors). 

* The length only weighting scheme was introduced by [Zhang & Mirarab (2022)](https://doi.org/10.1093/molbev/msac215) to improve robustness of ASTRAL to GTEE;  this approach is consistent under the MSC. It has since been implemented in TREE-QMC and a related approach is implemented in ASTRID; see [Liu & Warnow, 2023](https://doi.org/10.1186/s13015-023-00230-6).
*  TREE-QMC is a divide-and-conquer heuristic for the maximum quartet species tree problem that also weights quartets based on their relevance to a current subproblem in a way that does not perturb expected frequencies under MSC; this has benefits for larger numbers of taxa. To learn about the TREE-QMC method, see [Han & Molloy (2023)](https://doi.org/10.1101/gr.277629.122).
* Note that length only weighting does not automatically build with ASTRAL/ASTER anymore so we did not run it.


Group 4
---
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) with **hybrid weighting** on all four sets of gene trees: CNEEs, introns, UCEs, and UCEs (minus 105 loci with homology errors). 

* The hybrid weighting scheme was introduced by [Zhang & Mirarab (2022)](https://doi.org/10.1093/molbev/msac215) to improve robustness of ASTRAL to GTEE; it has since been implemented in TREE-QMC.
*  TREE-QMC is a divide-and-conquer heuristic for the maximum quartet species tree problem that also weights quartets based on their relevance to a current subproblem in a way that does not perturb expected frequencies under MSC; this has benefits for larger numbers of taxa. To learn about the TREE-QMC method, see [Han & Molloy (2023)](https://doi.org/10.1101/gr.277629.122).
* Note that [ASTRAL-hybrid](https://github.com/chaoszhang/ASTER/) gave the same result as TREE-QMC-hybrid in our analyses.

Group 5
---
Run the coalescent site-based method **SVDQuartets** on the concatenated UCE alignment (minus 105 loci with homology errors).

* SVDquartets is implemented in [PAUP*](https://paup.phylosolutions.com).
* Check out this [tutorial](https://www.asc.ohio-state.edu/kubatko.2//phylogenomics2019/SpeciesTreeTutorial.html).
* SVDquartets estimated a species tree from the conatenated alignment on subsets of four taxa using the singular value decomposition (SVD); these quartets are then assembled into a species tree. This approach is consistent under the MSC, with some assumptions on molecular evolution models (etc).
* To learn about the SVDquartets method, see[Chifman & Kubatko (2014)](https://doi.org/10.1093/bioinformatics/btu530), [Chifman & Kubatko (2015)](https://doi.org/10.1016/j.jtbi.2015.03.006), and [Wascher & Kubatko, 2021](https://doi.org/10.1093/sysbio/syaa039).


Group 6
---
Run the coalescent site-based methods **CASTER-site** and **CASTER-pair** on the concatenated UCE alignment (minus 105 loci with homology errors).

* CASTER is implemented as part of [ASTRAL/ASTER](https://github.com/chaoszhang/ASTER/).
* To learn more about the CASTER, check out this very recent preprint: [Zhang *et al.* (2023)](https://doi.org/10.1101/2023.10.04.560884).


Group 7
---
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) to reconstruct a species tree from the CR1 presence / absence patterns

* To learn more about this approach, see [Springer *et al.* (2020)](https://doi.org/10.1093/jhered/esz076) and [Molloy *et al.* (2021)](https://doi.org/10.1093/sysbio/syab086).


Alternative activities if you have free time and don't want to try out other methods
---
Try evaluating the quality of **two** different species tree topologies found in the table, looking quartet frequencies around branches of interest (with TREE-QMC or ASTRAL), branch support values (with ASTRAL or CASTER), pseudolikelihood scores (with PhyloNetworks), and/or goodness of fit (with PhyloNetworks). Be sure to use the same input data when doing the comparison.


Dicussion Questions
---

1. What are the pros and cons of each type of method broadly speaking?
2. How do these pros/cons relate to the Palaeognathae tree and the data types explored in this lab?
3. What are some possible reasons for the differences across methods or data types?
4. This lab focused on gene tree heterogeneity due to ILS and GTEE. What are some other sources of gene tree heterogeneity? Could these be an issue for Palaeognathae? How would explore these issues further?
5. What follow-up analyses would you want to do if you had unlimited time, money, etc?
