### Analyzing data in R

We can show how to extract and manipulate data from a dataset. Let us create a simple "dataset" containing names:
```R
jmena <- c("Karina","Radmila","Diana","Dalimil","Melichar","Vilma","Cestmir","Vladan","Bretislav")
```
It is possible to iterate this vector of names by typing square brackets with element ID (R counts from 1,
not from 0). To get the first name type:
```R
jmena[1]
```
(returns Karina). You can evaluate some expression within the square brackets, e.g.:
```R
jmena[1+1]
```
returns Radmila, not Karina Karina. You can use colon operator:
```R
jmena[1:3]
```
This returns first three names. You can use more complicated operation:
```R
jmena[1:3*2]
```
This returns element number 2, 4 and 6. Negative indexes can be used to remove some element:
```R
jmena[-1]
```
(returns all elements except the first one). The last element can be obtained by `jmena[9]` if
you know the number of elements or `jmena[length(jmena)]` in case you are lazy to count them.
To inverse the order of elements you can use the colon operator as `jmena[9:1]` or
`jmena[length(jmena):1]`.

Let us move to more complicated dataset. You can load the results of municipal elections 2015 in Prague:
```R
volby <- read.table("https://raw.githubusercontent.com/spiwokv/Rtutorial/master/data/volby2013praha.txt",
                    sep=";", header=T, dec=",")
```
Parameter `sep=";"` indicates that individual items are separated by a semicolon. The option
`header=T` indicates that the first line contains names of columns. In fact the first line contains
the remark, because it starts with `#`. The option `dec=","` tells us that the Czech decimal is used.
Finally, `encoding="UTF=8"` determines encoding.

For the first inspection you can type:
```R
head(volby)
```
This prints the first 10 lines. You can chose different number by `n=2` option. Similarly you can print
last lines by function `tail`.

Function:
```R
dim(volby)
```
prints the dimension (number of lines and colums). You can get these values separately for the number of
lines and columns by functions `nrow` and `ncol`, respectively.

You can iterate on the lines and columns similarly to the previoius example. For example, you can select
the first candidate in the alphabetic order as:
```R
volby[1,]
```
Columns can be selected by:
```R
volby[,4]
```
This prints names of candidates. 

The function:
```R
names(volby)
```
prints names of columns, such as party number and name, candidate's name and age etc.

As an alternative to `volby[,4]` you can use `$` operator followed by the name of the column:
```R
volby$jmeno
```
("jmeno" = "name" in Czech).

The function `levels` determines levels of a vector. For example, if you type:
```R
volby[,2]
```
it will print a vector with 680 items (one for each candidate) with political parties of
candidates in the alphabet order of their family names. If you place this into the function
`levels` it will print each party only once:
```R
levels(volby[,2])
```
By function `nlevels` you can get the number of political parties. Function `table` will
print a table with numbers of candidates per party:
```R
table(volby[,2])
```
In order to print only the lines containing candidates of "Piráti" you can use following expressions:
The expression `volby[,2]` will print parties in the alphabet order of names of candidates. You can
extend it by `volby[,2]=="Piráti"`. This will return the series of `TRUE` and `FALSE` values in the same
order. For example, first 16 candidates in alphabet were not Pirates, so first 16 values are `FALSE`. The
candidate number 17 is Pirate, so output number 17 is `TRUE`. You can apply `sum` function on the output.
This function counts `TRUE` as 1 and `FALSE` as 0.

If you insert the previous expression `volby[,2]=="Piráti"` into the square brackets of `volby[]` you can
select lines containing Pirates:
```R
volby[volby[,2]=="Piráti",]
```
The square brackets contain comma inside, because we select lines or columns. The expression `volby[,2]=="Piráti"`
is in front of the comma because we select lines. Lines with `TRUE` as the output of `volby[,2]=="Piráti"` are
printed, others are not printed.

Let us look at numbers of votes in the column number 8. We can check the range by function `range`:
```R
range(volby[,8])
```
This shows that the least successful candidate was not voted at all, the most successful got 37794 votes.
You can print all votes sorted by the function `sort`:
```R
sort(volby[,8])
```
To get the reverse order use option:
```R
sort(volby[,8], decreasing=TRUE)
```
You may be interested who scored the best and worst in elections. You can use function `order`. This function prints
the index of the lowest value, the index of the second lowest value and so forth. The expression:
```R
volby[order(volby[,8]),]
```
will print the table sorted by the number of votes from the lowest to highest. You can revert the order by option
`decreasing=T` in the order function.

Finally, we are interested in number of votes for each party. This can be obtained manually, party by party as:
```R
sum(volby[volby[,2]=="Piráti",8])
```
and so forth for each party. As an alternative you can use function `aggregate`:
```R
aggregate(x=volby[,8], by=list(volby[,2]), FUN=sum)
```
The function `list` is used because votes can be aggregated by multiple factors. Instead of function `sum`
you can use other functions, for example average age of each party can be printed by:
```R
aggregate(x=volby[,5], by=list(volby[,2]), FUN=mean)
```
You can plot numbers of votes as a pie chart or bar plot:
```R
vysledky<-aggregate(x=volby[,8], by=list(volby[, 2]), FUN=sum)
pie(vysledky[,2], labels=vysledky[,1])
barplot(vysledky[,2], names.arg=vysledky[,1])
```

#### Tips and tricks

There is a family of "apply" functions. To calculate a sum for each row of an array or matrix use:
```R
apply(myarray, 1, FUN=sum)
```
If you want to calculate the same for columns replace `1` by `2`. You can use any other function with
a single input, or even a user defined function defined by `function()`. For example you can count
positive values per column as:
```R
apply(myarray, 2, function(x) length(x[x>0])
```

There are specialized packages for data analysis such as "dplyr". It uses a special "pipe" operator (`%>%`).
The output of the operation before the pipe is used as an input of the operation after the pipe. 
Special functions `mutate`, `select`, `filter`, `summarise`, `arrange` and others are used in dplyr.
You can replace the `aggregate` function from the previous example as:
```R
install.packages("dplyr")
library(dplyr)
ifile %>% group_by(strana) %>% summarise(abs=sum(abs))
```

Another useful package for data analysis is "TidyR". Both dplyr and TidyR are from a tidyverse package
of packages for data analysis. TidyR uses functions `gather()`, `spread()`, `separate()`, `extract()`
and others to reshape data from untidy to tidy datasets.

