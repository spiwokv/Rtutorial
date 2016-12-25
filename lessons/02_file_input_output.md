### Reading and writing files in R
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
The function `read.table` can be modified by the parameter `header`, it indicates that the first line of the file contains names of columns.
Separators can be changed by parameter `sep`. By default, `sep` is set to `""`, i.e. one or multiple spaces can act as separators. Special separators such as tabulator can be defined by regular expressions, e.g. `sep="\t"`.
It is also possible to control quoting characters, strings which are to be interpreted as `NA` (not available) values or comment character.
There are special functions to read formated files, such as `read.csv`, `read.csv2`, `read.delim`, `read.delim2`, `read.fwf` and `read.ftable`. It is also possible to read data from Microsoft Excel, databases (MySQL, SQLite, Oracle, Microsoft SQL Server and others) XML, JSON and other files.
Data can be written by the function `write.table`:
```R
mydata<-read.table("https://raw.githubusercontent.com/spiwokv/Rtutorial/master/data/mydata.txt")
mydata
write.table(mydata, "mydata2.txt")
```
