### Two-sample t-test
Let us skip "manual" t-test and use directly the function t.test:
```R
neosetrene<-rnorm(10, mean=12.3, sd=3.3)
> osetrene<-rnorm(10, mean=8.5, sd=3.3)
> neosetrene
[1] 10.038366  9.094181 11.289843 15.878454 15.250237  8.415832  6.604380
[8] 11.411414 11.793384 14.677340
> osetrene
[1] 14.138496  8.304396  6.384113 17.792928 10.135895  8.015353 12.868893
[8] 10.341616  7.910172  9.081289
> t.test(neosetrene, osetrene)
```
