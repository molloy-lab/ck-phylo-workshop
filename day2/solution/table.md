| Data | Study | Method Type | Method | Species Tree Topology | Probability under MSC model species tree from day 1 | 
| --- | --- | --- | --- | --- | --- |
| CNEE | group 1 | Gene Tree Summary | TREE-QMC | `((((A,(B1,B2)),C),strCam),galGal);` | 0.0137 |
| CNEE | group 2 | Gene Tree Summary | TREE-QMC-support | `((((A,(B1,B2)),C),strCam),galGal);` | 0.0137 |
| CNEE | group 3 | Gene Tree Summary | TREE-QMC-length | `((((A,(B1,B2)),C),strCam),galGal);` | 0.0137 |
| CNEE | group 4 | Gene Tree Summary | TREE-QMC-hybrid |  `((((A,(B1,B2)),C),strCam),galGal);` | 0.0137 |
| CNEE | Cloutier *et al.* (2019) | Concatenation | ExaML | `(((((B1,C),B2),A),strCam),galGal);` | 0.0019 |
| intron | group 1 | Gene Tree Summary | TREE-QMC | `((((A,(B1,B2)),C),strCam),galGal);` | 0.0137 |
| intron | group 2 | Gene Tree Summary | TREE-QMC-support | `((((A,(B1,B2)),C),strCam),galGal);` | 0.0137 |
| intron | group 3 | Gene Tree Summary | TREE-QMC-length | `(((((B1,B2),C),A),strCam),galGal);` | 0.0132 |
| intron | group 4 | Gene Tree Summary | TREE-QMC-hybrid | `(((((B1,B2),C),A),strCam),galGal);` | 0.0132 |
| intron | Cloutier *et al.* (2019) | Concatenation | ExaML | `(((((B1,B2),C),A),strCam),galGal);` | 0.0132 |
| UCE (plus 105) | group 1 | Gene Tree Summary | TREE-QMC  | `((((A,(B1,B2)),C),strCam),galGal);` | 0.0137 |
| UCE (plus 105) | group 2 | Gene Tree Summary | TREE-QMC-support  | `((((A,(B1,B2)),C),strCam),galGal);` | 0.0137 |
| UCE (plus 105) | group 3 | Gene Tree Summary | TREE-QMC-length  | `(((((B1,B2),C),A),strCam),galGal);` | 0.0132 |
| UCE (plus 105) | group 4 |  Gene Tree Summary | TREE-QMC-hybrid | `(((((B1,B2),C),A),strCam),galGal);` | 0.0132 |
| UCE (plus 105) | Cloutier *et al.* (2019) | Concatenation | ExaML |  `(((((B1,C),B2),A),strCam),galGal);` | 0.0019 |
| UCE (minus 105) | group 1 | Gene Tree Summary | TREE-QMC | `(((((B1,B2),C),A),strCam),galGal);` | 0.0132 |
| UCE (minus 105) | group 2 | Gene Tree Summary | TREE-QMC-support | `(((((B1,B2),C),A),strCam),galGal);` | 0.0132 |
| UCE (minus 105) | group 3 | Gene Tree Summary | TREE-QMC-length | `(((((B1,B2),C),A),strCam),galGal);` | 0.0132 |
| UCE (minus 105) | group 4 | Gene Tree Summary | TREE-QMC-hybrid | `(((((B1,B2),C),A),strCam),galGal);` | 0.0132 |
| UCE (minus 105) | Simmons *et al.* (2022) | Concatenation | Partitioned RAxML | `(((((B1,C),B2),A),strCam),galGal);` | 0.0019 | 
| UCE (minus 105) | group 5 | Site (ACGT) | SVDquartets | `((((A,(B1,B2)),C),strCam),galGal);` | 0.0137 |
| UCE (minus 105) | group 6 | Site (ACGT) | CASTER-site | `((((A,(B1,B2)),C),strCam),galGal);` | 0.0137 |
| UCE (minus 105) | group 6 | Site (ACGT) | CASTER-pair | `(((((B2,C),A),B1),strCam),galGal);` | 0.0019 |
| CR1 | group 7 | Site (01) | TREE-QMC-bp | `((((A,(B1,B2)),C),strCam),galGal);` | 0.0137 |

**Notes:**

* TREE-QMC and ASTRAL return same tree for all gene tree data sets; TREE-QMC-hybrid and ASTRAL-hybrid return same tree for all gene tree data sets.
* TREE-QMC-hybrid and TREE-QMC-length get different trees on UCE (plus 105) than TREE-QMC and TREE-QMC-support. Suggests that weighting based on length improves robustness to long branches from homology errors. Same result occurs for introns though (some introns are quite long so many there are long branches; could investigate further). 
* TREE-QMC and TREE-QMC-support (and all weightings) get same trees on CNEEs and introns/UCEs. For introns and UCEs, support was generally very high. For CNEEs support was generally very low. If support is relative uniform across branches, then this weighting scheme would not be expected to do much.
* Concatenation generally favors other topologies than coalescent methods - however, these topologies do not have higher probability than the topology that agrees with the species tree (based on the model from day 1 with topology `((((A,(B1,B2)),C),strCam),galGal);`)
* Concatenation and TREE-QMC-hybrid on UCEs (minus 105) still don't agree



