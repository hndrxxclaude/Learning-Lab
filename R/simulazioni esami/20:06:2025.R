# ESERCIZIO 1
# Il dataset rock contiene dati relativi a 48 campioni di rocce petrolifere, per ciascuno dei quali sono
# state rilevate la permeabilit`a (perm, in millidarcy), la area totale dei pori (area, in pixel²) e
# il perimetro totale dei pori (peri, in pixel).

# 1.1
# Esplorare graficamente le tre variabili. Commentare le principali caratteristiche 
# delle distribuzioni.

data(rock)

summary(rock$perm)
boxplot(rock$perm,
        col = "lightgreen")
# come possiamo vedere dai dati e dal grafico, per la variabile perm la media è decisamente 
# molto più alta della mediana. La permeabilità in media è di 415.45 millidarcy contro 
# i 130.5 della mediana. Deduciamo, grazie anche al boxplot, che la distribuzione
# sarà caratterizzat ada una forte asimmetria positiva. Infatti la mediana (linea nera)
# è molto più vicina al primo quartile che al terzo, e il baffo superiore e di gran lunga più
# lungo di quello inferiore
library(labstatR)
skew(rock$perm)
# abbiamo la conferma dell'indice di skewness di 0.72 a sostenere le nostre considerazioni

summary(rock$area)
boxplot(rock$area,
        col = "lightcoral")
skew(rock$area)

# per quanto riguarda la variabile area, guardando i valori di media (7188) e mediana (7487)
# ci aspettiamo una distribuzione caratterizzata da una leggera asimmetria negativa
# guardando il boxplot possiamo confermare la nostra ipotesi: la mediana è più vicina
# al terzo quartile che al primo e il baffo inferiore è più lungo di quello superiore
# L'indice di skewness di -0.3 conferma le nostre supposizioni

summary(rock$peri)
boxplot(rock$peri,
        col = "purple")
skew(rock$peri)

# guardando i dati per la variabile peri, possiamo affermare che il perimetro totale dei pori
# potrebbe avere una distribuzione caratterizzata da una leggera asimmetria positiva:
# la media (2682.2 pixel) è di poco maggiore della mediana (2536.2 pixel) 
# guardando il boxplot la mediana è di poco più vicina al primo che al terzo quartile,
# che insieme all'uguale lunghezza dei baffi suggerisce una distribuzione sostanzialmente simmetrica
# l'indice di skewness è molto vicino allo 0: 0.025 -> possiamo considerare la distribuzione
# sostanzialmente simmetrica

# 1.2
# Calcolare, per ciascuna variabile, alcuni indici di posizione, variabilit`a e forma. Quale 
# variabile mostra maggiore variabilit`a? Commentare.

media_perm <- mean(rock$perm)
var_perm <- var(rock$perm)
sd_perm <- sqrt(var_perm)

media_area <- mean(rock$area)
var_area <- var(rock$area)
sd_area <- sd(rock$area)

media_peri <- mean(rock$peri)
var_peri <- var(rock$peri)
sd_peri <- sd(rock$peri)

# Per confrontare la variabilità di queste tre variabili che hanno medie radicalmente diverse
# devo utilizzare un indice che standardizzi la variabilità delle variabili per poterle confrontare
# come il coefficiente di variazione CV = deviazione standard / media

cv_perm <- sd_perm / media_perm * 100
cv_area <- sd_area / media_area * 100
cv_peri <- sd_peri / media_peri * 100

cv_perm
cv_area
cv_peri

# La variabile perm mostra la maggiore variabilità relativa.
# Il suo CV superiore al 105% (contro il 37% per l'area e il 53% per il perimetro) 
# indica una dispersione estrema, 
# dove lo scarto quadratico medio supera il valore della media stessa, 
# confermando la forte asimmetria positiva rilevata graficamente.

# 1.3
# Calcolare le correlazioni tra le variabili e commentare i risultati. 
# Quali relazioni appaiono pi`u forti?

