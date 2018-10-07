# P-value adjustment and other approaches for multiple comparisons

In the previous chapter we have shown ANOVA on drug testing example:
```R
drug<-rnorm(10, mean=70, sd=30)
control<-rnorm(10, mean=100, sd=25)
placebo<-rnorm(10, mean=90, sd=25)
labels<-rep(c("control", "drug", "placebo"), each=10)
all<-c(control, drug, placebo)
df<-data.frame(ident, all)
mymodel<-aov(all~labels, data=df)
mymodel
summary(mymodel)
```
This shows that there is a difference between the means. Next we want to know which samples are statistically
significantly lower and higher. Again we cannot make a pairwise t-tests because of probability of rejection
of the null hypothesis by chance. Instead we can use Tukey Honest Significance Test:
```R
TukeyHSD(mymodel)
plot(TukeyHSD(mymodel))
```

Alternatively it is possible to do a pairwise t-test and adjust p-values by `pairwise.t.test`:
```R
pairwise.t.test(all, labels, p.adjust.method="none")
```
The option `p.adjust.method` can be "none" (no adjustment), "bonferroni" (Bonferroni correction),
"holm" (Holm and Bonferroni) and "BH" or "fdr" (Benjamini and Hochberg). There is also an option
`pool.sd` defining whether variances are homogeneous.

## Tips and Tricks

* in biological sciences we often compare every sample with a single control. For this it is useful
to use Dunnett test. It requires package `multicomp`:
```R
require(multcomp)
mydata <- data.frame(labels, all)
```
We must define that the first sample is the control:
```R
mydata$labels <- relevel(mydata$labels, ref=1)
```
Finally, we will do the Dunnett test:
```R
mydata.aov <- aov(vsechno  ̃ labels, data=mydata)
mydata.dunnett <- glht(mydata.aov, linfct = mcp(labels="Dunnett"))
summary(mydata.dunnett)
```
Confidence intervals can be calculated as:
```R
confint(mydata.dunnett)
```
You can also make a plot:
```R
plot(mydata.dunnett)
```
