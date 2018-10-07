# P-value adjustment and other approaches for multiple comparisons

In the previous chapter we have shown ANOVA on drug testing example:
```R
drug<-rnorm(10, mean=70, sd=30)
control<-rnorm(10, mean=100, sd=25)
placebo<-rnorm(10, mean=90, sd=25)
labels<-rep(c("control", "drug", "placebo"), each=10)
all<-c(control, drug, placebo)
df<-data.frame(ident, all)
mujmodel<-aov(all~labels, data=df)
mujmodel
summary(mujmodel)
```
This shows that there is a difference between the means. On the other 