# uso la funzione cor che mi restituisce il coefficiente di correlazione di Pearson tra due variabili

cor(rock$perm, rock$area)
cor(rock$perm, rock$peri)
cor(rock$area, rock$peri)

# la relazione più forte in assoluto è quella tra la variabile area e quella perimetro (era abbastanza
# prevedibile). Confrontando i coefficienti di correlazione di Pearson in valore assoluto
# la loro correlazione è di 0.823, moltonpiù vicina a 1 di quanto non sia quella
# perm ~ peri (0.74, anch'esso molto alto) o quella area ~ perm (0.4, abbastanza debole)

# 1.4 e 1.5
# In base ai risultati ottenuti al punto precedente, stimare un modello di regressione lineare
# semplice in cui la variabile dipendente `e la perm.
# Valutare la significativit`a dei coefficienti stimati e la bont`a dell’adattamento del modello. Il
# modello stimato `e soddisfacente?

modello_perm <- lm(perm ~ peri,
                   data = rock)
summary(modello_perm)

# come possiamo notare, il modello di regressione lineare ci dice che la correlazione tra
# la permeabilità delle pietre e il perimetro dei pori è significativa, come indicato
# dal p_value dell'ordine di 10^-9 <<< 0.05 ***. Per un aumento unitario del perimetro
# dei pori la permeabilità diminuisce di -0.22591 millidarcy.
# In questo caso l'intercetta on ha un significato reale vero e proprio:
# per una pietra con perimetro dei pori = 0 pixel la permeabilità varrebbe
# 1021.38 millidarcy, ma tuttavia questa considerazione non ha un senso logico
# il coefficiente di bontà di adattamento R^2 è di 0.54 -> il modello spiega il 54%
# della variabilità, una percentuale discreta ma non soddisfacente. Deve esserci
# qualche altra variabile a influenzare la variabilità della permeabilità

# 1.6
# Utilizzare il modello stimato per prevedere il valore della variabile perm per un’osservazione
# che presenta un valore della variabile indipendente pari all’87-esimo percentile della sua
# distribuzione. Indicare chiaramente il valore usato e il risultato della previsione.

# Calcolo dell'87-esimo percentile della variabile indipendente (peri)
valore_peri_87 <- quantile(rock$peri, probs = 0.87)
valore_peri_87

# Previsione utilizzando il modello lineare
# Nota: predict() vuole un data.frame con i nomi delle colonne identici a quelli usati nel modello
nuovi_dati <- data.frame(peri = valore_peri_87)

previsione_perm <- predict(modello_perm, newdata = nuovi_dati)
previsione_perm

# Il valore dell'87-esimo percentile della variabile peri è di circa 4352.3 pixel.
# Utilizzando il modello stimato, la permeabilità prevista per una roccia con tale
# perimetro dei pori è di circa 38.2 millidarcy.
# Notiamo che, essendo il coefficiente angolare negativo (-0.22), ad un valore alto
# di perimetro (87-esimo percentile) corrisponde una permeabilità prevista molto bassa,
# coerente con la correlazione inversa rilevata.


# Plot base
plot(rock$peri, rock$perm,
     pch = 19, col = "gray",
     xlab = "Perimetro (pixel)", ylab = "Permeabilità (millidarcy)",
     main = "Regressione Lineare: Perm ~ Peri")

# Aggiunta della retta di regressione
abline(modello_perm, col = "darkblue", lwd = 2)

# Aggiunta del punto previsto (Punto Rosso)
points(valore_peri_87, previsione_perm, col = "red", pch = 19, cex = 1.5)



# ESERCIZIO 4
# Un’azienda produttrice di sensori di pressione dichiara che il valore medio della pressione calibrata
# dei suoi dispositivi `e pari a 100 kPa.
# Un laboratorio indipendente desidera verificare se, in realt`a, la pressione media sia inferiore a
# quanto dichiarato.
# Si assume che la pressione misurata (indicata con X) sia una variabile casuale distribuita
# normalmente con media µ e varianza σ2.
# Sulla base del seguente campione di 10 sensori:

