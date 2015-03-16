### Basic R commands
```
 q()
```
will close R.
```
 q("n")
 q(save="n")
```
will close R without asking.
```
 a <- 1:10
 b <- sin(a)
 plot(a, b)
 plot(a, b, main="My plot")
 plot(a, b, "My plot")
 plot(x=a, y=b, main="My plot")
 help(plot)
 apropos("svd")
 help.search("svd")
 example(image)
 demo(graphics)

 1+1
 2-1
 3*3
 6/3

 5/2
 5.0/2.0

 3ˆ3
 5%%2
 5%/%2

 1+
 1

 1+1
 1 + 1
 1+         1
 1           +1

 pi
 cos(pi)
 sin(pi)
 exp(1)
 abs(-4)

 log(exp(2))
 log10(1000)

 2i
 2i*2i

 x <- 20
 x
 y <- 10
 y
 x+y

 x<-FALSE
 x
 y<-"string"
 y

 x = 20
 y = 10
 x+y

 x <- 10
 x <- x + 1
 x

 a<-1
 A<-2
 a
 A
 a+A

 x <- c(1, 3, 2)
 x

 x <- 1:10
 x

 x <- c(1,5,2,3,4,7)
 x
 x[1]
 x[2]
 x[3:6]
 x[c(1,3)]

 seq(from=6, to=21, by=2)
 rep((1:4), times=2)
 rep((1:4), each=2)

 x<-1:5
 x*2.5
 x/2.5
 x+2.5
 x-2.5

 x<-c(1,3,2)
 y<-4:6
 x+y

 x<-1:4
 y<-c(7,2,3,1)
 x*y
 x%*%y

 x<-1:4
 exp(x)

 x<-matrix(1:12, ncol=3, byrow=TRUE)
 x
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
