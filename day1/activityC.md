Activity C: Run quartet-based summary methods
===

Now we will work on reconstructing a species tree from gene trees simulated under the model species tree below.

<p align="center">
<img src="model-species-tree-v2-annotated_low.png" alt="model" width="100%" height="auto"/>
</p>

The most popular quartet-based summary method is ASTRAL, which has had several versions since it was introduced in 2015 [(Mirarb *et al.*, 2014)](https://doi.org/10.1093/bioinformatics/btu462).
The lastest version, [ASTER](https://github.com/chaoszhang/ASTER/), uses a different algorithm that may be more robust to missing data.
Recently, we introduced another quartet-based method, called [TREE-QMC](https://github.com/molloy-lab/TREE-QMC).
TREE-QMC enables the algorithmic framework proposed by [Snir and Rao (2010)](https://doi.org/10.1109/tcbb.2008.133) to run directly on the input gene trees, thus bypassing the extraction of quartets. 
TREE-QMC is more robust to missing data, like ASTER, and our results suggest the algorithmic framework implemented by TREE-QMC can improve accuracy for large trees.
These features aren't important for these simulated data, but in any case, let's try it out.

To run TREE-QMC, use the command:
```
treeqmc --root galGal \
        --support \
        --writetable treeqmc_table.txt \
        -i simulated-gene-trees.tre \
        -o treeqmc.tre
```

To see the resulting species tree, type:
```
cat treeqmc.tre
```

This newick string can be quickly visualized by going to [icytree](https://icytree.org), clicking the blue `File` button, selecting `Enter tree directly...`, and copying the newick string into the box (note that we found the TREE-QMC tree to be the same as the model species tree above).

**Question C1:** Does TREE-QMC recover the same topology as the model species tree?

**Question C2:** Do the quartet support values from TREE-QMC agree with your calculations from activity B? 

*Tip: If you are having trouble looking at quartet support in the newick string, check out `treeqmc_table.txt`.*

Quartet support values for a given branch are computed by averaging across the different ways of selecting four taxa *around* the branch using the approach of [Sayyari and Mirarab (2016)](https://doi.org/10.1093%2Fmolbev%2Fmsw079). This paper also details ASTRAL's branch support metric, called local posterior probability or localpp.

It is easy to repeat this analysis with [ASTRAL](https://github.com/chaoszhang/ASTER/), which you may have used before. 
If not, the command is
```
astral --root galGal \
       -u 2 \
       -i ../data/simulations/simulated-gene-trees.tre \
       -o astral.tre
```

**Optional:** Repeat the tasks above varying the number of gene trees (e.g., 50 and 100) and compare these results to those for 10K gene trees.

---

(Optional) Go to **[Activity D](activityD.md)**.
