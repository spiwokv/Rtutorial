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
Each rider was placed into one of 5 clusters and the vector with this results can be printed as:
```R
kmodel$cluster
```
We can illustrate the results on the plot from PCA:
```R
pcamodel <- prcomp(tdf[,3:22])
plot(predict(pcamodel), col=rainbow(5)[kmodel$cluster], pch=20)
```
You can see that the distribution into clusters works very well.

Hierarchial clustering can be done by typing:
```R
distances <- dist(tdf[,3:22])
hmodel <- hclust(distances)
plot(hmodel)
```
You can again inspect identities of riders to find which branch corresponds to sprinters, which corresponds to
general classification specialists etc.

## Tips and Tricks

* the algorithm used for K-means clustering can be controled by `algorithm` option.

* the type of distance can be changes by `method` option of `dist` function.

* the parameter `method` controls the method used to construct the tree in `hclust`.

