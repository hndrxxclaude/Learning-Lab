# ESERCZIO 2
# Un’azienda produce componenti elettronici e ogni componente ha una probabilit`a del 2% di essere
# difettoso, indipendentemente dagli altri. Ogni giorno vengono prodotti 200 componenti.

n <- 200
p <- 0.02

# 2.1
# Definisci la variabile aleatoria adatta a modellare il numero di componenti difettosi prodotti
# in un giorno. Specifica la distribuzione e i suoi parametri.

# La variabile aleatoria X ~ Bin(n, p) con n = 200 e p = 0.02 
# SIccome n è grande (n >= 50) e p è piccolo (<= 0.1) si approssima
# X ~ Poisson(lambda) dove lambda = n * p = 200 * 0.02 = 4

# 2.2
# Qual `e il valore atteso e la deviazione standard del numero di componenti difettosi?

EX <- n * p
# Nella Poisson E[X] = lambda

lambda <- EX

# Deviazione standard per modello Binomiale

VarX <- n * p * (1 - p)
SdX <- sqrt(VarX)

# Con il modello di Poisson
VarXP <- lambda
SdXP <- sqrt(VarXP)

# 2.3
# Qual `e la probabilit`a che almeno 5 componenti risultino difettosi in un giorno?

1 - ppois(4, lambda)

# 2.4
# Qual `e la probabilit`a che esattamente 3 componenti risultino difettosi?

dpois(3, lambda)


# ESERCIZIO 4
# L’etichetta di una nota azienda produttrice di succhi di frutta riporta che l’ammontare di vitamina
# C contenuta in ogni confezione `e pari a 15 mg. Per valutare la veridicit`a di quanto dichiarato,
# un gruppo di ricercatori ha rilevato l’ammontare di vitamina C presente in un campione di 7
# confezioni; di seguito si riportano i valori rilevati:

x <- c(12.74,12.38,13.62,11.14,14.68,12.60,12.73)
n_campione <- length(x)
# Assumendo che l’ammontare di vitamina C sia distribuito normalmente con media µ e varianza
# σ2, il candidato:

# 4.1
# costruisca l’intervallo di confidenza per il parametro µ ad un livello fiduciario dello 0.99;

alpha <- 0.01

# per campione piccolo e varianza ignota uso una distribuzione T di student
# IC = X_bar +/- t_crit * SE dove
# X_bar è la media campionaria
X_bar <- mean(x)
# t_crit è il quantile della distribuzione che mi aiuta a creare l'IC
t_crit <- qt(1 - alpha / 2, df = n_campione- 1) # df = n - 1 gardi di libertà per la distribuzione T di student
# SE è l'errore standard = deviazione standard campionaria / sqrt(n)
sd_bar <- sd(x)

SE <- sd_bar / sqrt(n_campione)

IC <- c(X_bar - t_crit * SE,
        X_bar + t_crit * SE)
IC

# 4.2
# saggi il sistema d’ipotesi
# H0 : µ≥15
# H1 : µ<15
# attraverso il metodo del p-valore ad un livello di significativit`a α= 0.01.

mu_0 <- 15

t_oss <- (X_bar - mu_0) / SE

t_crit_test <- qt(alpha, df = n_campione - 1)

p_value <- pt(t_oss, df = n_campione - 1)
p_value
# rifiuto l'ipotesi nulla H0, dato che il p valore = 0.000986 < 0.01
# la probabilità di ottenere un valore così basso è molto bassa -> non può essere il caso
# il test di ipotesi ci dice con una confidenza del 99% che l'ammontare di Vitamina C 
# in ogni confezione è minore di 15mg


# ESERCIZIO 1
# Si consideri il dataset CO2, gi`a disponibile nel workspace di R (una descrizione `e accessibile tramite
# help(CO2)). Il dataset contiene misurazioni relative all’assorbimento di anidride carbonica da
# parte di diverse piante. In particolare, la variabile uptake indica la velocit`a di assorbimento di
# CO2 (espressa in µmol/m2/s), mentre conc rappresenta la concentrazione di CO2 somministrata,
# e Treatment identifica il tipo di trattamento a cui `e stata sottoposta la pianta.

data("CO2")

# 1.1 
# Analizzare la distribuzione della variabile uptake in termini di tendenza centrale,
# dispersione e forma. Produrre una rappresentazione grafica della distribuzione della 
# variabile e commentare eventuali elementi rilevanti.

summary(CO2$uptake)
# i valori di media(27.21) e mediana(28.3) suggeriscono una distribuzione caratterizzata
# da una leggera asimmetria negativa, dato che la prima è minore della seconda

var(CO2$uptake)
sd(CO2$uptake)

library(labstatR)

skew(CO2$uptake)
# l'indice di skewness(asimmetria) conferma la nostra supposizione di asimmetria negativa -> -0.106

boxplot(CO2$uptake, col = "orange")
# l'asimmetria negativa è vsiibile: la mediana (linea nera) è leggermente più vicina al terzo quartile
# che al primo e il baffo inferiore è di lunghezza maggiore rispetto al superiore

# 1.2
# Calcolare la media della variabile uptake per ciascun gruppo definito dalla variabile Treatment.
# Rappresentare graficamente il confronto tra le distribuzioni condizionate.

medie_up_T <- tapply(CO2$uptake,
                     CO2$Treatment,
                     mean)
medie_up_T
boxplot(uptake ~ Treatment,
        data = CO2,
        col = c("lightgreen", "lightcoral"))
# l'uptake per le piante con Trattamento nonchilled è mediamente maggiore di quelle con Trattamento
# chilled

