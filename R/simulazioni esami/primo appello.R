# ESERCIZIO 1
data("airquality")
dataset <- na.omit(airquality)
dataset

# 1.2 
n <- length(dataset$Ozone) # numero di osservazioni, valido per tutte le variabili
media_ozono <- mean(dataset$Ozone)
mediana_ozono <- median(dataset$Ozone)

summary(dataset$Ozone)

sd_ozono <- sd(dataset$Ozone)

media_ozono
mediana_ozono
sd_ozono

# noto subito che per quanto riguarda la variabile Ozone la media è molto più
# alta della mediana, suggerendo una distribuzione caratterizzata da una forte 
# asimmetria positiva

boxplot(dataset$Ozone, 
        col = "lightgreen")
# il boxplot lo conferma: il baffo superiore è molto più lungo di quello inferiore
# sono presenti outliers

skewness_ozono <- skew(dataset$Ozone)
skewness_ozono # indice di skewness pari a 1.25, confermando l'asimmetria positiva forte

cv_ozono <- (sd_ozono / media_ozono) * 100
cv_ozono
# il coefficiente di variazione della variabile Ozone è del 79%, un valore molto alto
# che ci dà informazioni sulla variabilità dei dati, che sembrano essere altamente variabili
# intorno alla media

media_solar <- mean(dataset$Solar.R)
mediana_solar <- median(dataset$Solar.R)

summary(dataset$Solar.R)

sd_solar <- sd(dataset$Solar.R)

media_solar
mediana_solar
sd_solar

# noto subito che per quanto riguarda la variabile Solar.R la media è più
# bassa della mediana, suggerendo una distribuzione caratterizzata da una asimmetria negativa

boxplot(dataset$Solar.R, 
        col = "lightcoral")
# il boxplot lo conferma: il baffo inferiore è più lungo di quello superiore
# non sono presenti outliers

skewness_solar <- skew(dataset$Solar.R)
skewness_solar # indice di skewness pari a -0.49, confermando l'asimmetria negativa

cv_solar <- (sd_solar / media_solar) * 100
cv_solar
# il coefficiente di variazione della variabile Solar.R è del 49%, un valore alto
# che ci dà informazioni sulla variabilità dei dati, che sembrano essere molto variabili
# intorno alla media

media_wind <- mean(dataset$Wind)
mediana_wind <- median(dataset$Wind)

summary(dataset$Wind)

sd_wind <- sd(dataset$Wind)

media_wind
mediana_wind
sd_wind

# noto subito che per quanto riguarda la variabile Wind la media è pressochè uguale
# alla mediana, suggerendo una distribuzione piuttosto simmetrica

boxplot(dataset$Wind, 
        col = "purple")
# il boxplot lo conferma: il baffo inferiore è della medesima lunghezza di quello superiore
# sono presenti outliers

skewness_wind <- skew(dataset$Wind)
skewness_wind # indice di skewness pari a 0.46

cv_wind <- (sd_wind / media_wind) * 100
cv_wind
# il coefficiente di variazione della variabile Wind è del 35%, un valore moderato
# che ci dà informazioni sulla variabilità dei dati, che sembrano essere moderatamente variabili
# intorno alla media

media_temp <- mean(dataset$Temp)
mediana_temp <- median(dataset$Temp)

summary(dataset$Temp)

sd_temp <- sd(dataset$Temp)

media_temp
mediana_temp
sd_temp

# noto subito che per quanto riguarda la variabile Temp la media è di poco più
# bassa della mediana, suggerendo una distribuzione sostanzialmente simmetrica

boxplot(dataset$Temp, 
        col = "lightgrey")
# il boxplot lo conferma: il baffo inferiore è di poco più lungo di quello inferiore
# non sono presenti outliers

skewness_temp <- skew(dataset$Temp)
skewness_temp # indice di skewness pari a -0.22, confermando la leggera asimmetria negativa

