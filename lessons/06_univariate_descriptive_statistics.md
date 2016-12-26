### Univariate descriptive statistics
Lets create a sample with mean and standart deviation set to 20 and 2, respectively:
```R
x<-rnorm(10, mean=20, sd=2)
```
Basic measures of descriptive statistics, namely minimum, lower quartile, median, mean, upper quartile and maximum,
can be obtained by function summary:
```R
summary(x)
```
These values can be accessed by special functions:
```R
min(x)
quantile(x, probs=0.25)
median(x)
mean(x)
quantile(x, probs=0.75)
max(x)
```
Important plot of univariate descriptive statistics is Tukey's box plot. It plots a box with bottom and top at
lower and upper quartile (exactly, at values nearest to lower and upper quartile). The horizontal line is located
at median. The whiskers start from the bottom and top of the box. Each whisker goes to maximum/minimum, but it is
not longer than 1.5-times of interquartile range. It some point is more distant it is depicted as a point. See bellow:
```R
x1<-rnorm(10, mean=20, sd=2)
x2<-rnorm(10, mean=20, sd=2)
x3<-rnorm(10, mean=20, sd=2)
x4<-rnorm(10, mean=20, sd=2)
boxplot(x1, x2, x3, x4)
points(1:4, c(min(x1),min(x2),min(x3),min(x4)), col="red")
points(1:4, c(max(x1),max(x2),max(x3),max(x4)), col="red")
points(1:4, c(median(x1),median(x2),median(x3),median(x4)), col="red")
points(1:4, c(quantile(x1,0.25),quantile(x2,0.25),quantile(x3,0.25),quantile(x4,0.25)), col="red")
points(1:4, c(quantile(x1,0.75),quantile(x2,0.75),quantile(x3,0.75),quantile(x4,0.75)), col="red")
```
#### Tips and tricks
* it is possible to index the function `summary`, e.g. to get minimum by index 1:
```R
summary(x)[1]
```
It is not really useful for this function, but you can use it later for other functions.
