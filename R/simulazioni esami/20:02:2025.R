# ESERCIZIO 1
# Il dataset swiss di R riporta una misura standardizzata della fertilit`a (Fertility)
# e alcuni indicatori socio-economici per ciascuna delle 47 province francofone della 
# Svizzera intorno al 1888.

# 1.1
# Studiare la variabile Fertility in termini di indici di posizione, variabilit`a e forma. 
# Rappresentare graficamente la distribuzione della variabile mediante un istogramma, utilizzando
# come classi i seguenti quantili: 0.05, 0.1, 0.5, 0.6 e 0.9.

data("swiss")

n_swiss <- length(swiss$Fertility)
# Indici di posizione
media_fertility <- mean(swiss$Fertility)
mediana_fertility <- median(swiss$Fertility)
# Indici di variabilità 
var_fertility <- var(swiss$Fertility) * (n_swiss - 1) / n_swiss
# n - 1 perchè queste funzioni restituiscono
# gli indici campionari, ceh vanno moltiplicati per (n - 1) / n per essere standardizzati
sd_fertility <- sqrt(var_fertility)

# Potevo riassumere con:
summary(swiss$Fertility)
# media (70.14) pressochè identica alla mediana(70.4) -> potremmo aspettarci una distribuzione piuttosto 
# simmetrica
# range = Max(92.5) - Min(35)= 57.5
# Primo quartile = 64.7, Terzo Quartile = 78.45
var_fertility # varianza della variabile Fertility
sd_fertility # deviazione standard della variabile fertility
cv <- sd_fertility / media_fertility
cv # coefficiente di variazione CV = 0.18 -> 18% -> no ha una distribuzione parecchio variabile

# Indici di forma
library(labstatR)
skew(swiss$Fertility) # indice di skewness (asimmetria) = -0.47 -> indica un'asimmetria negativa
# della distribuzione -> mediana più vicina al terzo quartile che al primo

# rappresentzione grafica 
hist(swiss$Fertility, 
     breaks = quantile(swiss$Fertility, c(0, 0.05, 0.1, 0.5, 0.6, 0.9, 1)),
     include.lowest = TRUE,
     freq = FALSE)
# ho dovuto usare freq = FAlSE poichè avendo classi di ampiezze diverse ho bisogno di 
# rappresentare i dati graficamente in base alla densità (numero di province per unità di fertility)
# l'altezza della barra mi dice quindi quanto è probabile trovare una città in quell'intervallo

# 2.2
# Categorizzare la variabile Education in 4 categorie a vostra scelta. Calcolare le medie 
# condizionate della variabile Catholic in base ai gruppi definiti dalla variabile 
# Education divisa in classi e commentare le differenze.

df <- swiss
df$Education <- cut(df$Education, breaks = quantile(df$Education,c(0, 0.25, 0.5, 0.75, 1)),
                    include.lowest = TRUE,
                    labels = c("Low", "Decent", "Good", "Excellent"))

medie_Catholic <- tapply(df$Catholic,
                         df$Education,
                         mean)
medie_Catholic
# le province con una minore istruzione sembrano avere una percentuale di Cattolici 
# maggiore rispetto a quelle con livelli di istruzione maggiori.
# All'aumentare del livello d'istruzione nelle province sembra esserci una relazione lineare 
# negativa con la percentuale di Cattolici. Questa relazione però non sembra essere perfettamente lineare
#dato che c'è un aumeto di cattolici da un Buon livello di istruzione a uno Eccellente.

# 2.3 e 2.4
# Analizzare la relazione lineare tra la variabile Fertility (fertilit`a) delle 47 province e la
# percentuale di maschi coinvolti nell’agricoltura come occupazione (Agriculture). Calcolare
# il coefficiente di correlazione di Pearson e discuterne la forza e la direzione della relazione.
# Rappresentare graficamente la retta di regressione tra Fertility e Agriculture, commentare
# la bont`a dell’adattamento del modello e calcolare il valore di fertilit`a atteso per
# una provincia con una percentuale di uomini impegnati nell’agricoltura pari al 50%.

