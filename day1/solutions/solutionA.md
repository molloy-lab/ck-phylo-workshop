Activity A Solution
---

**Question A1:** Open ended

Example of `phylonet.nex` file:
```
#NEXUS

BEGIN TREES;
tree gt1 = (((((rhePen,rheAme),((droNov,casCas),(aptRow,(aptOwe,aptHaa)))),(((notPer,eudEle),(tinGut,cryCin)),anoDid)),strCam),galGal);
tree gt2 = (((((rhePen,rheAme),(((notPer,eudEle),(tinGut,cryCin)),anoDid)),((droNov,casCas),(aptRow,(aptOwe,aptHaa)))),strCam),galGal);
tree gt3 = ((((((droNov,casCas),(aptRow,(aptOwe,aptHaa))),(((notPer,eudEle),(tinGut,cryCin)),anoDid)),(rhePen,rheAme)),strCam),galGal);
END;

BEGIN NETWORKS;
Network st = ((((anoDid,((cryCin,tinGut):2.222865,(eudEle,notPer):0.569523):3.974074):2.892946,((((aptHaa,aptOwe):2.763538,aptRow):6.334034,(casCas,droNov):6.316124):0.553644,(rheAme,rhePen):6.124807):0.008906):0.640913,strCam):0.086324,galGal);
END;

BEGIN PHYLONET;
CalGTProb st (gt1);  
CalGTProb st (gt2);
CalGTProb st (gt3);
END;
```

Output of running PhyloNet:
```
CalGTProb st (gt1)
Species Network:
(galGal,(strCam,(((rhePen,rheAme):6.124807,((droNov,casCas):6.316124,(aptRow,(aptOwe,aptHaa):2.763538):6.334034):0.553644):0.008906,(((notPer,eudEle):0.569523,(tinGut,cryCin):2.222865):3.974074,anoDid):2.892946):0.640913):0.086324);
Total log probability: -4.289736469652132


CalGTProb st (gt2)
Species Network:
(galGal,(strCam,(((rhePen,rheAme):6.124807,((droNov,casCas):6.316124,(aptRow,(aptOwe,aptHaa):2.763538):6.334034):0.553644):0.008906,(((notPer,eudEle):0.569523,(tinGut,cryCin):2.222865):3.974074,anoDid):2.892946):0.640913):0.086324);
Total log probability: -4.194131371958972


CalGTProb st (gt3)
Species Network:
(galGal,(strCam,(((rhePen,rheAme):6.124807,((droNov,casCas):6.316124,(aptRow,(aptOwe,aptHaa):2.763538):6.334034):0.553644):0.008906,(((notPer,eudEle):0.569523,(tinGut,cryCin):2.222865):3.974074,anoDid):2.892946):0.640913):0.086324);
Total log probability: -4.328859170143791
```

**Question A2:** The probabilities of `gt1`, `gt2`, and `gt3` are 0.0137, 0.0151, and 0.0132, respectively. `gt2` has higher probability than `gt1` so the species tree is in the anomaly zone.

