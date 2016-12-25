```R
x<-1:1000/100
y<-sin(x)
plot(x,y)

plot( x, y, type="l")

plot(x,y, type="l")
lines(x,cos(x))
points(x,0.5*cos(x))

plot( x, y, main="parametr main", sub="mysub",
     xlab="myxlab", ylab="myylab", asp=1)

x<-1:10
plot(x, sin(x), pch=21, col="red", bg="blue", cex=2, lwd=2)

plot(1:10, xlim=c(0,100), ylim=c(-20,20)))

x<-c(1,2,3,1,2,1)
y<-1:6
z<-6:1
xyz<-data.frame(x,y,z)
plot(xyz)

x<-1:4*2
y<-sin(x)
pointnames<-c("first", "second", "third", "fourth")
plot(x,y)
text(x, y, labels=pointnames)

x<-c(1,1,2,3,2)
nam<-c("first", "second", "third", "fourth", "fiveth")
pie(x, labels=nam)
```