modello_swiss <- lm(Fertility ~ Agriculture, data = swiss)
summary(modello_swiss)
# la relazione tra fertilità e percentuale di maschi è significativa, ma non eccessivamente:
# p_value = 0.015 < 0.05 *. Per un aumento unitario della percentuale di maschi la fertilità
# aumenta di 0.19. In questo caso l'intercetta ha un significato realistico:
# 60.3 rappresenta il valore della fertilità per una percentuale di maschi nell'Agricoltura = 0%
# il coefficiente di bontà di adattamento R^2 di 0.125 ci dice però che il modello non è per niente
# buono per spiegare la variabilità della variabile fertility, spiegandone solo il 12,5%
# sicuramente qualche altra variabile influisce maggiormente

cor(swiss$Fertility, swiss$Agriculture)
# il coefficiente di correlazione di Pearson = 0.35 conferma la relazione lineare positiva
# tra le due variabili e anche la debolezza di tale relazione:
# 0.35 è molto più vicino allo 0 che a 1

plot(Fertility ~ Agriculture,
     data = swiss,
     pch = 19, col = "blue",
     main = "Scatterplot Fertility ~ Agriculture")
abline(modello_swiss, col = "red", lwd = 2)

nuovi_dati <- data.frame(Agriculture = 50.0)
valore_atteso <- predict(modello_swiss, newdata = nuovi_dati)
valore_atteso
# valore di fertilità atteso per provincia con percentuale di uomini nell'agricoltura = 50%:
# 70.01

# ESERCIZIO 4
# Un gruppo di ricercatori ritiene che l’ammontare di CO2 (anidride carbonica), 
# emesso da un nuovo modello di auto, possa essere descritto tramite una variabile aleatoria 
# X distribuita normalmente. La casa produttrice dichiara che la quantit`a media di emissioni 
# di CO2 `e uguale a 100g/km e un’associazione di ambientalisti decide di sottoporre a 
# verifica quanto dichiarato. A tal fine, viene estratto un campione casuale semplice di 
# ampiezza dieci la cui realizzazione campionaria `e di seguito riportata:

x <- c(96.95,99.86,99.09,102.46,96.79,102.23,100.89,96.43,99.79,99.50)

# 4.1
# l candidato costruisca gli intervalli di confidenza per il parametro µ della distribuzione 
# normale ad un livello fiduciario dello 0.95;

# avendo un campione piccolo e varianza ignota devo utilizzare una distribuzione T di student

n <- length(x)
X_bar <- mean(x)
S2 <- var(x)
S <- sd(x)

alpha <- 0.05

# costruisco un intervallo di confidenza bilaterale, lasciado il 2.5% di probabilità sotto
# le code della distribuzione
# IC = X_bar +/- t_crit * SE
# tcrit = qt(1 - alpha / 2, df) df = n - 1 gradi di libertà 
# SE = S / sqrt(n)

df <- n - 1
t_crit <- qt(1 - alpha / 2, df)
SE <- S / sqrt(n)

IC <- c(X_bar - t_crit * SE,
        X_bar + t_crit * SE)
IC
# intervallo di confideenza alpha = 0.05 -> [97.86, 100.94]

# 4.2
# l candidato utilizzi il metodo del valore critico per saggiare il seguente sistema d’ipotesi
# statistiche
# H0 : µ= 100
# H1 : µ>100
# ad un livello di significativit`a α= 0.01;

mu_0 <- 100

alpha_test <- 0.01

t_obs <- (X_bar - mu_0) / SE

t_crit_test <- qt(1 - alpha_test, df) # 1 - alpha anzichè 1 - alpha / 2 perchè il test è unilaterale 
# destro anzichè bilaterale: tutta la probabilità sotto la coda destra

t_obs
t_crit_test
# il t_obs (-0.88) <<< del t_crit_test(2.82) -> non rifiuto l'ipotesi nulla H0
# non ho dati sufficienti per dimostrare e sostenere che la quantità media di emissioni
# sia maggiore a 100g/km con una confidenza del 99%

p_value <- 1 - pt(t_obs, df)
p_value
# anche il p_value mi conferma il non rifiuto dell'ipotesi nulla H0, essendo di 0.8 >>> 0.01
X_bar
# dovuto al fatto che voglio dimostrare che la media sia maggiore di 100 quando la mia media 
# è minore(99.4)

# 4.3
# assumendo che σ2 = 4, il candidato utilizzi il metodo del p-valore per saggiare il precedente
# sistema d’ipotesi statistiche ad un livello di significativit`a α= 0.01.

