# ESERCIZIO 1

# 1.1 
# Studiare la distribuzione della variabile mpg (consumo) calcolando 
# indici di posizione, variabilit`a e forma. Rappresentare graficamente 
# la distribuzione mediante un grafico appropriato e commentare le principali 
# caratteristiche osservate.

data(mtcars) # data lo uso per caricare il dataset richiesto
n <- length(mtcars$mpg) # numero di osservazioni del dataset, in particolare la colonna di mpg
media_mpg <- mean(mtcars$mpg) # media della variabile mpg
mediana_mpg <- median(mtcars$mpg) # mediana della variabile mpg

summary(mtcars$mpg) 
# noto che la media è leggermente maggiore della mediana
# ciò significa che la distribuzione del consumo in mpg 
# presenta una lieve asimmetria positiva.

var_mpg <- var(mtcars$mpg) * (n - 1) / n
# moltiplico per (n - 1) / n perchè var restituisce la varianza campionaria
# mentre io voglio la varianza standard dato che sto analizzando una "popolazione" ben specifica
# e non sto facendo inferenza da un campione

sd_mpg <- sd(mtcars$mpg) # deviazione standard della variabile mpg
cv_mpg <- (sd_mpg / media_mpg) * 100

# Il coefficiente di variazione della variabile mpg è circa pari al 30%, 
# indicando una variabilità moderata del consumo rispetto alla media.
# la dispersione di dati intorno alla media non è eccessiva

library(labstatR) 
# la funzione library serve per caricare una libreria precedentemente
# scaricata nel propruio ambiente di lavoro tramite la funzione 
# install.packages("nome")

sk_mpg <- skew(mtcars$mpg)
sk_mpg

# dopo aver caricato la libreria labstatR invoco la funzione skew, che mi dà informazioni
# sulla skewness, ossia sulla asimmetria di una distribuzione.
# il risultato di skewness di mpg di 0.64 conferma l'ipotesi precedente 
# di una lieve asimmetria positiva, quando ci eravamo basati sul fatto che la media
# fosse leggermente superiore alla mediana per mpg

boxplot(mtcars$mpg,
        col = "lightgreen",
        main = "Boxplot mpg")

# dal boxplot non mergono outliers e il baffo superiore è di lunghezza maggiore rispetto
# a quello inferiore, osservazione coerente con quanto osservato prima per quanto 
# riguarda l'asimmetria della distribuzione

# 1.2
# Confrontare le distribuzioni del consumo (mpg) condizionatamente al tipo di trasmissione
# (am), utilizzando un grafico appropriato. Calcolare le medie condizionate 
# e confrontare la variabilita tra i due gruppi.

table(mtcars$am) 
# funzione table la uso per ottenere una tabella di frequenza della variabile am

boxplot(mpg ~ am,
        data = mtcars,
        col = c("lightcoral", "lightblue"),
        main = "mpg per tipo di trasmissione",
        ylab = "mpg")

# dal boxplot è evidente che le automobili con am = 1, ossia quelle con cambio manuale,
# hanno un mpg più alto di quelle con am = 0 (cambio automatico), e di conseguenza 
# consumano di meno.
# per entrambi i gruppi non sono presenti outliers evidenti

tapply(mtcars$mpg,
       mtcars$am,
       mean)
# coerentemente con quanto osservato dal boxplot, la media di mpg delle auto manuali (24.39)
# è maggiore di quelle automatiche (17.15), confermando un consumo minore per le prime

?cv

cv_corretto <- function(x) {
  n <- length(x)
  sd_x <- sqrt(var(x) * (n - 1) / n)
  cv <- sd(x) / mean(x)
  cv
}

tapply(mtcars$mpg,
       mtcars$am,
       var)

tapply(mtcars$mpg,
       mtcars$am,
       cv_corretto)

# per confrontare la variabilità dei dati tra due gruppi con medie diverse devo utilizzare 
# un indice relativo come il coefficiente di variazione, per il quale ho creato una funzione 
# per standardizzarlo anzichè usare la funzione adatta ai campioni.
# Il CV risulta di 0.22 (22%) per le auto automatiche e di 0.24(24%) per quelle manuali
# evidenziando una variabilità del consumo relativo al tipo di trasmissione
# sostanzialmente quasi invariata indipendentemente dal tipo di trasmissione


# 1.3
# Creare una nuova variabile categoriale peso cat dividendo la variabile wt (peso)
# in tre classi di pari numerosit`a. Costruire una tabella di frequenza 
# doppia tra peso cat e cyl (numero di cilindri) e commentare l’eventuale 
# associazione tra le due variabili.

mtcars$peso_cat <- cut(mtcars$wt,
                       breaks = quantile(mtcars$wt,
                                         c(0, 1 / 3, 2 / 3, 1)),
                       include.lowest = TRUE)

table(mtcars$peso_cat,
      useNA = "always")

tabella <- table(mtcars$peso_cat,
                 mtcars$cyl)
tabella

# Dalla tabella è evidente la relazione tra il peso in migliaia di libbre e i cilindri dell'auto
# quasi tutte le auto da 4 ciclindri pesando meno di 2810 libbre (9 su 11).
# tutte le auto con un peso maggiore di 3500 libbre hanno 8 cilindri
# Questo indica che all’aumentare del peso aumenta anche il numero di cilindri.

# 1.4
# Analizzare la relazione lineare tra il consumo (mpg) e il peso (wt) delle automobili:
# • Rappresentare i dati con un diagramma di dispersione.
# • Calcolare il coefficiente di correlazione di Pearson e commentarne il valore.
# • Adattare un modello di regressione lineare semplice, interpretare i coefficienti stimati e
# valutarne la significativit`a statistica.
# • Commentare la bont`a di adattamento del modello e prevedere il consumo atteso per
# un’automobile che pesa 3 migliaia di libbre.

plot(mtcars$wt,
     mtcars$mpg,
     pch = 19, col = "blue",
     xlab = "Peso (1000 lbs)", ylab = "mpg",
     main = "Relazione mpg ~ wt") #pch tipo di punto

# L'andamento dello scatterplot mostra chiaramente una relazione lineare negativa 
# tra le due variabili wt e mpg. All'aumentare del peso wt, il numero di miglia
# per gallone diminuisce, evidenziando un consumo maggiore all'aumentare del peso.

cor(mtcars$mpg, mtcars$wt)

# il coefficiente di correlazione di Pearson  è circa -0.87, molto vicino a 1 in valore assoluto
# confermando una forte correlazione negativa tra le variabili mpg e wt

modello <- lm(mpg ~ wt, data = mtcars)
abline(modello, col = "red", lwd = 2) # lwd è line width

summary(modello) #ottenere rapidamente una sintesi statistica del modello di regressione lineare

# Il modello di regressione lineare mostra una relazione negativa e statisticamente significativa
# tra il peso dell’auto (wt) e il consumo (mpg). Il coefficiente di wt (-5.34) indica che,
# mediamente, un aumento di 1000 libbre comporta una riduzione di circa 5.34 mpg,
# con un p-value estremamente basso che conferma la significatività del coefficiente di regressione
# L’intercetta (37.29) rappresenta il consumo medio per un’auto di peso zero, ( in questo caso senza significato pratico)
# La bontà di adattamento, con R² pari a 0.75, indica che il modello spiega gran parte della variabilità
# del consumo, confermando che wt è un predittore rilevante 
# e che la regressione lineare descrive adeguatamente la relazione osservata.

plot(modello)

# Residuals vs Fitted: serve a verificare l'ipotesi di linearità.
# I punti dovrebbero essere distribuiti casualmente attorno alla linea 
# orizzontale dello 0, senza pattern evidenti. Nel nostro caso si nota un pattern quasi a U
# di curvatura, suggerendo forse un andamento quadratico. Tuttavia il nostro R quadro confermava
# la solidità del modello. Possiamo quindi accettare l'approssimazione lineare

# Normal Quantile - Quantile: serve a verificare l'ipotesi di normalità dei residui.
# I punti dovrebbero giacere sulla bisettrice tratteggiata.
# Il grafico Q-Q mostra che i residui standardizzati seguono abbastanza fedelmente 
# la linea teorica della distribuzione normale. Si notano alcune lievi deviazioni 
# sulle code (in particolare per la 'Fiat 128' o la 'Toyota Corolla'), 
# ma nel complesso l'ipotesi di normalità degli errori appare plausibile.

# Scale - Location: serve a verificare l'ipotesi di omoschedasticità, ossia di
# varianza costante degli errori. La linea rossa dovrebbe essere orizzontale e 
# e i punti sparsi uniformemente.
# Il grafico Scale-Location mostra una linea rossa tendenzialmente orizzontale
# e una dispersione dei punti abbastanza uniforme lungo l'asse delle ascisse.
# Ciò indica che la varianza dei residui è costante (omoschedasticità) 

# Residuals vs Leverage: Serve a identificare outliers e punti influenti.
# Bisogna guardare se qualche punto supera la distanza di Cook
# Dal grafico dei residui rispetto alla leva, non si evidenziano punti che oltrepassano 
# la distanza di Cook critica (le linee tratteggiate agli angoli, se presenti). 
# Pertanto, non sembrano esserci osservazioni influenti che stanno distorcendo 
# in modo significativo i coefficienti del modello.

predict(modello,
        newdata = data.frame(wt = 3),
        interval = "confidence", level = 0.95)

# il modello prevede che un veicolo di 3000 libbre abbia un consumo medio stimato 
# di 21.25 mpg. Siamo confidenti al 95% che il vero consumo medio per questa categoria 
# di peso sia compreso tra 19.98 e 22.53 mpg.

# ESERCIZIO 3 

data(ToothGrowth)
library(tidyverse) 

# 3.1 e 3.2 
# Calcolare le medie marginali e condizionate della variabile lunghezza dei denti
# Rappresentare graficamente le distribuzioni della lunghezza dei denti condizionate 
# ai vari fattori, e costruire un grafico per visualizzare l’eventuale presenza 
# di interazione tra tipo di supplemento e dose.

mean(ToothGrowth$len)

