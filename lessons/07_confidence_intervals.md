### Confidence intervals in R
Confidence intervals can be calculated in R, for example, as mean +/- s.e.m. multiplied by quantile of t-distribution.
```R
x<-rnorm(10, mean=20, sd=2)
sem<-sd(x)/sqrt(length(x))
mean(x)+sem*qt(p=c(0.025,0.975), df=(length(x)-1))
```
The funcion `qt(p=c(0.025,0.975), df=(length(x)-1))` returns quantile of t-distribution for p=0.025 and 0.975, i.e. for 95 %
probability. For 90 % use `p=c(0.05,0.95)`, for 99 % use `p=c(0.005,0.995)` etc.

If you generate 100 random samples (each with 10 items) with mean set to 20 and standart deviation set to 2, you shold
expect that 95 samples will contain 20 in the confidence interval and 5 will not. Let's try:
```R
good<-0
for(i in 1:100) {
  x<-rnorm(10, mean=20, sd=2)
  sem<-sd(x)/sqrt(length(x))
  ci<-mean(x)+sem*qt(p=c(0.025,0.975), df=(length(x)-1))
  if((ci[1]<20)&&(ci[2]>20)) {
    good<-good+1
  }
}
good
```
I obtained 97, close to expected 95.

#### Tips and tricks
* confidence inteval can be obtained more easily by `t.test` as will be shown later:
```R
x<-rnorm(10, mean=20, sd=2)
t.test(x)$conf.int
t.test(x)$conf.int[1:2]
sem<-sd(x)/sqrt(length(x))
mean(x)+sem*qt(p=c(0.025,0.975), df=(length(x)-1))
```
