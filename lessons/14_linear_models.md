# Linear models

In R you can use function `lm` to build a linear model. It can fit a dependent variable by one
or multiple independent variables. Independent variables can quantitative, categorial or both.
```R
x<-1:10
y<-2:11+rnorm(10, sd=0.5)
linfit <- lm(y~x)
linfit
```
This will show that "y" grows with "x". However, if you fit two noisy variables you will always
obtain a result that "y" grows or descends with "x", there almost no chace to get zero slope
even if the two variables completely uncorrelated. The question is whether the non-zero slope
is statistically significant. This you can learn by function `summary`:
```R
summary(linfit)
```
This is an extension of ANOVA in the way that the independent variable is not categorial (such
as "control", "placebo" and "drug") but it is quantitative. The testing procedure is similar
to that of ANOVA, the program calculates a sum of squares of error under assumption of null and
alternative hypothesis and compares them.

There are several possibilities to describe models in the lm function:

                                           function       |  expression in `lm`
---------------------------------------------------------------------
  f(x) = alpha                                            |  `y~1`
  f(x) = alpha + beta x                                   |  `y~x`
  f(x) = beta x                                           |  `y~-1+x`
  f(x) = alpha + beta x + gamma x^2                       |  `y~x+I(x^2)`
  f(x) = alpha + beta_1 x_1 + beta_2 x_2                  |  `y~x1+x2`
  f(x) = alpha + beta_1 x_1 + beta_2 x_2 + gamma x_1 x_2  |  `y~x1*x2`

Pokud se chceme dostat k~hodnotám koeficientů, můžeme učinit například toto:
\begin{small}\begin{verbatim}
> linfit$coefficients[1]
(Intercept)
   0.7981139
> linfit$coefficients[2]
       x
   1.009980
\end{verbatim}\end{small}
nebo použít funkci \texttt{coef}:
\begin{small}\begin{verbatim}
> coef(linfit)[1]
(Intercept)
   0.7981139
> coef(linfit)[2]
       x
1.009980
\end{verbatim}\end{small}
Tyto veličiny můžeme použít k~nakreslení přímky, která prokládá data, nebo jednodušeji můžeme
použít funkci \texttt{abline}\index{\texttt{abline}}:
\begin{small}\begin{verbatim}
> plot(x,y)
> abline(linfit)
\end{verbatim}\end{small}
\begin{SCfigure}[1][ht]
\includegraphics{data/abline.png}
\caption{Proložení dat funkcemi \texttt{lm} a \texttt{abline}}
\end{SCfigure}

Dosud jsme používali analysu rozptylu pro nespojité nezávisle proměnné, tedy faktory. Například při hledání
rozdílů mezi pacienty, jimž bylo podáváno léčivo, placebo nebo nic, jsme měli nezávisle proměnnou -- faktor,
který může nabývat tří nespojitých hodnot pro léčivo, placebo nebo nic. Proč ale nevyužít analysu rozptylu
pro spojitá data? Funkce \texttt{lm}\index{\texttt{lm}} slouží k~vytváření lineárních modelů a ,,je jí jedno``, jestli nezávisle
proměnná veličina je nebo není spojitá. Analysa rozptylu pro testování vlivu léčiva prokládá data funkcí:
\newline\textit{účinek = a $\cdot$ léčivo + b $\cdot$ placebo + c}
\newline kde proměnné \textit{léčivo} a \textit{placebo} nabývají hodnot 0 nebo 1. Stejně tak je možné využít analysu
rozptylu pro spojité nezávisle proměnné.
Tato vlastnost se hodí pokud chceme zjistit, zdali zesložiťování nějakého modelu má nebo nemá opodstatnění.
Pokud například proložíme nějaká naměřená data lineráním modelem ($y = a \cdot x + b$), pak to zkusíme polynomem
druhého stupně ($y = a \cdot x^2 + b \cdot x + c$), třetího stupně a tak dále, bude nám vycházet, že čím je polynom vyšší tím
je proložení dat lepší. Podobně když budeme nějaký regresní model doplňovat jinými funkcemi než jsou polynomy,
tak také můžeme pozorovat zlepšování proložení, čili pokles součtu čtverců odchylek. Je ale jasné, že nemá
význam zesložiťovat model donekonečna. Místo toho je vhodné nalézt nějaký způsob jak odhalit, zdali nějaký prvek
v~modelu přináší nebo nepřináší signifikantně lepší proložení. Přesně v~tomto duchu funguje analýza rozptylu.
V~úloze věnované porovnání kontroly, léčiva a placeba jsme porovnali dvě hypotesy, buď že je jedno co pacienti
dostávají, nebo na tom záleží. Pro obě tyto hypotesy jsme vypočetli rozptyly a ty jsme porovnali. Podobnou
operaci můžeme provést se dvěma regresními modely, například pro model $y = a \cdot x$ a model $y = a \cdot x + b$.
Data proložíme pomocí obou modelů, spočítáme rozptyly a porovnáme je. Tak zjistíme, jestli přídavek konstatny $b$ do modelu
vedl k~signifikantnímu zlepšení modelu, nebo jestli to bylo jen zbytečné zesložitění modelu.

