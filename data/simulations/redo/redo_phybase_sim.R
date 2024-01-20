#!/usr/bin/env Rscript

library(phybase)
tree<-"((((anoDid:0.035561#1.0,((cryCin:0.0194555#1.0,tinGut:0.0194555#1.0):0.005376#0.004837,(eudEle:0.0236145#1.0,notPer:0.0236145#1.0):0.0012165#0.004272):0.01073#0.005400):0.0046345#0.003204,((((aptHaa:0.000609#1.0,aptOwe:0.000609#1.0):0.001531#0.001108,aptRow:0.00214#1.0):0.0225935#0.007134,(casCas:0.0068715#1.0,droNov:0.0068715#1.0):0.017862#0.005656):0.0056325#0.020347,(rheAme:0.0026145#1.0,rhePen:0.0026145#1.0):0.0277515#0.009062):0.0098295#2.207321):3.33677e-08#1.041255e-07,strCam:0.0401955#1.0):0.043162#1.0,galGal:0.0833575#1.0):#1.0"
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