cv_temp <- (sd_temp / media_temp) * 100
cv_temp
# il coefficiente di variazione della variabile Temp è del 12%, un valore basso
# che ci dà informazioni sulla variabilità dei dati, che sembrano essere poco variabili
# intorno alla media

#la variabile che presenta una maggiore variabilitàquindi è Ozone, con un CV
# pari al 79%

# 1.3
media_cond <- tapply(dataset$Temp,
                     dataset$Month,
                     mean)
mediana_cond <- tapply(dataset$Temp,
                     dataset$Month,
                     median)
sd_cond <- tapply(dataset$Temp,
                     dataset$Month,
                     sd)

media_cond
mediana_cond
sd_cond

boxplot(Temp ~ Month,
        data = dataset,
        col = "blue")

# dai calcoli e dai grafici emerge che la temperatura media cresce dal mese 5 (maggio)
# al mese 8 (luglio) e dal mese 9(settembre) c'è un buon calo della temperatura
# l'unico mese che presenta un outlier è il mese di luglio (una giornata insolitamente fredda)
# come previsto in estate la temperatura media si alza e all'avvicinarsi dell'autunno inzia 
# ad abbassarsi

# 1.4 

# Creazione variabile binaria
dataset$ozono_alto <- ifelse(dataset$Ozone > mediana_ozono, 1, 0)
# Oppure
dataset$ozono_alto <- cut(dataset$Ozone, 
                          breaks = c(-Inf, mediana_ozono, Inf))
# Tabella di frequena doppia
tabella <- table(dataset$Month, dataset$ozono_alto)
tabella

# Distribuzione condizionata
tabella_relative <- prop.table(tabella)
tabella_relative

# sembra esserci una relazione tra il mese e l'ozono: nei mesi 5 e 9, la distribuzione
# di frequenza relativa è maggiore per il parametro 0 (inferiore alla mediana), mentre nei mesi
# 6,7,8 è l'opposto

# 1.5 

plot(Ozone ~ Wind,
     data = dataset,
     pch = 19, col = "blue")
modello <- lm(Ozone ~ Wind,
              data = dataset)

# già dal grafico è evidente una relazione tra la variabile ozone e Wind, che sembra avere
# un andamento lineare negativo

cor(dataset$Ozone, dataset$Wind)
# il coefficiente di correlazione di Pearson è di -0.61, confermando la presenza di una relazione
# lineare negativa abbastanza forte: in valore assoluto è più vicina all'1 che allo 0

modello <- lm(Ozone ~ Wind,
              data = dataset)
abline(modello, col = "red", lwd = 2)
# anche la retta rappresentante il modello aggiunto al grafico ci conferma l'analisi precedente

summary(modello)
# l'intercetta (99) ci dice che nel caso in cui wind sia 0 il valore di Ozone è 99,
# mentre il valore nella riga di wind ci dice che per un aumento unitario di wind Ozone 
# diminuisce di -5.73 
# il p_value invece è molto minore di 0.05, confermando la significatività statistica del coefficiente 
# di regressione
# il coeffciente di bontà di adattamen to R^2 vale 0.37 -> il modello spiega il 37% 
# della variabilità dei dati, ceh non è molto. altre variabili influenzano la variazione
# della variabile Ozone

# analisi dei residui
plot(modello)

# Residuals vs itted: è un grafico che serve a verificare l'ipotesis di linearità
# i punti dovrebbero essere distribuiti casualmente attorno alla bisettrice trattegiata
# non è questo il caso: possiamo riconoscere un pattern a U, che suggerisce un andamento
# quadratico piuttosto che lineare

# Normal Q-Q: serve a verificare l'ipotesi di normalità dei residui
# i punti dovrebbero giacere sulla linea tratteggiata
# nel nostro caso sembra esserci deviazione verso le code, soprattutto quella superiore

# Scale - Location: serve a verificare l'ipotesi di omoschedasticità degli errori, ossia
# di varianza costante. Dovremmo vedere un'andamento orizzontale della linea rossa
# e una distribuzione uniforme dei punti
# non sembra essere questo il caso. la linea rossa ha dei punti di curvatura e i punti sembrano
# seguire l'andamento della retta