# 1.3
# Esplorare la relazione tra le variabili conc e uptake, sia graficamente che mediante un 
# opportuno indice statistico. Discutere brevemente la natura della relazione osservata.

plot(CO2$conc, CO2$uptake,
     pch = 19, col = "blue")

# è presente una relazione tra le variabili, anche se sembra avere un andamento più logaritmico
# che lineare

cor(CO2$conc, CO2$uptake)
# il coefficeinte di correlazione di Pearson tra conc e uptake è di 0.485, suggerendo la
# presenza di una relazione tra le variabili anche se non molto forte (più vicino a 0 ceh a 1)
# ma è considerabile moderata

# Adattare un modello di regressione lineare tra le variabili conc e uptake, scegliendo
# opportunamente quale considerare come variabile esplicativa. Interpretare i coefficienti 
# del modello e valutare la bont`a dell’adattamento.

modello <- lm(uptake ~ conc, data = CO2)
summary(modello)
abline(modello, col = "red", lwd = 2)

# la variabile conc risulta significativa per la variabilità di uptake, con un p valore
# di 2.91 x 10^-6 <<< 0.05 ***. Per un aumento unitario di conc,
# uptake aumenta di 0.018.
# l'iintercetta rappresenta il valore che uptake avrebbe per conc = 0
# se la concentrazione di CO2 somministrata è 0, la velocità di assorbimento vale 19.5
# il coefficiente di bontà di adattamento R^2 vale 0.2354
# -> il modello spiega il 23.54% della variabilità di uptake:
# il nostro modello non è buono, in quanto spiega poco della variabilità, devono esserci
# altri fattori a contribuire


# 1.6
# Suddividere la variabile uptake in cinque classi utilizzando i seguenti percentili: 0%, 20%,
# 40%, 60%, 80% e 100%. Calcolare l’indice di eterogeneit`a di Gini per la variabile divisa in
# classi.

CO2$uptake_classi <- cut(CO2$uptake,
                         breaks = quantile(CO2$uptake, c(0, 0.2, 0.4, 0.6, 0.8, 1)),
                         include.lowest = TRUE)

tabella <- table(CO2$uptake_classi)
tabella_relative <- prop.table(tabella)
tabella_relative

# Gini = 1 - Sommatoria delle frequenze relative al quadrato

Gini <- 1 - sum(tabella_relative^2)
Gini

K <- 5
Gini_max <- (K - 1) / K

Gini_norm <- Gini / Gini_max
Gini_norm


# ESERCIZIO 3 (generato da gemini)
# Il dataset cats disponibile nel pacchetto MASS contiene misurazioni anatomiche su un 
# campione di gatti adulti. Si vuole analizzare il peso del cuore (Hwt, in grammi) 
# in funzione del sesso e della stazza dell'animale.
# Si definisca una nuova variabile Bwt_class ottenuta suddividendo la variabile Bwt 
# (peso corporeo in kg) in due classi di ampiezza uguale, etichettate come 
# "Leggero" e "Pesante". L'altro fattore da considerare è il sesso (Sex: F, M).

library(MASS)

data(cats)

minimo <- min(cats$Bwt)
massimo <- max(cats$Bwt)

punto_medio <- (minimo + massimo) / 2

cats$Bwt_class <- cut(cats$Bwt,
                      breaks = c(-Inf, punto_medio, Inf),
                      labels = c("Leggero", "Pesante"))

cats$Sex <- factor(cats$Sex)

# 3.1
# Calcolare le medie del peso del cuore (Hwt) per ciascun sesso, per ciascuna classe 
# di peso corporeo e per le loro interazioni.

library(tidyverse)

cats |>
  group_by(Sex) |>
  summarise(medie_cond = mean(Hwt))

cats |>
  group_by(Bwt_class) |>
  summarise(medie_cond = mean(Hwt))

cats |>
  group_by(Sex, Bwt_class) |>
  summarise(medie_cond = mean(Hwt))

# Costruire un grafico appropriato per visualizzare l'andamento del peso del cuore 
# in funzione del sesso e della classe di peso corporeo.

cats |>
  group_by(Sex, Bwt_class) |>
  summarise(medie_cond = mean(Hwt)) |>
  ggplot(aes(x = Bwt_class, y = medie_cond, col = Sex, group = Sex)) +
  geom_point() + geom_line() + theme_minimal()

# dato che le linee non sono parallele, il grafico suggerisce una possibile presenza di interazione
# tra le variabili Sex e Bwt_class

# 3.3
# Eseguire un'analisi della varianza (ANOVA) a due vie per verificare:
# l'effetto principale del sesso (Sex);
# l'effetto principale della classe di peso (Bwt_class);
# l'eventuale presenza di interazione tra i due fattori.
# Riportare la tabella ANOVA e commentare i risultati.

modello_aov <- aov(Hwt ~ Sex * Bwt_class, data = cats)
summary(modello_aov)

# ad essere significative solo le variabili Sex, con p_valore = 9.03 x 10^-11 <<< 0.05 ***
# e Bwt_class (p_valore = 2 x 10^-16 <<< 0.05 ***) 
# tuttavia l'interazione fra le due, al contrario di come supposto precedentemente,
# non risulta essere significativa per l'andamento di Hwt: essa ha p valore 
# = 0.0568 > 0.05

# 3.4
# Applicare il test di Tukey HSD se il modello evidenzia effetti significativi, 
# commentando quali gruppi specifici differiscono.

tukey <- TukeyHSD(modello_aov)
tukey
# il test di Tukey risulta ridonadante, dato che l'interazione non è significativa e 
# le 2 variabili hanno solo due metodi



