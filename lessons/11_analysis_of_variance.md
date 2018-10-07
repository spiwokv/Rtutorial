### Analysis of Variance

Analysis of Variance (ANOVA) is an extension of t-test to more than two samples. The null hypothesis is that all samples
have the same mean. We simply cannot do a pairwise t-test because this increases probability of rejection of the null hypothesis
simply by chance. First, let us show a "manual" version of ANOVA
for three samples, one representing a biological parameter of patients who were administered a drug, one representing a control
group and one representing patients administered a placebo:
```R
drug<-rnorm(10, mean=70, sd=30)
control<-rnorm(10, mean=100, sd=25)
placebo<-rnorm(10, mean=90, sd=25)
drug
control
placebo
```
First, let us calculate variances in each group:
```R
sdrug<-sum((drug-mean(drug))ˆ2)
scontrol<-sum((control-mean(control))ˆ2)
splacebo<-sum((placebo-mean(placebo))ˆ2)
```
We will sum this and we will call it sum of squares within the group (SSW):
```R
SSW<-scontrol+sdrug+splacebo
```
Next, we will concatenate all samples and calculate mean of this supersample. We will call the variance of the supersample
as sum of squares total (SST):
```R
all<-c(control, drug, placebo)
SST<-sum((all-mean(all))ˆ2)
```
In an extreme example that means of all samples are the same, the SSW and SST are the same, otherwise SST is bigger than SSW.
The difference of SST and SSW is thus a measure of difference between the samples. We will cal this sum of squares between
the groups (SSB):
```R
SSB<-SST-SSW
```
The criterion with the F-distribution is calculated as:
```R
FE<-(SSB*27)/(SSW*2)
FE
```
with two degrees of freedom, 27 is the total number of values minus number of samples (30-3), and 2 is number of samples
minus 1. Finally, we will compare this with the value of the quantile of F-distribution:
```R
qf(p=0.95, df1=2, df2=27)
```
If the `FE` is higher than `qf` we can reject the null hypothesis (i.e. that means of samples are the same).

In an automated way we can make use of a data frame:
```R
labels<-rep(c("control", "drug", "placebo"), each=10)
all<-c(control, drug, placebo)
df<-data.frame(ident, all)
```
We will make a model by the function analysis of variance and we will obtain all results by summary of the model:
```R
mujmodel<-aov(all~labels, data=df)
mujmodel
summary(mujmodel)
```
We can reject the null hypothesis on the basis of the p-value. The same result can be obtained by:
```R
anova(lm(all~labels, data=df))
```

Data for ANOVA must follow normal distribution and there must be homogeneous variances of samples. For other than normal
distribution try data transformation or Kruskal-Walis test (bellow). For different variances try transformation.

## Tips and Tricks

* to test normality of data you can use the function `mshapiro.test`. It is a multivariate alternative
to Shapiro and Wilk test.

* to test homogeneity of variances you can use `bartlett.test` or `fligner.test`.

* Kruskal-Wallis rank sum test (`kruskal.test`) is a non-parametric alternative to ANOVA:
```R
kruskal.test(all~labels, data=df)
```

