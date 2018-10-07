# Bi- and multivariate descriptive statistics

Let us generate a set of two well correlating variables `x` and `y`:
```R
x<-1:10
y<-2:11+rnorm(10, sd=0.5)
x
y
plot(x,y)
```
Covariance can be calculated manually as:
```R
sum((x-mean(x))*(y-mean(y)))/(length(x)-1)
```
Pearson corelation can be calculated as:
```R
sum((x-mean(x))*(y-mean(y)))/sqrt(sum((x-mean(x))^2)*sum((y-mean(y))^2))
```

In R they can be calculated as:
```R
cov(x,y)
cor(x,y)
```
Correlation can be calculated by dividing covariance by standard deviations of both variables:
```R
cov(x,y)/(sd(x)*sd(y))
```

## Tips and Tricks

* it is possible to apply these functions on data frame or matrix. This will make a paiwise correlation
of all columns.