# Residuals vs Leverage: serve a identificare outliers e punti influenti, che non sono presenti
# ion questo caso perchè nessuno supera la distanza di Cook (linee tratteggiate agli angoli)

nuovi_dati <- data.frame(Wind = 12)
predict(modello, newdata = nuovi_dati) # previsione di Ozone per Wind = 12 mph



# ESERCIZIO 3
data("warpbreaks")
library(tidyverse)

warpbreaks |>
  group_by(wool) |> 
  summarise(mean_cond = mean(breaks))

warpbreaks |>
  group_by(tension) |> 
  summarise(mean_cond = mean(breaks))

warpbreaks |>
  group_by(wool, tension) |> 
  summarise(mean_cond = mean(breaks)) |>
  ggplot(aes(x = wool, y = mean_cond, col = tension, group = tension)) +
  geom_point() + geom_line() + 
  theme_minimal() +
  labs(y = "Medie di breaks")

# dalle tabelle e dai grafici sembra esserci una relazione tra il tipo di lana e la tensione
# la lana di tipo A a bassa tensione si rompe molte volte (media 44.6), mentre a tensioni medie 
# e alte la media delle rotture è pressochè identica (24) e molto inferiore a quella a tensione bassa
# usando la lana B le medie sono identiche tra tensione bassa e media (circa 28, per la lana A avevano anche medie differenti)
# ed è decisamente più bassa per la tensione alta (19)

modello_anova <- aov(breaks ~ wool * tension, data = warpbreaks)
summary(modello_anova)
# i coefficienti ci dicono che la tensione è significativa per la variazione delle rotture,
# con un p_value basso (0.0006 << 0.05)
# la relazione tra tipo di lana e tensione risulta significativa ma non molto:
# il p_value è 0.02 < 0.05 *
# il tipo di lana invece non risulta significativo: il suo p_value è 0.06 > 0.05

tukey <- TukeyHSD(modello_anova)
tukey

# il test di tukey ci dice che ad essere significativa è la tensione bassa:
# le differenze di rotture tra tensione bassa con media e alta sono grandi e gli intervalli non contengono lo 0(p_value < 0.05)
# l'interazione è significativa solamente quando vi è la combinazine lana di tipo A e tensione bassa L
# come si può evincere dagli intervalli e i p_valori delle righe cella sezione di interazione 
# che terminano per - A:L


# ESERCIZIO 4

campione <- c(36.5, 37.2, 36.8, 37.5, 36.9, 37.0, 36.6, 36.7, 37.1, 36.4, 36.3, 36.8)

n <- length(campione)
media_campione <- mean(campione)
sigma2_campione <- var(campione)
sigma_campione <- sqrt(sigma2_campione)

sigma2 = 2 # varianza nota
mu_0 = 37
sigma = sqrt(sigma2) # deviazione standard nota

alpha <- 0.05 # livello di significatività

# Statistica test per campione che si assuma da Normale con varianza nota
# IC = media +/- Z_crit * (sd / sqrt(n))
# Z_test = (Xbar - mu_0) / (sd / sqrt(n))

SE <- sigma / sqrt(n)

Z_crit <- qnorm(1 - alpha/2)
Z_crit

IC <- c(media_campione - Z_crit * SE,
        media_campione + Z_crit * SE)
IC

Z_test <- (media_campione - mu_0) / SE
Z_test

p_valore <- pnorm(Z_test)
p_valore # p_valore 0.327 > 0.05 -> Non rifiuto H0

# varianza ignota

SE_t <- sigma_campione / sqrt(n)
df= n - 1

t_crit <- qt(1 - alpha/2, df)
t_crit

IC_t <- c(media_campione - t_crit * SE_t,
          media_campione + t_crit * SE_t)
IC_t

t_test <- (media_campione - 37) / SE_t
t_test

p_value <- pt(t_test, df)
p_value # p_value = 0.047 < 0.05 -> rifiuto ipotesi H0


