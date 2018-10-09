# Linear models

In R you can use function `lm` to build a linear model. It can fit a dependent variable by one
or multiple independent variables. Independent variables can quantitative, categorial or both.
```R
x<-1:10
y<-2:11+rnorm(10, sd=0.5)
linfit <- lm(y~x)
linfit
```
This will show that "y" grows with "x". However, if you fit two noisy variables you will always
obtain a result that "y" grows or descends with "x", there almost no chace to get zero slope
even if the two variables completely uncorrelated. The question is whether the non-zero slope
is statistically significant. This you can learn by function `summary`:
```R
summary(linfit)
```
This is an extension of ANOVA in the way that the independent variable is not categorial (such
as "control", "placebo" and "drug") but it is quantitative. The testing procedure is similar
to that of ANOVA, the program calculates a sum of squares of error under assumption of null and
alternative hypothesis and compares them.

There are several possibilities to describe models in the lm function:

|                                          function       |  expression in `lm`   |
|:--------------------------------------------------------|:----------------------|
| f(x) = alpha                                            |  `y~1`                |
| f(x) = alpha + beta x                                   |  `y~x`                |
| f(x) = beta x                                           |  `y~-1+x`             |
| f(x) = alpha + beta x + gamma x^2                       |  `y~x+I(x^2)`         |
| f(x) = alpha + beta_1 x_1 + beta_2 x_2                  |  `y~x1+x2`            |
| f(x) = alpha + beta_1 x_1 + beta_2 x_2 + gamma x_1 x_2  |  `y~x1*x2`            |

To get values of coefficients you can print coefficients:
```R
linfit$coefficients
```
They can be itterated:
```R
linfit$coefficients[1]
linfit$coefficients[2]
```

Alternatively you may use the function `coef`:
```R
coef(linfit)[1]
coef(linfit)[2]
```

To plot a model into data you can use function `abline`:
```R
plot(x,y)
abline(linfit)
```

The function `predict` predicts values of y for values of x based on the model. If you use:
```R
newy<-predict(object=linfit)
```
it will calculate values of y for each x by a linear model. Iw you want to calculate this for
some other values of x (here called "newx") you can type:
```R
newx<-0:100/10
newy<-predict(object=linfit, newdata=data.frame(x=newx))
```

More interesting is calculation of confidence intervals. You can use:
```R
newx<-0:100/10
newy<-predict(object=linfit, newdata=data.frame(x=newx), interval = 'prediction')
plot(x,y)
abline(linfit)
lines(newx, newy[,2], col="red")
lines(newx, newy[,3], col="red")
```
This will plot an interval to wich 95 % of samples should fall (the level could be changed by
option `level`). If you change "prediction" to "confidence" it will print confidence intervals
for the model. Provided that there is some exact linear relationships between x and (inaccurately
measured) y, we can accuratelly determine this relationship by doing an infinite number of
measurements. If we do enough measurements we can get a vary narrow confidence interval:
```R
newx<-0:100/10
newy<-predict(object=linfit, newdata=data.frame(x=newx), interval = 'confidence')
plot(x,y)
abline(linfit)
lines(newx, newy[,2], col="blue")
lines(newx, newy[,3], col="blue")
```
Prediction intervals are analogous to standard deviation, confidence intervals to standard error
of the mean.

## Tips and Tricks

* you can compare models "model1" and "model2" by `anova(model2, model1)`. This will tell you whether
"model2" is significantly better than "model1".

* as already mentioned, linear models can use continuous as well as categorial independent variables.
In order to do ANOVA with two factors use a linear model with `y~x1+x2`. In order to do ANOVA with
two factors and their interactions use a linear model with `y~x1*x2`. Beside other ANOVA presumptions
(normal distribution, homogeneity of variances) it is necessary to 

* contingency tables are an alternative to ANOVA with categorial dependent and independent variables.
To test statistical significance you can use `chisq.test` function.

