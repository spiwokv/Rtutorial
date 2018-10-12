### Random numbers in R
R can generate random numbers with different distributions. It is possible to generate ten random number with normal distribution
with mean set to 20 and standard deviation set to 2 (default values are 0 and 1, respectively):
```R
x<-rnorm(10, mean=20, sd=2)
x
mean(x)
sd(x)
```
The true mean and standard deviation are not exactly equal to pre-set values, but you can try with larger sets:
```R
x<-rnorm(10, mean=20, sd=2)
mean(x)
sd(x)
hist(x, br=20, xlim=c(10,30), col="gray")
x<-rnorm(100, mean=20, sd=2)
mean(x)
sd(x)
hist(x, br=20, xlim=c(10,30), col="gray")
x<-rnorm(1000, mean=20, sd=2)
mean(x)
sd(x)
hist(x, br=20, xlim=c(10,30), col="gray")
x<-rnorm(10000, mean=20, sd=2)
mean(x)
sd(x)
hist(x, br=20, xlim=c(10,30), col="gray")
```
For normal distribution you can also calculate density by `dnorm`, distribution function by `pnorm` and quantile function by `qnorm`:
```R
x<-0:400/10
plot(x, dnorm(x, mean=20, sd=2), type="l")
plot(x, pnorm(x, mean=20, sd=2), type="l")
y<-1:99/100
plot(y, qnorm(y, mean=20, sd=2), type="l")
```
The function `pnorm` is an integral of `dnorm` as you can see:
```R
x<-0.1*0:230
sum(0.1*dnorm(x, mean=20, sd=2))
pnorm(23, mean=20, sd=2)
```
The function `qnorm` is an inverse function of `pnorm`:
```R
y<-1:99/100
plot(y, qnorm(y, mean=20, sd=2), type="l")
x<-qnorm(y, mean=20, sd=2)
points(pnorm(x, mean=20, sd=2), x)
```
There are similar functions for other distributions such as chi-squared distribution (`dchisq`, `pchisq`, `qchisq` and `rchisq`), t-distribution (`dt`, `pt`, `qt` and `rt`), F-distribution (`df`, `pf`, `qf` and `rf`) and many others.

#### Tips and tricks
* you can set seed if you want to generate same random numbers:
```R
set.seed(666)
rnorm(5)
rnorm(5)
set.seed(666)
rnorm(5)
```

