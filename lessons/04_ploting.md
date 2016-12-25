### Ploting in R
The basic ploting function in R is `plot`:
```R
x<-1:1000/100
y<-sin(x)
plot(x,y)
```
You can swich between points (default), lines (`type="l"`), both, histogram-like, steps, none and others:
```R
plot( x, y, type="l")
```
The function `plot` always plots a new plot. If you want to add new lines or points into the existing plot use `lines` and `points`. Simply open new plot by function `plot` and then use `lines` and `points` without closing the plot:
```R
plot(x,y, type="l")
lines(x,cos(x))
points(x,0.5*cos(x))
```
Sometimes it is useful to create an empty plot canvas by `plot` with `type="n"` and add lines and points.

The function `plot` has many additional parameters:
```R
plot( x, y, main="parametr main", sub="mysub",
     xlab="myxlab", ylab="myylab", asp=1)
```
You can change colours of point and lines, shapes of points etc.:
```R
x<-1:10
plot(x, sin(x), pch=21, col="red", bg="blue", cex=2, lwd=2)
lines(x, sin(x), col="green", lwd=4)
```
Range of the horizontal and vertical axis can be controled by `xlim` and `ylim`:
```R
plot(1:10, xlim=c(0,100), ylim=c(-20,20)))
```
The function plot can be applied not only to a pair of vectors, but also to a single vector, `data.frame` and other objects. Lets try on `data.frame`:
```R
x<-c(1,2,3,1,2,1)
y<-1:6
z<-6:1
xyz<-data.frame(x,y,z)
plot(xyz)
```
Using function `text` it is possible to add short strings to points with coordinates x and y:
```R
x<-1:4*2
y<-sin(x)
pointnames<-c("first", "second", "third", "fourth")
plot(x,y)
text(x, y, labels=pointnames)
```
R can make pie charts:
```R
x<-c(1,1,2,3,2)
nam<-c("first", "second", "third", "fourth", "fiveth")
pie(x, labels=nam)
```
Histograms can be plotted by `hist` with breaks controlable by `breaks` parameter:
```R
hist(faithful$waiting, breaks=20)
```

