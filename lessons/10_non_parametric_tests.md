# Nonparametric tests

Up to now we considered normal distribution of a variable. Here we will show how we can test whether
the variable follows the normal distribution and what can we do if data do not follow normal distribution.
There is a graphical tool to do that known as QQ-plot.
```R
qqnorm(x)
qqline(x)
```
The function calculates the mean and the standard deviation for the sample and from this it calculates
quantiles. Then it plots the values of the sample vs. quantiles. This plot should be linear. If not, 
it means that the distribution is right or left skewed, bimodal or non-normal in some other way.

QQ-plot is good for visual evaluation, but for a quantitative evaluatio it is usefull to use some
test of normality. One of them is the test developed by Shapiro and Wilk. You can run it by:
```R
x<-rnorm(20)
shapiro.test(x)
```
Let us try with something non-normal
```R
x<-c(rnorm(10), rnorm(10, mean=4))
shapiro.test(x)
```
The null hypothesis is that the sample follows the normal distribution.

What about if data do not follow the normal distribution? A non-parametric (i.e. not requiring normal
distribution) alternative to t-test is Wilcoxon test. The two-sample variant is also known as
Mann-Whitney test. We can use the function `wilcox.test`. It is used the same way as t-test:
```R
x<-rnorm(10)
y<-rnorm(10, mean=2)
wilcox.test(x,y)
```
Let us try to compare with t-test:
```R
t.test(x,y)
```

## Tips and tricks

* non-parametric variant of analysis of variance will be shown later.

