### Basic R commands
First function in R will ask you whether you want to save data and then it will close R:
```
q()
```
This will close R without asking you:
```
q("n")
q(save="n")
```
To see something, type:
```
a <- 1:10
b <- sin(a)
plot(a, b)
```
This will work:
```
plot(a, b, main="My plot")
```
This will not work, because the engine do not know that `"My plot"` links to `main`.
```
plot(a, b, "My plot")
```
It is possible to specify all options:
```
plot(x=a, y=b, main="My plot")
```
Help could be found by:
```
help(plot)
apropos("svd")
help.search("svd")
```
Example or demo can be found as well:
```
example(image)
demo(graphics)
```
Basic operations:
```
1+1
2-1
3*3
6/3
```
R recognizes integers and floats from the context:
```
5/2
5.0/2.0
```
power, modulo ...
```
3ˆ3
5%%2
5%/%2
```
R waits until command finished:
```
1+
1
```
Spaces are ignored:
```
1+1
1 + 1
1+         1
1           +1
```
Basic constants and fuctions:
```
pi
cos(pi)
sin(pi)
exp(1)
abs(-4)
```
Logarithm is natural by default, decadic and binnary are available as well:
```
log(exp(2))
log10(1000)
log2(16)
```
Complex numbers are supported as well:
```
2i
2i*2i
```
One can assign a value to a variable
```
x <- 20
x
y <- 10
y
x+y
```
Logical and string variables are available as well:
```
x<-FALSE
x
y<-"string"
y
```
Equal works as well in most cases, but use `<-` to be on the safe side.
```
x = 20
y = 10
x+y
```
It is possible 
```
x <- 10
x <- x + 1
x
```
R recognizes capitals and small letters:
```
a<-1
A<-2
a
A
a+A
```
Vectors can be defined by:
```
x <- c(1, 3, 2)
x
```
Or:
```
x <- 1:10
x
```
One can dissect some items from the vector:
```
x <- c(1,5,2,3,4,7)
x
x[1]
x[2]
x[3:6]
x[c(1,3)]
```
Another way how to make a vector:
```
seq(from=6, to=21, by=2)
rep((1:4), times=2)
rep((1:4), each=2)
```
It is possible to add, substract, multiply or divide a vector by a float number:
```
x<-1:5
x*2.5
x/2.5
x+2.5
x-2.5
```
or make a total of two vectors:
```
x<-c(1,3,2)
y<-4:6
x+y
```
Multiplication by `*` gives `c(x[1]*y[1], x[2]*y[2], ...)`:
```
x<-1:4
y<-c(7,2,3,1)
x*y
```
To get dot product you need to type:
```
x%*%y
```
You can apply a function to each item of the vector:
```
x<-1:4
exp(x)
```
Matrix:
```
x<-matrix(1:12, ncol=3, byrow=TRUE)
x
```
Transpose:
```
t(x)

x<-matrix(1:12, ncol=3, byrow=FALSE)
x


x<-1:4
y<-c(3,2,6,5)
rbind(x, y)
cbind(x, y)

x<-1:4
y<-c(3,2,6,5)
xy <- cbind(x, y)
xy
xy[1,]
xy[1,1]
xy[1,2]
xy[,1]
xy[,2]

x<-1:4
y<-c(3,2,6,5)
mydata <- data.frame(x,y)
mydata
mydata[1]
mydata[2]
mydata$x
mydata[1,1]
mydata[2,1]
mydata[2,]

x<-TRUE
!x
y<-FALSE
x|x
x|y
y|y
y&y
x&y
x&x

1<2
1>2
1==1
1==2

for(i in 1:3) {
  print(i)
}

sinpluscos <- function(x) {
 y<-sin(x)+cos(x)
 return(y)
}

sin(1)+cos(1)
sinpluscos(1)

# hello

installed.packages()
install.packages("igraph")
library(igraph)

ls()
data()
```

