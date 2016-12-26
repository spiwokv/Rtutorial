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
R can use a wide range of colors. Pre-defined colors can be shown by functions `colors`:
```R
colors()
barplot(1:6, col="sienna")
```
If colors are supplied as a vector, they alternate as shown bellow:
```R
barplot(1:6, col=c("sienna", "steelblue", "olivedrab",
                    "navy", "whitesmoke", "whitesmoke"))
barplot(1:6, col=c("sienna", "steelblue"))
```
Shades of gray can be used by the function `gray`:
```R
x<-1:50/50
gray(x)
barplot(x, col=gray(x))
```
Colors can be also mixed from red, green and blue by the function `rgb`:
```R
x<-0:10/10
rgb(1,1,x)
barplot(x, col=rgb(1,1,x))
```
Attractive palets such as `rainbow`, `heat.colors`, `terrain.colors`, `topo.colors` and `cm.colors`.

Plots can be saved in many bitmap and vector graphical formats by functions `png`, `jpeg`, `pdf`, `svg` or `ps`. After invoking this function with file name as the argument no plot is shown. Instead it is saved to file. This property can be stoped by function `dev.off()`:
```R
png("plot.png")
barplot(1:6)
dev.off()
```
The plot is saved into working directory (see funcitons `getwd` and `setwd`).

R together with its packages makes it possible to plot graphs (in the sense of graph theory), heatmaps, word clouds, geographical maps and other special plot types.

#### Tips and tricks
* high-resolution bitmap plots can be made in vector format and then converted to bitmap using your favorit graphical software

* alternatively, it is possible to use functions for bitmap plotting (e.g. png) with following modification:
```R
x<-0:100
y<-0:100
png("plot.png", width=960, height=960, pointsize=24)
gauss<-exp(-outer((x-50)**2/400,(y-50)**2/400,"+"))
image(x, y, gauss, col=heat.colors(100), axes=F)
contour(x, y, gauss, levels=0:10/10, add=TRUE, lwd=2, labcex=1.2)
axis(1, lwd=2)
axis(2, lwd=2)
box(lwd=2)
dev.off()
```
This plots the plot in doubled size. In order to further increase the size it is possible to multiply width, height and pointsize in png. However, it keeps the same widths of lines and other parameters. To fix this, avoid plotting axes by function image (axes=F) and instead plot wide axes and box separately. It can be easily modified for other plotting functions.

* to make a movie, use the output file name with regular expression and a loop:
```R
png("plot%03d.png")
x<-0:100
y<-0:100
for(i in 25:75) {
  gauss<-exp(-outer((x-i)**2/400,(y-i)**2/400,"+"))
  image(x, y, gauss, col=heat.colors(100))
  contour(x, y, gauss, levels=0:10/10, add=TRUE)
}
dev.off()
```
You can then use some video software (e.g. mencoder from Mplayer) to make a movie.
