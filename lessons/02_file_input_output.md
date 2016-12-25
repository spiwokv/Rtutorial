You can read data from unformated text files by function `read.table`:
```R
mydata<-read.table("https://raw.githubusercontent.com/spiwokv/Rtutorial/master/data/mydata.txt")
mydata
```
Alternatively you can download the file to a working directory of your computer and open it:
```R
mydata<-read.table("mydata.txt")
mydata
```
If you don't know which directory is the working one, you can type:
```R
getwd()
```
or you can change it by:
```R
setwd("C:/Documents")
```
The function `read.table` can be modified by the parameter `header`, it indicates that the first line of the file contains names of columns. Separators can be changed by parameter `sep`. By default, `sep` is set to `""`, i.e. one or multiple spaces can act as separators. Special separators such as tabulator can be defined by regular expressions, e.g. `sep="\t"'.

