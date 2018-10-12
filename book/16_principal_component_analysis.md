# Principal Component Analysis

Principal Component Analysis (PCA) is frequently used data analysis method. Let us demonstrate it
on the results of Tour de France 2013. You can load the data by typing:
```R
tdf <- read.table("https://raw.githubusercontent.com/spiwokv/Rtutorial/master/data/tourdefrance2013.txt", header=T)
```
Every frame corresponds to a single rider (riders that did not finish the race were removed).
The numbers in the table corresponds to their order in each stage. Each column corresponds to one stage.
One stage was removed. It was a team time trial where order is given to teams rather than individual riders.
It is very complicated to somehow visualize this data, because they are 20-dimensional (because of 20 stages).
This is a great opportunity for PCA. Let us try on column 3-22 containing the results:
```R
pcamodel <- prcomp(tdf[,3:22])
summary(pcamodel)
```
To plot importance of components you can use `plot` function on the model:
```R
plot(pcamodel)
```
This shows that there is 1-2 important components describing the data very well. You can plot PC1 vs. PC2:
```R
biplot(pcamodel)
```
Each number in black corresponds to the number of line in the `tdf` table. You can print their names as:
```R
tdf[108,2]
```
to reveal the identity of the rider 108. The red arrows show the relationships between the original data
and the results of the PCA. For example, some arrows point right and some point to the bottom. The former
correspond to mountain stages. The later to flat stages. 

From the results of PCA you can recognize that rider on left side of the plot are those who reached best
in the overall classification of the race. These are typically slim mountain stage specialists who scored
well in mountain stages (the arrow points right, more right means higher place in a mountain stage).

Riders at the top reached good results in flat stages. These are typically masculine riders who perform
poorly in mountain stages. Riders in the bottom right cloud are "domestiques" who don't care much about
their own results or rides who bet on just one stage and performed poorly in other stages.

## Tips and Tricks

* the data can be centered and or normalized before PCA. Centering is a usual step in PCA and PCA without
centering is rarely used. Normalization is used if you analyze apples and pears. They are controlled by:
`center`, `scale.` (note: there is a dot after "scale").

* you can use PC1 and PC2 values using `predict` function, e.g.:
```R
plot(predict(pcamodel))
```
To plot PC1 vs. PC3 use:
```R
plot(predict(pcamodel)[,c(1,3)])
```

* in `biplot` you can control size of red arrows by `expand`. You can switch them off by setting it to
zero:
```R
biplot(pcamodel, expand=0)
```

