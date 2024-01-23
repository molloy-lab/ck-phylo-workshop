Group 5
===

In this lab, we will estimate species trees on data sets from [Cloutier *et al.* (2019)](https://doi.org/10.1093/sysbio/syz019) using coalescent quartet-based methods. We will then compare and contrast the relationship between clades A, B1, B2, and C across the different methods and data types.

<p align="center">
<img src="clades_low.jpg" alt="clades" width="100%" height="auto"/>
</p>


Table
---

| Data | Study / Group | Method Type | Method | Species Tree Topology | Probability under MSC model species tree from day 1 | 
| --- | --- | --- | --- | --- | --- |
| UCE -105 | group 5 | Site (ACGT) | SVDquartets |  |  |

Data
---

| Data | Directory |
| --- | --- |
| Concatenated alignment (UCEs minus 105)| [`../data/concatenation/UCE_minus_105.phy.gz`](../data/concatenation/UCE_minus_105.phy.gz) |


Analysis
---
Run the coalescent site-based method **SVDQuartets** on the concatenated UCE alignment (minus 105 loci with homology errors).

Notes:
* SVDquartets estimates a species tree from the conatenated alignment on subsets of four taxa using the singular value decomposition (SVD); these quartets are then assembled into a species tree. This approach is consistent under the MSC+GTR model [[Wascher & Kubatko, 2021]](https://doi.org/10.1093/sysbio/syaa039) and conveniently bypasses gene tree estimation -- and thus problems with gene tree estimation error. However, there can still be errors (from ortholog identification and alignment) as well as model violations (e.g., selection or heterotachy).
* To learn about the SVDquartets method, see [Chifman & Kubatko (2014)](https://doi.org/10.1093/bioinformatics/btu530) and [Chifman & Kubatko (2015)](https://doi.org/10.1016/j.jtbi.2015.03.006).
* SVDquartets is implemented in [PAUP*](https://paup.phylosolutions.com).
* Check out this [tutorial](https://www.asc.ohio-state.edu/kubatko.2//phylogenomics2019/SpeciesTreeTutorial.html).