sigma2 <- 4
sigma <- 2

# con varianza nota la variabile X ~ N(mu, sigma2)

SE_N <- sigma / sqrt(n)

Z_obs <- (X_bar - mu_0) / SE_N

Z_crit <- qnorm(1 - alpha_test)

Z_obs
Z_crit

p_value_norm <- 1 - pnorm(Z_obs)
p_value_norm
# stesso ragionamento di prima: p_value = 0.82 >>> 0.01 -> non rifiuto l'ipotesi nulla H0

# ESERCIZIO 3 (generato da Gemini)
# Il dataset cabbages, disponibile nel pacchetto MASS in R, contiene dati relativi 
# a un esperimento agricolo sulla coltivazione di cavoli. Si consideri come variabile 
# risposta il peso della testa del cavolo (HeadWt). L'esperimento considera due fattori:
# Cult: la cultivar del cavolo (c39, c52).
# Date: la data di piantumazione (d16, d20, d21).
# Si richiede di:

library(MASS)
data(cabbages)

# 3.1
# Calcolare le medie del peso (HeadWt) per ciascuna cultivar, per ciascuna data di 
# piantumazione e per le interazioni tra i due fattori.

library(tidyverse)

cabbages |>
  group_by(Cult) |>
  summarise(medie_cond = mean(HeadWt))

cabbages |>
  group_by(Date) |>
  summarise(medie_cond = mean(HeadWt))

cabbages |>
  group_by(Cult, Date) |>
  summarise(medie_cond = mean(HeadWt))


# 3.2
# Costruire un grafico delle medie (interaction plot) o dei boxplot per visualizzare 
# l'andamento del peso in funzione della data e della cultivar, 
# evidenziando potenziali interazioni.

cabbages |>
  group_by(Cult, Date) |>
  summarise(medie_cond = mean(HeadWt)) |>
  ggplot(aes(x = Date, y = medie_cond, col = Cult, group = Cult)) +
  geom_point() + geom_line() + theme_minimal()

# dal grafico si evincono delle fortissime interazioni tra la data di piatumazione e la cultivar
# che influenzano l'andamento del peso medio:
# i cavoli piantati in d16 hanno la media di peso più alta di tutte se hanno cultivar c39,
# mentre hanno la seconda media più bassa se hanno c52.
# al contrario, quando sono piantate in d20, se hanno c52 hanno la seconda media più alta, 
# mentre quelle con c39 hanno una media leggermente minore.
# in d21 l'interazione si verifica di nuovo: c39 ha una media di peso di gran lunga maggiore 
# di c52, che ha la media minore registrata.

# 3.3
# Eseguire un'analisi della varianza (ANOVA) a due vie per verificare:
# l'effetto principale della cultivar (Cult);
# l'effetto principale della data (Date);
# l'eventuale presenza di interazione tra cultivar e data.
# Riportare la tabella ANOVA completa e commentare dettagliatamente le conclusioni
# statistiche al livello di significatività α=0.05.

modello_aov <- aov(HeadWt ~ Cult * Date, data = cabbages)
summary(modello_aov)

# come ci aspettavamo sia la cultivar, che la data di piantumazione, che la loro interazione
# sono significative per l'andamento del peso della testa del cavolo:
# per Cult il p_value = 0.00085 << 0.05 *** indica che è significativa
# per Date il p_value = 0.0008 << 0.05 *** indica che è significativa
# per l'interazione il p_value = 0.001 < 0.05 ** indica che è significativa (non quanto le singole 
# variabili, ma conferma la significatività dell'interazione fra di esse)

# 3.4
# Qualora il modello evidenzi significatività, applicare il test di Tukey HSD per 
# i confronti multipli, identificando le differenze significative tra i gruppi.

tukey <- TukeyHSD(modello_aov)
tukey

# Gran parte dei confronti mostrano differenze significative tra i gruppi:
# In particolare: cavoli con c52 hanno la testa che pesa di meno dei c39
# cavoli piantumati in d21 pesano meno di cavoli piantati in d16 o d20
# Tuttavia l'interazione tra le due variabili fa si che la relazione delle cultivar
# si inverta in d20, ma senza creare una differenza significativa tra i pesi delle 2 cultivar (solo 0.31 di diff)