x <- c(99.42, 100.15, 98.73, 99.05, 97.98, 100.52, 98.81, 99.33, 97.65, 99.87)

# 4.1
# costruisca un intervallo di confidenza al 95% per il parametro µ;

# al fine di costruire un intervallo di confidenza per la media,
# IC = X_bar +/- t_crit * SE dove
# X_bar è la media campionaria
# t_crit è il quantile della distribuzione T di student (ho un campione piccolo e varianza reale ignota)
# che delimita il mio intervallo di confidenza
# SE è l'errore standard = deviazione standard / sqrt(n) (n numerosità del campione)

n <- length(x)
X_bar <- mean(x)
sigma2_bar <- var(x)
sigma_bar <- sd(x)

SE <- sigma_bar / sqrt(n)
df = n - 1 # gradi di libertà
alpha <- 0.05 # coefficiente di significatività

t_crit = qt(1 - alpha / 2, df) # 1 - alpha / 2 poichè l'intervallo è bilaterale, lasciando 
# il 2.5% di probabilità sotto entrambe le code

IC <- c(X_bar - t_crit * SE,
        X_bar + t_crit * SE)
IC


# 4.2
# conduca un test d’ipotesi al livello di significativit`a α= 0.05 per:
# H0 : µ= 100 vs H1 : µ<100.
# Commentare brevemente i risultati ottenuti.

mu_0 = 100

t_obs <- (X_bar - mu_0) / SE
t_crit_test <- qt(alpha, df) # alpha per test unilaterale sinistro

t_obs
t_crit_test

# t_obs(-2.96) < t_crit_test(-1.83) -> rifiuto l'ipotesi H0: la media della pressione dei dispositivi
# è minore di 100 kPa con una confidenza del 95%

p_value <- pt(t_obs, df)
p_value
# anche il p_value di 0.008 < 0.05 ce lo conferma -> rifiuto l'ipotesi nulla H0


# ESERCIZIO 3 (generato da Gemini)

# Si consideri il dataset airquality. Si definisca una nuova variabile Temp_cat ottenuta 
# suddividendo la variabile Temp (temperatura) in due classi utilizzando la mediana 
# come valore soglia: "Freddo" (<= mediana) e "Caldo" (> mediana).
# Si richiede di analizzare la variabile Ozone (livello di ozono) in funzione dei fattori 
# Month e Temp_cat.
# (Nota: Rimuovere preventivamente i valori NA con na.omit(airquality) o argomenti 
# simili nelle funzioni).

data("airquality")
df <- na.omit(airquality)

# 1. Calcolo la soglia (Mediana)
soglia <- median(df$Temp)

# 2. Applico CUT
# breaks: definisce i "paletti" del recinto. 
# Usiamo -Inf e Inf per essere sicuri di prendere tutto, anche i valori estremi.
df$Temp_cat <- cut(df$Temp, 
                   breaks = c(-Inf, soglia, Inf), 
                   labels = c("Freddo", "Caldo"))

df$Temp_cat

# 3.1
# Calcolare le medie di Ozone per ciascun mese e per ciascun 
# livello di temperatura (Temp_cat).

library(tidyverse)

df |> 
  group_by(Temp_cat) |>
  summarise(medie_cond = mean(Ozone))
# livello medio di Ozono per temperatura fredda (< della mediana): 22.7
# livello medio di Ozono per temperatura calda (> della mediana): 62.5

# 3.2
# Rappresentare graficamente le distribuzioni di Ozone condizionate ai due fattori.

df$Month <- factor(df$Month)

boxplot(Ozone ~ Month * Temp_cat,
        data = df,
        col = c("lightblue", "orange"),
        main = "Distribuzioni Ozone ~ Month * Temp_cat",
        xlab = "Mese.Temperatura",
        ylab = "Livello di Ozono")

# Aggiungo la legenda per far capire i colori
legend("topright", legend = c("Freddo", "Caldo"), 
       fill = c("lightblue", "orange"))
