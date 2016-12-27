### One-sample t-test
Confidence interval and one-sample t-test are two sides of the same coin. Let us calculate confidence interval for a sample
generated by function `rnorm`:
```R
x<-rnorm(10, mean=20, sd=2)
sem<-sd(x)/sqrt(length(x))
mean(x)+sem*qt(p=c(0.025,0.975), df=(length(x)-1))
```
We can make a t-test with the null hypothesis that the mean of x is equal to 20. The null hypothesis is rejected if 20 is
outside the confidence interval.

Another option is to calculate criterion R and compare it with corresponding quantile of t-distribution:
```R
x <- rnorm(10, mean=20)
sem<-sd(x)/sqrt(length(x))
R<-abs(mean(x)-20)*sqrt(length(x))/sd(x)
R
qt(p=0.975, df=(length(x)-1))
```
The null hypothesis is rejected if R is bigger than the quantile of t-distribution.

The most convinient t-test option is to use the function t.test:
```R

```