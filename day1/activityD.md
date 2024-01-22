Activity D (Optional): Evaluate pseudolikelihood and check goodness of fit
===

Lastly, let's evaluate the quality of the estimated species tree by computing its pseudolikelihood score with [PhyloNetworks](https://crsl4.github.io/PhyloNetworks.jl/latest/). 
The pseudolikelihood function computes the expected quartet concordance factors (CFs) from the model species tree as well as the observed quartet CFs from the input gene trees; thus, the intermediate calculations also can be used to visualize goodness of fit.

0. Remove the branch support information from the TREE-QMC tree e.g. use the command:
```
cat treeqmc.tre | sed "s/\'/\n/g" | sed '/^\[/d' | tr -d "\n" > treeqmc_noqs.tre
```

1. Start julia by typing `julia` and then load packages.
```
using PhyloNetworks;
using CSV;
using RCall;
@rlibrary ggplot2
```

2. Specify the input species tree and gene trees.
```
st_file = "treeqmc_noqs.tre"
gt_file = "simulated-gene-trees.tre"
```

3. Specify the output files.
```
qf_file = "treeqmc_qCF.csv"
qf_plot = "treeqmc_qCF.png"
```

3. Compute the observed quartet CFs (i.e., the number of times each quartet appears in the input gene trees and divide by the total number of gene trees). Store the results for all quartets to `tb_file`.
```
gtrees = readMultiTopology(gt_file);
q,t = countquartetsintrees(gtrees);
df = writeTableCF(q,t);
CSV.write(qf_file, df);
```

**Question D1:** How do the observed CFs from step 3 compare to the expected values under the MSC computed in Questions B1-B4. 

*Tip: Use `grep` to access these relevant CFs in the CSV file. For Question B1, this can be done with the following command.*

```
head -n1 treeqmc_qCF.csv
grep "galGal" treeqmc_qCF.csv | grep "cryCin" | grep "rhePen" | grep "aptRow"
```
*Another Tip: Grep the file in a separate terminal. Otherwise, type `exit();`, grep the file, and then re-start Julia. Now you can continue with step 4 below, after loading packages and file names.*

4. Load the observed qCFs and estimated species tree topology.
```
gtCF = readTableCF(qf_file);
stree = readTopology(st_file)
```

5. Calculate pseudolikelihood, which in turn calculates the expected quartet CFs under the MSC (i.e., the probability of the quartet given the MSC model species tree).
```
loglik = topologyQPseudolik!(stree, gtCF);
loglik
```

**Question D2:** What is the pseudolikelihood score of the model?

6. Create a data frame to compare expected vs observed qCFs.
```
df_long = fittedQuartetCF(gtCF, :long);
```

7. Plot the observed vs expected quartet CFs and save.
```
ggplot(df_long, aes(x=:obsCF, y=:expCF)) +
       theme_classic() + 
       geom_segment(x=0,y=0,xend=1,yend=1, color="#008080", linewidth=0.3) + 
       geom_point(alpha=0.5, color="#008080", position=position_jitter(width=0.005, height=0.005)) + 
       ylab("quartet freq expected from model species tree") + 
       xlab("quartet freq observed in gene trees") + 
       coord_equal(ratio=1);
ggsave(qf_plot, scale=1, width=6, height=5);
```

7. Exit julia.
```
exit();
```

**Question D3:** Does the estimated species tree (topology and branch lengths) seem like a good fit for the input gene trees when looking at the png file?

*Tip: If you only have a species tree topology (no branch lengths), you can fit branch lengths to the tree by replacing step 5 with the command:*
```
stfitted = topologyMaxQPseudolik!(stree, gtCF)
stfitted.loglik
```
*and then continue with the analysis.*

**Optional:** Repeat the tasks above taking the TREE-QMC tree estimated on 100 gene trees. Compare the results to those for 10,000 gene trees.

---

Go back to the [landing page for day 1](README.md).

---

Credits
---
* [PhyloNetworks Manual](https://crsl4.github.io/PhyloNetworks.jl/latest/man/expectedCFs/)