V~modelové úloze, na které si ukážeme analysu rozptylu v~kombinaci s~regresí, nás bude zajímat, jestli
účinnost potenciálního léčiva závisí na jeho polárnosti lineárně nebo jestli je lepší použít polynom
druhého stupně. Pokus by vypadal tak, že by bylo nejprve nutné připravit sérii derivátů nějaké biologicky
aktivní látky, například u nějakého léčiva vyměnit acetylovou skupinu za propionyl, butyryl atd.
U~každé jednotlivé sloučeniny by pak bylo nutné změřit nebo vypočítat polárnost (nejčastěji $logP$,
tedy logaritmus roz\-dě\-lo\-va\-cí\-ho koeficientu mezi oktanol a vodu) a také otestovat biologickou aktivitu.
Připravíme si modelová data, která budou vycházet z~lineárního vztahu:
\begin{small}\begin{verbatim}
> logp <- -0.2*1:8+0.1*rnorm(8)
> aktivita<-1:8+rnorm(8)
> plot(logp, aktivita)
\end{verbatim}\end{small}
\begin{SCfigure}[1][ht]
\includegraphics{data/qsar.png}
\caption{Modelová data pro kombinaci regrese a analysy rozptylu}
\end{SCfigure}
Použitím funkcí \texttt{lm} a \texttt{anova} s~lineárním modelem se dozvíme, že na polárnosti molekul záleží:
\begin{small}\begin{verbatim}
> mod1 <- lm(aktivita~logp)
> mod1

Call:
lm(formula = aktivita ~ logp)

Coefficients:
> anova(mod1)
Analysis of Variance Table

Response: aktivita
          Df Sum Sq Mean Sq F value   Pr(>F)
logp       1 60.084  60.084  29.709 0.001587 **
Residuals  6 12.135   2.022
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

\end{verbatim}\end{small}
Kromě lineárního modelu chceme otestovat ještě polynom druhého řádu. Pro něj můžeme použít
funkci \texttt{lm}\index{\texttt{lm}}, protože se jedná o~takzvaný obecný lineární model, tedy že závisle
proměnnou můžeme vyjádřit jako lineární kombinaci $x^2$, $x^1$ a $x^0$. Model bude vypadat takto:
\begin{small}\begin{verbatim}
> mod2 <- lm(aktivita~poly(logp,2))
> mod2

Call:
lm(formula = aktivita ~ poly(logp, 2))

Coefficients:
   (Intercept)  poly(logp, 2)1  poly(logp, 2)2
        4.4876         -7.7514          0.5006

> anova(mod2)
Analysis of Variance Table

Response: aktivita
              Df Sum Sq Mean Sq F value  Pr(>F)
poly(logp, 2)  2 60.334  30.167  12.692 0.01098 *
Residuals      5 11.884   2.377
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
\end{verbatim}\end{small}
Pokud chcete mít v~ANOVA tabulce jak prvek pro $x$ tak i~pro $x^2$, zkuste zapsat model jako:
\begin{small}\begin{verbatim}

> mod2 <- lm(aktivita~logp+I(logp^2))
\end{verbatim}\end{small}

Modely \texttt{mod1} a \texttt{mod2} můžeme porovnat pomocí funkce \texttt{anova}\index{\texttt{anova}}:
\begin{small}\begin{verbatim}
> anova(mod2, mod1)
Analysis of Variance Table

Model 1: aktivita ~ poly(logp, 2)
Model 2: aktivita ~ logp
  Res.Df     RSS Df Sum of Sq      F Pr(>F)
1      5 11.8839
2      6 12.1346 -1   -0.2506 0.1054 0.7585
\end{verbatim}\end{small}
čímž zjistíme, že zlepšení modelu přídavkem polynomu druhého řádu není signifikantní.
Jinými slovy nemáme dostatek důkazů pro to, abychom předpokládali, že binomický model
vystihuje experimentální data lépe než lineární model.
