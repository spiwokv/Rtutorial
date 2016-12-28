### Two-sample t-test in R
Let us skip a "manual" version of the t-test and proceed directly to the function `t.test`. There are two vatriants
of two-sample t-test, one for equal variances and one for inequal variances. First let us test whether the variances
are equal:
```R
healthy<-rnorm(10, mean=12.3, sd=3.3)
healthy
sick<-rnorm(10, mean=8.5, sd=3.3)
sick
var.test(healthy, sick)
```
The null hypothesis of the `var.test` is that variance of both samples are equal. We can reject the null hypothesis
when p-value is lower than 0.05 (for the significance level of 5 %).

The null hypothesis of t-test is that both means are equal. We can reject the null hypothesis when p-value is lower
than 0.05 (for the significance level of 5 %). For samples with equal variances we will use t-test with `var.equal=TRUE`.
For samples with inequal variances we will use t-test with `var.equal=FALSE` (default):
```R
t.test(healthy, sick, var.equal=TRUE)
t.test(healthy, sick, var.equal=FALSE)
```

Paired t-test is used when values in both samples can be paired, e.g. one sample represents blood preasure of
patients before and one sample after treatement. It is better to evaluate differences for individual pationts one by one,
rather than whole samples. The t-test can be swiched to paired by `paired=TRUE`:
```R
x<-rnorm(10, mean=20, sd=5)
x
y<-x+rnorm(10, mean=2, sd=0.5)
y
t.test(x,y)
t.test(x,y, paired=TRUE)
```

#### Tips and tricks
* the function `t.test` always gives a résumé on the alternative hypothesis, you can use it if you are not shure which variant of test should be used

* the function `t.test` (as well as `plot`) can use class 'formula' as the input. We will use it frequently in next lessons, so let us try it now:
```R
healthy<-rnorm(10, mean=12.3, sd=3.3)
sick<-rnorm(10, mean=8.5, sd=3.3)
growth<-c(healthy, sick)
health<-rep(c("healthy", "sick"), each=10)
df<-data.frame(health, growth)
plot(growth~health, data=df)
t.test(growth~health, data=df)
```


