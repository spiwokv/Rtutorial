### Random numbers in R
R can generate random numbers with different distributions. It is possible to generate ten random number with normal distribution
with mean set to 20 and standart deviation set to 2:
```R
x<-rnorm(10, mean=20, sd=2)
x
mean(x)
sd(x)
```
The true mean and standart deviation are not exactly equal to pre-set values, but you can try with larger sets:
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

