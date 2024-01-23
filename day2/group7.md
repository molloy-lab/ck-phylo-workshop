Group 7
===

In this lab, we will estimate species trees on data sets from [Cloutier *et al.* (2019)](https://doi.org/10.1093/sysbio/syz019) using coalescent quartet-based methods. We will then compare and contrast the relationship between clades A, B1, B2, and C across the different methods and data types.

<p align="center">
<img src="clades_low.jpg" alt="clades" width="100%" height="auto"/>
</p>


To fill in the table below, let's divide-and-conquer into ~7 groups. If your group finishes your portion of the table, try out some of the other analyses, prioritizing what you are interested in, or go back and work on the day 1 lab, or relax. :)

| Data | Study / Group | Method Type | Method | Species Tree Topology | Probability under MSC model species tree from day 1 | 
| --- | --- | --- | --- | --- | --- |
| CR1 | group 7 | Site (01) | TREE-QMC-bp |  |  |


Data
---

| Data | Directory |
| --- | --- |
| CR1 presence/absence matrix | [`../data/CR1/4345ratites.nex.gz`](../data/CR1/4345ratites.nex.gz) |


Analysis
---
Run [**TREE-QMC**](https://github.com/molloy-lab/TREE-QMC) to reconstruct a species tree from the CR1 presence / absence patterns via quartets

Notes:
* To learn more about this approach, see [Springer *et al.* (2020)](https://doi.org/10.1093/jhered/esz076) and [Molloy *et al.* (2021)](https://doi.org/10.1093/sysbio/syab086).
* The main benefit is that the presence/absence of low-homoplasy insertions across genomes may be more robust to error than estimated gene trees. Moreover, such insertions may be less likely to be observed in regions of the genome under selection, thus fitting the neutrality assumption of the MSC. However, they can still undergo ILS; thus the utility of quartets.
* On the other hand, each CR1 presence/absence character is like a tree with just one branch, separating species with the insertion (derived state) from those without it (ancestral state). Thus, a single character may not contain *any* quartets that inform how to resolve a particular branch in the species tree.
* Thus, when interpreting the results, it's important to confirm the effective number (`EN`) of markers with information to resolve each branch in the estimated species tree is sufficiently high.
