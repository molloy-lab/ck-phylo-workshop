This directory contains species trees estimated by [Cloutier *et al.* (2019)](https://doi.org/10.1093/sysbio/syz019) and [Simmons *et al.* (2022)](https://doi.org/10.1016/j.ympev.2021.107344).


| Study | Data | Method | File |
| --- | --- | --- | --- |
| Cloutier *et al.* (2019 | NA | species codes | [`species_codes.txt`](species_codes.txt) |
| Cloutier *et al.* (2019) | CNEE | ASTRAL | [`cloutier2019_CNEE_astral.tre`](cloutier2019_CNEE_astral.tre) |
| Cloutier *et al.* (2019) | CNEE | ExaML | [`cloutier2019_CNEE_examl.tre`](cloutier2019_CNEE_examl.tre) |
| Cloutier *et al.* (2019) | intron | ASTRAL | [`cloutier2019_intron_astral.tre`](cloutier2019_intron_astral.tre) |
| Cloutier *et al.* (2019) | intron | ExaML | [`cloutier2019_intron_examl.tre`](cloutier2019_intron_examl.tre) |
| Cloutier *et al.* (2019) | UCE (plus 105) | ASTRAL | [`cloutier2019_UCE_astral.tre`](cloutier2019_UCE_astral.tre) |
| Cloutier *et al.* (2019) | UCE (plus 105) | ExaML | [`cloutier2019_UCE_examl.tre`](cloutier2019_UCE_examl.tre) |
| Simmons *et al.* (2022) | UCE (minus 105) | RAxML | [`simmons2022_UCE_minus_105_raxml.tre`](simmons2022_UCE_minus_105_raxml.tre) |

---

These files come from the following steps.

1. Downloaded `species_trees.tar.gz` and `species_codes.txt` from [Dryad](https://doi.org/10.5061/dryad.fj02s0j) in January 2024.

2. Copied species trees from `species_trees/ExaML` and shortened the file names (and added the prefix `cloutier2019_`).

3. Copied species trees from `species_trees/ASTRAL` and shortened the file names (and added the prefix `cloutier2019_`).

4. Copied the species codes.

5. Downloaded data from [FigShare](https://figshare.com/articles/dataset/Supplemental_data_for_Gene-tree_misrooting_drives_conflicts_in_phylogenomic_coalescent_analyses_of_palaeognath_birds_/8866274) in January 2024.

6. Copied `Simmons\ et\ al\ trees\ and\ matrices/concatenation/likelihood/plus_Gallus/RAxML_bipartitions.UCE_mafft_BS.tre` and renamed to `simmons2022_UCE_minus_105_raxml.tre`.
