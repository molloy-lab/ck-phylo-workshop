Activity C: Run quartet-based summary methods
===

Now we are ready to work on reconstructing a species tree from gene trees simulated under the model species tree below.

<p align="center">
<img src="model-species-tree-v2-annotated_low.jpg" alt="model" width="100%" height="auto"/>
</p>

We will focus on heursitics for the Maximum Quartet Support Species Tree (MQSST) problem, which seeks a tree to maximize the number of quartets shared between it and the input gene trees.
The optimal solution to MQSST is a consistent estimator under the MSC [[Mirarab *et al.,* 2014]](https://doi.org/10.1093/bioinformatics/btu462), and many heursitics have been developed.. 

The most popular heuristic, ASTRAL, has had several versions since it was introduced in 2015 [(Mirarb *et al.*, 2014)](https://doi.org/10.1093/bioinformatics/btu462).
The lastest version, also called [ASTER](https://github.com/chaoszhang/ASTER/), uses a different algorithm that may be more robust to missing data.
Recently, we introduced a new heuristic to MQSST, called [TREE-QMC](https://github.com/molloy-lab/TREE-QMC).
TREE-QMC enables the divide-and-conquer algorithmic framework proposed by [Snir and Rao (2010)](https://doi.org/10.1109/tcbb.2008.133) to run directly on the input gene trees (rather than extracted quartets), enabling it scale to large data sets without subsampling quartets. 
TREE-QMC also weights quartets based on their relevance to a current subproblem and does so in such a way that the expected frequencies under MSC are not perturbed [Han & Molloy, 2023](https://doi.org/10.1101/gr.277629.122)
In our experiments, we have found these features make TREE-QMC at least as robust to missing data as ASTER (sometimes more robust) as well as more accurate for large trees. On the other hand, ASTER is faster when using multi-threading. Let's go ahead and try out these methods.

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

This newick string can be quickly visualized by going to [icytree](https://icytree.org), clicking the blue `File` button, selecting `Enter tree directly...`, and copying the newick string into the box.

**Question C1:** Does TREE-QMC recover the same topology as the model species tree?

However, we not only want to look at the topology but also estimated branch lengths and quartet support. 
Quartet support values for a given branch are computed by averaging across the different ways of selecting four taxa *around* the branch using the approach of [Sayyari and Mirarab (2016)](https://doi.org/10.1093%2Fmolbev%2Fmsw079). 
This paper also details ASTRAL's branch support metric, called local posterior probability or localpp.

**Question C2:** Do the quartet support values from TREE-QMC agree with your calculations from activity B? 

*Tip: If you are having trouble looking at quartet support in the newick string, check out `treeqmc_table.txt`.*

If desired, repeat this analysis with [ASTRAL](https://github.com/chaoszhang/ASTER/). To run ASTER, the command is
```
astral --root galGal \
       -u 2 \
       -i ../data/simulations/simulated-gene-trees.tre \
       -o astral.tre
```

**Optional:** Repeat the tasks above but reduce the number of gene trees from 10,000 down to 100. Compare the results.

---

(Optional) Go to **[Activity D](activityD.md)**.
