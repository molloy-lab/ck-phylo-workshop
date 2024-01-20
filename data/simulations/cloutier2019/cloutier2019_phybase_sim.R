#!/usr/bin/env Rscript

library(phybase)
tree<-"((((anoDid:0.018099#1.0,((cryCin:0.009888#1.0,tinGut:0.009888#1.0):0.003233#0.004738,(eudEle:0.012387#1.0,notPer:0.012387#1.0):0.000733#0.004434):0.004979#0.003663):0.002137#0.003513,((((aptHaa:0.000606#1.0,aptOwe:0.000606#1.0):0.001444#0.002163,aptRow:0.002050#1.0):0.013917#0.005588,(casCas:0.005770#1.0,droNov:0.005770#1.0):0.010196#0.007245):0.001831#0.031953,(rheAme:0.001895#1.0,rhePen:0.001895#1.0):0.015902#0.004326):0.002439#0.053833):0.001074#0.005272,strCam:0.021311#1.0):0.012351#1.0,galGal:0.033661#1.0)#1.0;"
spname<-species.name(tree)
nodematrix<-read.tree.nodes(tree, spname)$nodes
rootnode<-27
seq<-rep(1,14)
#generate 10000 gene trees
ngenetrees<-10000
#construct a vector to store the 10000 simulated gene trees.
genetrees<-rep(" ", ngenetrees)
#use a loop to simulate 10000 gene trees
for(i in 1:ngenetrees) {
      genetrees[i]<-sim.coaltree.sp(rootnode,nodematrix,14,seq,name=spname)$gt
      filename <- paste("gtree", i, ".tre", sep="")
      write.tree.string(X=genetrees[i], format="phylip", file=filename)
}
quit()
