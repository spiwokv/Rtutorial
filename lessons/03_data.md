### Analysing data in R
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
volby <- read.table("https://web.vscht.cz/~spiwokv/statistika/volby2013prahaUTF8eng.txt",
                    sep=";", header=T, dec=",", encoding="UTF=8")
```
Parameter `sep=";"` indicates that individual items are separated by a semicolon. The option
`header=T` indicates that the first line contains names of colums. In fact the first line contains
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
Colums can be selected by:
```R
volby[,4]
```
This prints names of candidates. 

The function:
```R
names(volby)
```
prints names of colums, such as party number and name, candidate's name and age etc.

As an alternative to `volby[,4]` you can use `$` operator followed by the name of the column:
```R
volby$name  # PREDELAT!!!!!!!!
```

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

