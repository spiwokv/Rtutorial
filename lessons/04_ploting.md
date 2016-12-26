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
The function `plot` can be used to other objects as will be shown later.

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
Barplots can be drawn using function barplot:
```R
barplot(c(10.1,8.1,9.5,8.3), names.arg=c(10.1,8.1,9.5,8.3))
```
Histograms can be ploted by `hist` with breaks controlable by `breaks` parameter:
```R
hist(faithful$waiting, breaks=20)
```
Tukey's boxplots can be ploted by `boxplot` function:
```R
x<-c(1.2,2.2,1.3,4.4,3.0,2.2,2.5,2.6)
y<-c(3.3,2.3,1.8,5.5,7.7,7.3,1.9,4.7)
boxplot(x, y)
```
Three-dimensional plots can be presented using image, contour or persp function:
```R
x<-0:100
y<-0:100
gauss<-exp(-outer((x-50)**2/200,(y-50)**2/200,"+"))
image(x, y, gauss, col=heat.colors(100))
contour(x, y, gauss, levels=0:10/10, add=TRUE)
persp(x, y, gauss, col="red", theta=30, phi=30, shade=0.75, ltheta=100)
```
Nice 3D plots can be made by the `wireframe` function from the `lattice` library:
```R
library(lattice)
wireframe(gauss, shade=TRUE,light.source = c(10,0,10))
```
Appearence of plots can be odified by `par` function invoked before the funcion `plot` or other plotting functions. As an example we can show plotting of four plots on one canvas:
```R
par(mfrow=c(2,2))
x<-1:100/10
plot(x, sin(x))
plot(x, cos(x))
plot(x, tan(x))
plot(x, atan(x))
```

