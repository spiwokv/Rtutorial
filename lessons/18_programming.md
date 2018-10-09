# Programming

R is a programming language. You can make loops and other programming constructions in R.

## Tips and Tricks

* you can make a for-loop by:
```R
for(i in 1:10) {
  print(i)
}
```

* always use `print` function to print something in a loop

* you can "if" statement by:
```R
for(i in 1:10) {
  if(i==3) {
    print(i)
  }
}
```
If-else statement and swich statement works as well.

* you can define a function:
```R
sem <- function(x) {
  return(sd(x)/sqrt(len(x)))
}
sem(rnorm(10))
```

* to run a program in R in a command line save the code to "program.R" and run it by typing:
```
Rscript program.R
```
or
```
R --no-save < program.R
```

* you can use a kind of object oriented programming in R

* you can use generic functin, such as plot, defined to an object you define

