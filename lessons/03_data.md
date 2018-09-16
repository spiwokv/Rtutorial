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


