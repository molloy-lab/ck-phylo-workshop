Group 6 Activity
===

In this lab, we will estimate species trees on data sets from [Cloutier *et al.* (2019)](https://doi.org/10.1093/sysbio/syz019) using coalescent quartet-based methods. We will then compare and contrast the relationship between clades A, B1, B2, and C across the different methods and data types.

<p align="center">
<img src="clades_low.jpg" alt="clades" width="100%" height="auto"/>
</p>


To fill in the table below, let's divide-and-conquer into ~7 groups. If your group finishes your portion of the table, try out some of the other analyses, prioritizing what you are interested in, or go back and work on the day 1 lab, or relax. :)

| Data | Study / Group | Method Type | Method | Species Tree Topology | Probability under MSC model species tree from day 1 | 
| --- | --- | --- | --- | --- | --- |
| UCE -105 | group 6 | Site (ACGT) | CASTER-site |  |  |
| UCE -105 | group 6 | Site (ACGT) | CASTER-pair |  |  |



Data
---

| Data | Directory |
| --- | --- |
| Concatenated alignment (UCEs minus 105)| [`../data/concatenation/UCE_minus_105.phy.gz`](../data/concatenation/UCE_minus_105.phy.gz) |



Analysis
---
Run the coalescent site-based methods **CASTER-site** and **CASTER-pair** on the concatenated UCE alignment (minus 105 loci with homology errors).

Notes:
* CASTER is implemented as part of [ASTRAL/ASTER](https://github.com/chaoszhang/ASTER/).
* To learn more about the CASTER, check out this very recent and exciting preprint: [Zhang *et al.* (2023)](https://doi.org/10.1101/2023.10.04.560884).
