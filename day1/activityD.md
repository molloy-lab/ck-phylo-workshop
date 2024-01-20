Activity D (Optional): Evaluate pseudolikelihood and check goodness of fit
===

Lastly, let's evaluate the estimated tree by computing pseudolikelihood with [PhyloNetworks](https://crsl4.github.io/PhyloNetworks.jl/latest/). The pseudolikelihoodfunction computes the expected quartet concordance factors (qCFs) under the model species tree as well as the observed qCFs in the input gene trees. Thus, we can also check goodness of fit.

0. Remove the quartet support from the TREE-QMC tree e.g.
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

3. Compute the qCFs from the input gene trees and store to `tb_file`.
```
gtrees = readMultiTopology(gt_file);
q,t = countquartetsintrees(gtrees);
df = writeTableCF(q,t);
CSV.write(qf_file, df);
```

**Question D1:** How do the observed quartet CFs compare to the expected values from Questions B1-B4. To access these frequencies in the file, try `grep`.
```
head -n1 treeqmc_qCF.csv
grep "galGal" treeqmc_qCF.csv | grep "cryCin" | grep "rhePen" | grep "aptRow"
```

*Tip: Run this command in separate terminal or type `exit();`. You can then grep the file. Afterward re-start Julia, and pick back up from step 4 (after loading packages and file names).*

4. Load the estimated species tree topology.
```
gtCF = readTableCF(qf_file);
stree = readTopology(st_file)
```

5. Calculate pseudolikelihood, which will in turn calculate expected qCFs.
```
loglik = topologyQPseudolik!(stree, gtCF);
loglik
```

**Question D2:** What is the pseudolikelihood score?

6. Create a data frame to compare expected vs observed qCFs.
```
df_long = fittedQuartetCF(gtCF, :long);
```

7. Plot the observed vs expected qCFs.
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

**Question D3:** Does the estimated species tree fit seem like a good fit for the data (looking at the png file)?

*Tip: If you only have a species tree topology (no branch lengths), you can fit branch lengths to it by replacing step 5 with the command:*
```
stfitted = topologyMaxQPseudolik!(stree, gtCF)
stfitted.loglik
```
*and then continue with the analysis.*

**Optional:** Repeat the tasks above varying the number of gene trees (e.g., 50 and 100) and compare these results to those for 10K gene trees.

Credits
---
* [PhyloNetworks Manual](https://crsl4.github.io/PhyloNetworks.jl/latest/man/expectedCFs/)

---

Go back to the [landing page for day 1](README.md).


