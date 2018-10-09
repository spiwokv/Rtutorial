# Cluster Analysis

We can demonstrate cluster analysis on the same dataset as PCA:
```R
tdf <- read.table("https://raw.githubusercontent.com/spiwokv/Rtutorial/master/data/tourdefrance2013.txt", header=T)
```
First let us try non-hierarchial clusterring by K-means method. For this we have to chose the number
of cluster (the value of K). For example we have some feeling that there are 5 clusters of riders
such as general classification specialists, sprinters, combined, domestiqeus and those who bet on just
one or few stages. This can be done by:
```R
kmodel <- kmeans(tdf[,3:22], 5)
kmodel
```
We can illustrate the results on the plot from PCA:

