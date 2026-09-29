
# ESERCIZIO 1                                        

# 1.1 
# Studiare la distribuzione della variabile mpg (consumo) 
# calcolando indici di posizione, variabilità e forma.
# Rappresentare graficamente
# la distribuzione mediante un grafico appropriato
# e commentare le principali caratteristiche osservate.

data(mtcars)
n <- length(mtcars$mpg)
media_mpg   <- mean(mtcars$mpg)
mediana_mpg <- median(mtcars$mpg)

summary(mtcars$mpg)
# La media è leggermente maggiore della mediana, 
# indicando una possibile lieve asimmetria positiva della distribuzione del consumo

var_mpg     <- var(mtcars$mpg) * (n-1) / n
sd_mpg      <- sqrt(var_mpg)
cv_mpg      <- sd_mpg / media_mpg * 100

# Il coefficiente di variazione pari a circa 29.5% indica una variabilità moderata  
# del consumo rispetto al valore medio.


library(labstatR)
sk_mpg      <- skew(mtcars$mpg)
sk_mpg


# L’indice di asimmetria pari a 0.64 indica una asimmetria positiva lieve della distribuzione del consumo 
# Il risultato è coerente con il fatto che la media risulta leggermente superiore alla mediana.


boxplot(mtcars$mpg, 
        col = "lightgreen",
        main = "Boxplot mpg")


# Dal boxplot non emergono outliers, il baffo superiore risulta più lungo di quello inferiore,
# coerente con l’asimmetria positiva osservata.


# 1.2
#Confrontare le distribuzioni del consumo 
# condizionatamente al tipo di trasmissione,
# utilizzando un grafico appropriato. 
# Calcolare le medie condizionate 
# e confrontare la variabilità tra i due gruppi.

table(mtcars$am)

boxplot(mpg ~ am, 
        data = mtcars,
        col = c("lightcoral", "lightblue"),
        main = "mpg per tipo di trasmissione",
        ylab = "mpg")


# Dal boxplot si osserva che le automobili con am pari 1 (trasmissione manuale) 
# presentano valori di consumo (mpg) mediamente più elevati rispetto a quelle con am = 0 (automatiche).
#  Non si evidenziano outlier evidenti in nessuno dei due gruppi.

tapply(mtcars$mpg,
       mtcars$am,
       mean)


# Coerentemente con quanto osservato nel boxplot, la media del consumo delle automobili 
# con am = 1 (24.39 mpg) risulta sensibilmente più elevata rispetto
# a quella con am = 0  automatiche (17.15 mpg) confermando una maggiore efficienza media delle auto manuali.

?cv

cv_corretto <- function(x){
  n <- length(x)
  sd_x <- sqrt(var(x) * (n-1)/n)
  cv <-  sd_x / mean(x)
  cv
}
tapply(mtcars$mpg,
       mtcars$am, 
       var)


tapply(mtcars$mpg,
       mtcars$am, 
       cv_corretto)


#Per confrontare la variabilità tra i due gruppi di auto,
# dato che le medie sono diverse, si utilizza un indice relativo come il coefficiente di variazione 
#Il CV risulta pari a 0.22 per le auto automatiche (am = 0) e 0.24 per le auto manuali (am = 1), 
# indicando che la variabilità relativa del consumo è leggermente maggiore per le auto manuali,
# pur rimanendo abbastanza simile tra i due gruppi.


# 1.3 
#Creare una nuova variabile categoriale peso_cat dividendo la variabile wt (peso) in tre classi
# di pari numerosità.
# Costruire una tabella di frequenza doppia 
# tra peso_cat e cyl (numero di cilindri) 
# e commentare l’eventuale associazione tra le due variabili.

mtcars$peso_cat <- cut(mtcars$wt,
                       breaks = quantile(mtcars$wt, 
                                         c(0,1/3,2/3,1)),
                       include.lowest = TRUE)

table(mtcars$peso_cat, 
      useNA = "always")




tabella <- table(mtcars$peso_cat,
                 mtcars$cyl)
tabella

# Dalla tabella emerge una chiara associazione tra il peso dell’auto e il numero di cilindri. 
# Le auto più leggere hanno principalmente 4 cilindri
# quelle di peso medio hanno soprattutto 6 o 8 cilindri, 
# mentre le auto più pesanti ((3.5,5.42]) sono quasi tutte 8 cilindri. 
# Questo indica che all’aumentare del peso aumenta anche il numero di cilindri.


# 1.4 
# Analizzare la relazione lineare tra il consumo (mpg) e il peso (wt) delle automobili:
# • Rappresentare i dati con un diagramma di dispersione.
# • Calcolare il coefficiente di correlazione di Pearson e commentarne il valore.
# • Adattare un modello di regressione lineare semplice,
#   interpretare i coefficienti stimati e valutarne la significativit`a statistica.
# • Commentare la bontà di adattamento del modello e prevedere il consumo atteso per
#un’automobile che pesa 3 migliaia di libbre

plot(mtcars$wt,
     mtcars$mpg, 
     pch = 19, col = "blue",
     xlab = "Peso (1000 lbs)", ylab = "mpg",
     main = "Relazione mpg ~ wt")

#Il diagramma di dispersione mostra una chiara relazione negativa tra il peso e il consumo: 
# all’aumentare del peso, il consumo (mpg) diminuisce.


cor(mtcars$mpg, mtcars$wt)

# Il coefficiente di correlazione di Pearson è circa -0.87, 
# confermando la forte correlazione negativa (lineare) tra peso e consumo: auto più pesanti consumano meno.


mod <- lm(mpg ~ wt, data = mtcars)
abline(mod, col = "red", lwd = 2) 

summary(mod)

# Il modello di regressione lineare mostra una relazione negativa e statisticamente significativa
# tra il peso dell’auto (wt) e il consumo (mpg). Il coefficiente di wt (-5.34) indica che,
# mediamente, un aumento di 1000 libbre comporta una riduzione di circa 5.34 mpg,
# con un p-value estremamente basso che conferma la significatività del coefficiente di regressione
# L’intercetta (37.29) rappresenta il consumo medio per un’auto di peso zero, ( in questo caso senza significato pratico)
# La bontà di adattamento, con R² pari a 0.75, indica che il modello spiega gran parte della variabilità
# del consumo, confermando che wt è un predittore rilevante 
# e che la regressione lineare descrive adeguatamente la relazione osservata.


plot(mod)

predict(mod, 
        newdata = data.frame(wt = 3),
        interval = "confidence", level = 0.95)


# ESERCIZIO 2                                        

# VEDI PDF


#  ESERCIZIO 3                                        

data(ToothGrowth)
library(tidyverse)



# 1.1 e 1.2


mean(ToothGrowth$len)


ToothGrowth |> 
  group_by(supp) |> 
  summarise(medie_cond = mean(len))

boxplot(len ~ supp, 
        data = ToothGrowth, 
        col = c("lightblue"))

#In media, i porcellini che hanno ricevuto vitamina C tramite succo d’arancia hanno denti più lunghi 
# rispetto a quelli che hanno ricevuto acido ascorbico, senza considerare la dose.

ToothGrowth |> 
  group_by(dose) |> 
  summarise(medie_cond = mean(len))

boxplot(len ~ dose,
        data = ToothGrowth, col = "lightcoral")

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


# Interaction plot
ToothGrowth |> 
  group_by(supp, dose) |> 
  summarise(medie_cond = mean(len)) |> 
ggplot(aes(x = dose, y =  medie_cond, color=supp  )) + 
  geom_point() + geom_line() +
  theme_minimal() +
  labs(y = "Media di len")


# 1.3 Eseguire un’analisi della varianza (ANOVA) a due vie

# Trasformo supp e dose in fattori
ToothGrowth$supp <- factor(ToothGrowth$supp)
ToothGrowth$dose <- factor(ToothGrowth$dose)


anova_mod <- aov(len ~ supp * dose, data = ToothGrowth)
summary(anova_mod)


# L’ANOVA a due vie mostra che sia il tipo di supplemento (supp, p = 0.000894)
# sia la dose (dose, p < 2e-16) hanno un effetto significativo sulla lunghezza dei denti.
# Anche l’interazione tra supplemento e dose è significativa (p = 0.0246), 
# indicando che l’effetto della dose dipende dal tipo di supplemento. 
# Concludiamo che sia gli effetti principali sia l’interazione 
# influenzano significativamente la crescita dei denti.

tukey <- TukeyHSD(anova_mod, c("supp","dose"))
tukey

par(mfrow=c(2,1))
plot(tukey)


# Tutti i confronti mostrano differenze significative tra i gruppi:
# ogni media è diversa dalle altre. In particolare, i 
# porcellini trattati con VC hanno denti più corti 
# rispetto a quelli con succo d’arancia, e le 
# lunghezze dei denti aumentano progressivamente con la dose di vitamina C.


#  ESERCIZIO 4                        


# Campione di osservazioni 
x <- c(992, 1003, 995, 987, 1001, 998, 990, 996, 1005, 991)

# Numero di osservazioni
n <- length(x)        

# Media campionaria
media <- mean(x)      

# Deviazione standard campionaria
sd_x <- sd(x)       


# 1.2) Intervallo di confidenza al 95% per la media considerando sigma ignoto


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


# 1.3) Test di ipotesi H0: mu = 1000 vs H1: mu < 1000


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


