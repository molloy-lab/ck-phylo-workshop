Activity C: Run quartet-based summary methods
===

Now let's reconstruct a species tree from gene trees simulated under the model species tree below.

<p align="center">
<img src="model-species-tree-v2-annotated_low.jpg" alt="model" width="100%" height="auto"/>
</p>

This lab focuses on coalescent methods based on quartets, the earliest of which was perhaps Bucky-pop [[Ane *et al.*, 2006](https://doi.org/10.1093/molbev/msl170); [Larget *et al.*, 2010](https://doi.org/10.1093/bioinformatics/btq539)].
The popular method, ASTRAL, is a heursitics for the Maximum Quartet Support Species Tree (MQSST) problem, which seeks a tree to maximize the number of quartets shared between it and the input gene trees; see [[Mirarab *et al.,* 2014]](https://doi.org/10.1093/bioinformatics/btu462).

<p align="center">
<img src="quartets.jpg" alt="model" width="100%" height="auto"/>
</p>

There are several benefits to quartet-based gene tree summary methods: 
1. No anomalous quartets under the MSC so the the most probable quartet agrees with the species tree; this leads to nice statistical properties e.g. the optimal solution to MQSST is a consistent estimator under the MSC [[Mirarab *et al.,* 2014]](https://doi.org/10.1093/bioinformatics/btu462),
2. Input are unrooted gene trees so don't need to perform rooting of individual gene trees (convenient)
3. Many fast and accurate heursitics have been developed

ASTRAL has had several versions since it was introduced in 2014.
The lastest version, called ASTER, uses a different algorithmic approach that is more robust to missing data the previous one [Zhang & Mirarab, 2022](https://doi.org/10.1093/molbev/msac215).
Recently, we introduced a new heuristic to MQSST, called TREE-QMC [[Han & Molloy, 2023]](https://doi.org/10.1101/gr.277629.122).
TREE-QMC enables the divide-and-conquer algorithmic framework proposed by [Snir and Rao (2010)](https://doi.org/10.1109/tcbb.2008.133) to run directly on the input gene trees (rather than extracted quartets), enabling it scale to large data sets without subsampling quartets. 
Additionally, TREE-QMC weights quartets based on their relevance to a current subproblem and does so in such a way that the expected frequencies under MSC are not perturbed.
In our experiments, we have found these features make TREE-QMC at least as robust to missing data as ASTER (sometimes more robust) as well as more accurate for large trees.
On the other hand, ASTER is faster when using multi-threading.
For small data sets with accurate gene trees, like what we are analyzing today, all summary methods should perform very well for both speed and accuracy.

To run ASTRAL/[ASTER](https://github.com/chaoszhang/ASTER/), use the command:
```
astral --root galGal \
       -u 2 \
       -i ../data/simulations/simulated-gene-trees.tre \
       -o astral.tre
```

To see the resulting species tree, type:
```
cat astral.tre
```

To run [TREE-QMC](https://github.com/molloy-lab/TREE-QMC), use the command:
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

These newick strings encode the tree topology as well as branch information: the length of each branch (in coalescent units) and quartet support *around* the branch. 

The trees encoded by these newick strings can be quickly visualized by going to [icytree](https://icytree.org), clicking the blue `File` button, selecting `Enter tree directly...`, and copying the newick string into the box.

**Question C1:** Do ASTRAL and TREE-QMC recover the same topology as the model species tree?

**Optional:** Repeat the tasks above but reduce the number of gene trees from 10,000 down to 100. Compare the results.

*Tips:* Use the command 
```
head -n100 simulated_gene_trees.tre > simulated_gene_trees_first100.tre
```
to create a new file with the first 100 gene trees from the original file. Then repeat the above commands for ASTRAL and TREE-QMC, replacing the input/output file names.

For later e.g. on the flight home :)
---

The branch information in the newick strings of ASTRAL and TREE-QMC are useful of looking for conflict around a branch. 

Consider a species tree with the following newick string:
```
(((rhePen,(aptRow,droNov)'[q1=0.62;q2=0.19;q3=0.19]':0.553644)'[q1=0;q2=0;q3=0]':0.008906),notPer);
```
The branch connecting `(aptRow,droNov)` to the rest of the tree has length `0.553644` CUs and separates `aptRow,droNov` from `rhePen,notPer`.
There is only one way of sampling four taxa *around* this branch so the quartet support information corresponds to the support of the three possible quartets on `aptRow,droNov,rhePen,notPer`. 
This is just the normalized frequency of the three possible quartets in the input gene trees.

In this example newick string, we set the quartet support values to their  expected values under the MSC so the quartet in the species tree  (`aptRow,droNov|rhePen,notPer`) has support $q_1 = 1 - (2/3)e^{-0.553644} = 0.62$.
The two alternative quartets (`aptRow,rhePen|droNov,notPer` and `aptRow,notPer|droNov,rhePen`) have support $q_2 = q_3 = (1/3) e^{-0.553644} = 0.19$).
This means that 62% of gene trees display `aptRow,droNov|rhePen,notPer`, and the remainder display one of the two alternative topologies (split 50/50).

The branch above `(rhePen,(aptRow,droNov))` has length `0.008906` CUs and separates `aptRow,droNov,rhePen` from `notPer`. 
This no way to sample four taxa *around* this branch so the quartet support values are all zero.

If there is more than one way of sampling four taxa *around* a branch, the quartet support values are computed by essentially averaging across the different ways of selecting four taxa *around* the branch using the approach of [Sayyari and Mirarab (2016)](https://doi.org/10.1093%2Fmolbev%2Fmsw079); this paper also details ASTRAL's branch support metric, called local posterior probability.
To learn more, see the [ASTRAL documentation](https://github.com/smirarab/ASTRAL/blob/master/astral-tutorial.md#branch-length-and-support) or see [this detailed example of the quartet support calculation](quartet_support_example.md).

Now let's look at the quartet support in `astral.tre` and `treeqmc.tre`.

**Question C2:** Do the quartet support values from TREE-QMC agree with your calculations from activity B?

*Tip: If you are having trouble looking at quartet support in the newick string, try looking at the table `treeqmc_table.txt`.*

---

**Optional:** Go to **[Activity D](activityD.md)**.