ToothGrowth |> 
  group_by(supp) |> 
  summarise(medie_cond = mean(len))

# |> si chiama Pipe 

boxplot(len ~ supp,
        data = ToothGrowth,
        col = "lightblue")

# In media, i porcellini che hanno ricevuto vitamina C tramite succo d’arancia hanno denti più lunghi 
# rispetto a quelli che hanno ricevuto acido ascorbico, senza considerare la dose.

ToothGrowth |> 
  group_by(dose) |> 
  summarise(medie_cond = mean(len))

boxplot(len ~ dose,
        data = ToothGrowth,
        col = "lightcoral")

# La lunghezza dei denti aumenta chiaramente con la dose di vitamina C,
# indipendentemente dal tipo di supplemento.

boxplot(len ~ supp * dose,
        data = ToothGrowth)

ToothGrowth |> 
  group_by(supp, dose) |> 
  summarise(medie_cond = mean(len))

# A basse dosi (0.5 e 1 mg), il succo d’arancia sembra più efficace rispetto all’acido ascorbico.

# Alla dose più alta (2 mg), entrambi i metodi portano a denti di lunghezza simile (~26.1),
# suggerendo un possibile effetto di interazione tra tipo di supplemento e dose.

# Interaction Plot
ToothGrowth |> 
  group_by(supp, dose) |> 
  summarise(medie_cond = mean(len)) |> 
  ggplot(aes(x = dose, y =  medie_cond, color = supp)) + 
  geom_point() + geom_line() +
  theme_minimal() +
  labs(y = "Media di len")

# 3.3 eseguire un'analisi della varianza ANOVA a due vie per verificare:
# • l’effetto principale del metodo di somministrazione (supp);
# • l’effetto principale della dose (dose);
# • l’eventuale presenza di interazione tra i due fattori.

# Trasformo supp e dose in fattori

ToothGrowth$supp <- factor(ToothGrowth$supp)
ToothGrowth$dose <- factor(ToothGrowth$dose)

anova_modello <- aov(len ~ supp * dose, data = ToothGrowth)
summary(anova_modello)

# L’ANOVA a due vie mostra che sia il tipo di supplemento (supp, p = 0.000894)
# sia la dose (dose, p < 2e-16) hanno un effetto significativo sulla lunghezza dei denti.
# Anche l’interazione tra supplemento e dose è significativa (p = 0.0246), 
# indicando che l’effetto della dose dipende dal tipo di supplemento. 
# Concludiamo che sia gli effetti principali sia l’interazione 
# influenzano significativamente la crescita dei denti.

tukey <- TukeyHSD(anova_modello, c("supp", "dose"))
tukey

# Il Test di Tukey si esegue solitamente come analisi post-hoc (successiva) 
# dopo aver effettuato un'analisi della varianza (ANOVA).

par(mfrow = c(2,1))
plot(tukey)

# Tutti i confronti mostrano differenze significative tra i gruppi:
# ogni media è diversa dalle altre. In particolare, i 
# porcellini trattati con VC hanno denti più corti 
# rispetto a quelli con succo d’arancia, e le 
# lunghezze dei denti aumentano progressivamente con la dose di vitamina C.

# ESERCIZIO 4 

# Campione di osservazioni 
x <- c(992, 1003, 995, 987, 1001, 998, 990, 996, 1005, 991)

# Numero di osservazioni
n <- length(x)        

# Media campionaria
media <- mean(x)      

# Deviazione standard campionaria
sd_x <- sd(x)       

# 4.1 
# ostruire l’intervallo di confidenza per il parametro µal livello di confidenza 0.95, 
# assumendo σ2 ignota

# Livello di significatività
alpha <- 0.05

# Valore critico della distribuzione t di Student
# qt(p, df) restituisce il quantile della t con df gradi di libertà
tcrit <- qt(1 - alpha/2, n - 1)   # df = n - 1 = 9

# Formula intervallo di confidenza:
# IC = media +/- tcrit * (sd / sqrt(n))
IC <- c(media - tcrit * sd_x / sqrt(n),
        media + tcrit * sd_x / sqrt(n))

IC 

# 4.2 
# Test di ipotesi H0: mu = 1000 vs H1: mu < 1000

# Statistica di test t per campione piccolo e sigma  sconosciuta:
# t = (media - mu0) / (sd / sqrt(n))

t_stat <- (media - 1000) / (sd_x / sqrt(n))
t_stat

# P-value per test unilaterale (mu < 1000)
# pt(t, df) restituisce la probabilità cumulativa della t con df gradi di libertà
p_value <- pt(t_stat, n - 1)
p_value  

# Il p-value (~0.026) è < 0.05, quindi rifiutiamo H0. 
# Possiamo affermare che la durata media
# delle batterie risulta significativamente inferiore a 1000 ore 
# con un livello di confidenza pari al 95%.

# Nota:
# L'intervallo di confidenza bilaterale include 1000, ma il test unilaterale rifiuta H0.
# Non è un controsenso: l'IC considera deviazioni sopra e sotto la media,
# mentre il test unilaterale guarda solo se la media è significativamente più bassa di 1000.

2* (1- pt(abs(t_stat), n - 1))
