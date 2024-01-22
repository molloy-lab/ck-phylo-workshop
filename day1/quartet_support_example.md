Consider the *unrooted* species tree topology

`st = (((a,(b,c))v,(((d,e),f),g)),(((h,i),k),j));`

and unrooted gene trees

```
gt1 = ((b,c),(d,e));
gt2 = (((a,b,d,h),j),k);
gt3 = (((a,b,d),e),i);
gt4 = (((((a,b),f),i),j),k);
gt5 = (((a,b),(c,e)),h);
gt6 = ((a,g),(b,k));
```

Our goal is to compute the quartet support for branch `v` in the species tree given the gene trees.

First, observe that branch `v` induces quadrapartition

```
W, X | Y, Z
```

where

```
W = a
X = (b,c)
Y = (((d,e),f),g)
Z = (((h,i),k),j)
```

becaus if deleting the branch and its endpoints from the tree gives those four subtrees. Now we can determine the quartets *around* `v` by taking one leaf from subtree `W`, one from `X`, one from `Y`, and one from `Z`.
All of these quartets *around* v correspond to quartet topology `W,X|Y,Z` in the species tree but they could correspond to any of the four topologies below in the gene trees.

```
Q0 = W,Y,X,Z (polytomy i.e. no quartet)
Q1 = W,X | Y,Z
Q2 = W,Z | X,Y
Q3 = W,Y | X,Z
```

Because there are 32 quartets possible in each of the gene trees, so each gene tree can split its vote for `Q1`, `Q2`, and `Q3`.

Let's count the votes for each gene tree.

**Gene tree 1:** `gt1 = ((b,c),(d,e));` displays 0 quartets around *v* because it is missing species from subtrees `W` and `Z`.

**Gene tree 2:**  `gt2 = (((a,b,d,h),j),k);` displays 3 quartets around *v*

* `(a,b,d,h)` - 1/3 vote goes to `Q0`
* `((a,b,d),j)` - 1/3 vote goes to `Q0`
* `((a,b,d),k)` - 1/3 vote goes to `Q0`

**Gene tree 3:** `gt3 = (((a,b,d),e),i);` displays 2 quartets around *v*

* `(((a,b),e),i);` - 1/2 vote goes to `Q1` 
* `((a,b,d),i);` - 1/2 vote goes to `Q0` 

**Gene tree 4:** `gt3 = (((((a,b),f),i),j),k);` displays 3 quartets around *v*


* `((((a,b),f),i)`  - 1/3 vote goes to `Q1`
* `(((a,b),f),j)`  - 1/3 vote goes to `Q1`
* `(((a,b),f),k)` - 1/3 vote goes to `Q1`

**Gene tree 5:** `gt5 = (((a,b),(c,e)),h);` displays 2 quartets around *v*

* `(((a,b),e),h);` - 1/2 vote goes to `Q1`
* `(((a,b),c),h);` - 1/2 vote goes to `Q2`

**Gene tree 5:** `gt6 = ((a,g),(b,k));` displays 1 quartet around *v*

* `((a,g),(b,k))` goes to `Q3`

The total number of votes cast is 3.5, so the effective number (`EN`) of gene trees that give information about branch *v* is 3.5 (even though the total number of gene trees is 6 -- this is because of polytomies and missing data)!

Now, let's total the votes for each `Q1`, `Q2`, and `Q3` across the gene trees.

* `f1` = 1/2 + 1 + 1/2 = 2
* `f2` = 1/2
* `f3` = 1

To get the quartet support, divide these numbers by `EN`

* `q1` = 2 / 3.5 = 0.5714285714285714
* `q2` = 0.5 / 3.5 = 0.14285714285714285
* `q3` = 1 / 3.5 = 0.2857142857142857

Since `q1` is the largest more gene trees support the branch in the species tree than the other 2 quartet resolutions.

If you'd like, check these results by running [ASTRAL](https://github.com/chaoszhang/ASTER/) (with `-u2` flag) and [TREE-QMC](https://github.com/molloy-lab/TREE-QMC) (with `--support` flag).

The take-away is that if the input gene trees have high missingness or are highly unresolved, then it's a good idea to look at the effective number of gene trees `EN` with information to resolve branches of interest in the species tree.
