### Two-sample t-test
Let us skip a "manual" version of the t-test and proceed directly to the function `t.test`. There are two vatriants
of two-sample t-test, one for eqaul variances and one for inequal variances. First let us test whether the variances
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

Paired!!!!!!!

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


