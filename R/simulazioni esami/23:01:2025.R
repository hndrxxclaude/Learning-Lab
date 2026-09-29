# ESERCIZIO 1
# 1.1
data(pressure)

# Indici di posizione
media_temp <- mean(pressure$temperature)
media_press <- mean(pressure$pressure)
mediana_temp <- median(pressure$temperature)
mediana_press <- median(pressure$pressure)

# Indici di variabilità
var_temp <- var(pressure$temperature)
var_press <- var(pressure$pressure)
sd_temp <- sd(pressure$temperature)
sd_press <- sd(pressure$pressure)
cv_temp <- sd_temp / media_temp
cv_press <- sd_press / media_press

# Indici di asimmetria
library(labstatR)
skewness_temp <- skew(pressure$temperature)
skewness_press <- skew(pressure$pressure)

# 1.2
summary(pressure$pressure)

# Dividiamo i dati nelle 4 classi che hai definito
gruppi <- cut(pressure$pressure, 
              breaks = c(0.0002, 0.1800 , 8.8000, 126.5000, 806.0000), 
              include.lowest = TRUE)

# Facciamo un grafico a barre del conteggio
plot(gruppi, col = "lightgreen", main = "Conteggio per Quartile")


# 1.3 

Range = (max(pressure$pressure) + min(pressure$pressure)) / 2
pressure$pressure_classi <- cut(pressure$pressure, breaks = c(-Inf, Range, Inf),
                                include.lowest = TRUE,
                                labels = c("Inferiore", "Superiore"))

boxplot(temperature ~ pressure_classi,
        data = pressure,
        col = c("lightblue", "orange"))

# 1.4

plot(pressure$temperature, pressure$pressure,
     pch = 19, col = "blue")
# dal grafico di dispersione emerge chiaramente che c'è una relazione molto forte tra pressione e temperatura
# ma che non è di tipo lineare, bensì esponenziale

cor(pressure$temperature, pressure$pressure)
# il coefficiente di correlazione di Pearson di 0.76 conferma la forte relazione positiva 
# tra le 2 variabili (molto più vicino ad 1 che a 0)

# 1.5

modello <- lm(pressure ~ temperature, 
              data = pressure)
abline(modello, col = "red", lwd = 2)

summary(modello)
# come potevamo immaginare la temperatura è significativa per descrivere l'andamento della pressione
# con un p_value = 0.0002 << 0.05 ***
# per un aumento unitario della temperatura (1 grado Celsius) la pressione del vapore saturo aumenta di 1.51
# mm di mercurio.
# l'intercetta non ha un significato reale in questo caso. Per una temperatura di 0 gradi 
# Celsius si ha una pressione di -147 mm (che non ha un significato fisico visto che la pressione
# non può essere negativa)
# il modello ha un coefficiente di bontà di adattamento R^2 di 0.574 -> spiega il 57.4%
# della variabilità della pressione, un valore discreto ma che non può essere considerato buono (< del 70%)
# devono esserci altre varibili a contribuire alla variazione della pressione

# ESERCIZIO 4
# Dato un’azienda che produce pasta da 500 grammi, un team ha preso un tot
# di campioni e li ha pesati. Verificare che l’indice di affidabilità sia del 95%

x <-  c(504.26, 502.76, 499.84, 503.26, 502.45, 493.50, 501.50, 501.71, 493.94,
     500.48)

n <- length(x)
X_bar <- mean(x)
S2 <- var(x)
S <- sd(x)

# Intervallo di confidenza

SE <- S / sqrt(n)

alpha <- 0.05

t_crit <- qt(1 - alpha / 2, n - 1)

IC <- c(X_bar - t_crit * SE,
        X_bar + t_crit * SE)
IC

# Test d'ipotesi

mu_0 <- 500

t_obs <- (X_bar - mu_0) / SE

t_crit_test <- qt(alpha, n - 1) # n - 1 gradi di libertà per la distribuzione T di student, varianza ignota

t_obs
t_crit_test

# t_obs = 0.31 > t_crit_test = -1.83 -> non rifiuto l'ipotesi nulla H0.
# Non ci sono dati sufficienti a sostenere che la media sia inferiore a 500 e lo possiamo
# dire con una confidenza del 95%

p_value <- pt(t_obs, n - 1)
p_value
# anche il p_value altissimo di 0.62 ce lo conferma. Era prevedibile visto che la media campionaria stessa
# è maggiore di mu_0

# ESERCIZIO 3 (generato da gemini)
# Si consideri il dataset birthwt presente nel pacchetto MASS. Si vuole analizzare
# il peso del neonato alla nascita (bwt, in grammi) in funzione delle abitudini della madre.
# Si definisca una nuova variabile age_class ottenuta suddividendo la variabile age 
# (età della madre) in due classi utilizzando la mediana come soglia:
# "Young" (≤ mediana) e "Mature" (> mediana).
# Si consideri inoltre il fattore smoke (fumatrice: 0 = No, 1 = Sì).
# Si richiede di:

data("birthwt")

mediana_age <- median(birthwt$age)

df <- birthwt
df$age_class <- cut(df$age, breaks = c(-Inf, mediana_age, Inf),
                    include.lowest = TRUE,
                    labels = c("Young", "Mature"))
df$smoke <- factor(df$smoke)

# 3.1 e 3.2
# Calcolare le medie del peso alla nascita (bwt) per ciascun livello di smoke, 
# per ciascuna classe di età (age_class) e per le loro interazioni. 

library(tidyverse)

medie_smoke <- df |>
  group_by(smoke) |>
  summarise(medie_cond = mean(bwt))

medie_age_class <- df |>
  group_by(age_class) |>
  summarise(medie_cond = mean(bwt))

df |>
  group_by(smoke, age_class) |>
  summarise(medie_cond = mean(bwt))

boxplot(bwt ~ smoke * age_class,
        data = df)
# dal boxplot è evidente che la media del peso dei neonati è minore nelle donne mature rispetto 
# a quelle giovani e tra quelle non fumatrici e quelle fumatrici

# 3.3
# Eseguire un'analisi della varianza (ANOVA) a due vie per verificare:
# l'effetto principale dello status di fumatrice (smoke);
# l'effetto principale della classe di età (age_class);
# l'eventuale presenza di interazione tra fumo ed età.
# Riportare la tabella ANOVA completa e commentare i risultati 
# (p-value e significatività) al livello α=0.05.

modello_aov <- aov(bwt ~ smoke * age_class, data = df)
summary(modello_aov)

# ad essere significativa risulta solo la variabile smoke P_value = 0.009 < 0.05 **
# interazione e age_class non risultano significative per l'andamento della variabile bwt 
# con p valori maggiori a 0.05

# 3.4
tukey <- TukeyHSD(modello_aov)
tukey

# l'unico gruppo con differenze significative è quello di smoke da 0 a 1