Activit C Solution
---

Output of TREE-QMC:
```
(galGal,(((((cryCin,tinGut)'[f1=9273.500000;f2=364.000000;f3=362.500000;q1=0.927350;q2=0.036400;q3=0.036250;EN=10000.000000]':2.216637,(notPer,eudEle)'[f1=6186.000000;f2=1876.000000;f3=1938.000000;q1=0.618600;q2=0.187600;q3=0.193800;EN=10000.000000]':0.558441)'[f1=9878.000000;f2=52.000000;f3=70.000000;q1=0.987800;q2=0.005200;q3=0.007000;EN=10000.000000]':4.000854,anoDid)'[f1=9593.821429;f2=199.285714;f3=206.892857;q1=0.959382;q2=0.019929;q3=0.020689;EN=10000.000000]':2.798082,((((aptHaa,aptOwe)'[f1=9561.000000;f2=226.000000;f3=213.000000;q1=0.956100;q2=0.022600;q3=0.021300;EN=10000.000000]':2.720376,aptRow)'[f1=9987.777778;f2=7.833333;f3=4.388889;q1=0.998778;q2=0.000783;q3=0.000439;EN=10000.000000]':6.301619,(droNov,casCas)'[f1=9992.000000;f2=3.000000;f3=5.000000;q1=0.999200;q2=0.000300;q3=0.000500;EN=10000.000000]':6.725434)'[f1=6139.071429;f2=1927.738095;f3=1933.190476;q1=0.613907;q2=0.192774;q3=0.193319;EN=10000.000000]':0.546212,(rheAme,rhePen)'[f1=9983.714286;f2=8.085714;f3=8.200000;q1=0.998371;q2=0.000809;q3=0.000820;EN=10000.000000]':6.014587)'[f1=3389.190000;f2=3303.580000;f3=3307.230000;q1=0.338919;q2=0.330358;q3=0.330723;EN=10000.000000]':0.008414)'[f1=6499.514286;f2=1778.857143;f3=1721.628571;q1=0.649951;q2=0.177886;q3=0.172163;EN=10000.000000]':0.644218,strCam)'[f1=0.000000;f2=0.000000;f3=0.000000;q1=0.000000;q2=0.000000;q3=0.000000;EN=0.000000]':0);
```

**Question C1:** Yes, this tree agrees with the model species tree.

**Question C2:** Looking at the table, we found `0.338919;0.330358;0.330723;10000;0.008414` for the first two quartets: `rhePen,aptRow|galGal,cryCin`
and `rhePen,aptRow|strCam,cryCin`. 

For the third quartet `cryCin,tinGut|eudEle,anoDid`, we found `0.92735;0.0364;0.03625;10000;2.216637`. 

For the fourth quartet, `notPer,eudEle|tinGut,anoDid`, we found `0.6186;0.1876;0.1938;10000;0.558441`. 

The quartet support values and the estimated branch lengths are close to what was identified in Activity B.

We repeated this analysis for 200 gene trees with the following commands.

```
head -n100 simulated-gene-trees.tre > simulated-gene-trees_ngen100.tre
treeqmc --root galGal \
        --support \
        --writetable treeqmc_table_ngen100.txt \
        -i simulated-gene-trees_ngen100.tre \
        -o treeqmc_ngen100.tre
```

Output of TREE-QMC:
```
(galGal,(((((cryCin,tinGut)'[f1=95.500000;f2=3.500000;f3=1.000000;q1=0.955000;q2=0.035000;q3=0.010000;EN=100.000000]':2.695628,(notPer,eudEle)'[f1=59.500000;f2=15.000000;f3=25.500000;q1=0.595000;q2=0.150000;q3=0.255000;EN=100.000000]':0.498403)'[f1=97.000000;f2=1.500000;f3=1.500000;q1=0.970000;q2=0.015000;q3=0.015000;EN=100.000000]':3.101093,anoDid)'[f1=98.428571;f2=0.285714;f3=1.285714;q1=0.984286;q2=0.002857;q3=0.012857;EN=100.000000]':3.747720,((((aptHaa,aptOwe)'[f1=94.000000;f2=4.000000;f3=2.000000;q1=0.940000;q2=0.040000;q3=0.020000;EN=100.000000]':2.407946,aptRow)'[f1=100.000000;f2=0.000000;f3=0.000000;q1=1.000000;q2=0.000000;q3=0.000000;EN=100.000000]':9,(droNov,casCas)'[f1=100.000000;f2=0.000000;f3=0.000000;q1=1.000000;q2=0.000000;q3=0.000000;EN=100.000000]':9)'[f1=57.428571;f2=21.714286;f3=20.857143;q1=0.574286;q2=0.217143;q3=0.208571;EN=100.000000]':0.448522,(rheAme,rhePen)'[f1=100.000000;f2=0.000000;f3=0.000000;q1=1.000000;q2=0.000000;q3=0.000000;EN=100.000000]':9)'[f1=37.400000;f2=32.020000;f3=30.580000;q1=0.374000;q2=0.320200;q3=0.305800;EN=100.000000]':0.062940)'[f1=60.800000;f2=17.857143;f3=21.342857;q1=0.608000;q2=0.178571;q3=0.213429;EN=100.000000]':0.531028,strCam)'[f1=0.000000;f2=0.000000;f3=0.000000;q1=0.000000;q2=0.000000;q3=0.000000;EN=0.000000]':0);
```

**Question C1 (100 genes):** Yes, this tree agrees with the model species tree.

**Question C2 (100 genes):** Looking at the table, we found `0.374;0.3202;0.3058;100;0.062940` for the first two quartets: `rhePen,aptRow|galGal,cryCin`
and `rhePen,aptRow|strCam,cryCin`. 

For the third quartet `cryCin,tinGut|eudEle,anoDid`, we found `0.955;0.035;0.01;100;2.695628`. 

For the fourth quartet, `notPer,eudEle|tinGut,anoDid`, we found `0.595;0.15;0.255;100;0.498403`. 

The quartet support values and the estimated branch lengths are close to what was identified in Activity B. These values are farther away from the expected values than with 10K gene trees. The two alternative quartets are not as close together in probability. They still look pretty good though (benefits of simulated data).
