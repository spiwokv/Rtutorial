### Analysis of variance in R
Analysis of variance (ANOVA) is an extension of t-test to more than two samples. First, let us show a "manual" version of ANOVA
for three samples, one representing a biological parameter of patients who were administred a drug, one representing a control
grou and one representing patients administered a placebo:
```R
drug<-rnorm(10, mean=70, sd=30)
control<-rnorm(10, mean=100, sd=25)
placebo<-rnorm(10, mean=90, sd=25)
drug
control
placebo
sdrug<-sum((drug-mean(drug))ˆ2)
scontrol<-sum((control-mean(control))ˆ2)
splacebo<-sum((placebo-mean(placebo))ˆ2)
SSW<-scontrol+sdrug+splacebo
all<-c(control, drug, placebo)
SST<-sum((all-mean(all))ˆ2)
SSB<-SST-SSW
FE<-(SSB*27)/(SSW*2)
FE
qf(p=0.95, df1=2, df2=27)
```
