#==========================================================
# ESERCIZIO 1: Il dataset mtcars di R contiene dati su 32 automobili
#con le seguenti variabili (tra le altre): consumo
#in miglia per gallone (mpg), numero di cilindri (cyl), cavalli (hp), 
#peso in migliaia di libbre (wt) e
#tipo di trasmissione (am: 0 = automatica, 1 = manuale).
#========================================================== 

df <- data.frame(mtcars)
if(!require(moments)) install.packages("moments")
library(moments)
#----------------------------------------------------------
# Punto 1: Studiare la distribuzione della variabile mpg (consumo) calcolando 
# indici di posizione, variabilità e forma. Rappresentare graficamente la distribuzione 
# mediante un grafico appropriato e commentare le principali caratteristiche osservate.
#----------------------------------------------------------
typeof(df)
consumo <- df[,"mpg"]
n <- length(consumo)

# Indici di posizione
media_mpg <- mean(consumo)
mediana_mpg <- median(consumo)
quantili <- quantile(consumo, probs = c(0.25, 0.75))

# Variabilità
var_mpg <- var(consumo) * (n - 1) / n
sd_mpg <- sd(consumo) * (n - 1) / n

# Forma 
skew_mpg <- skewness(consumo)

# Stampo i risultati
cat("Media:", media_mpg, 
    "\nMediana:", mediana_mpg, 
    "\nVarianza:", var_mpg, 
    "\nDeviazione Standard:", sd_mpg,
    "\nQuantili:", quantili,
    "\nSkewness:", skew_mpg)

# Grafico della distribuzione
hist(consumo, main = "Distribuzione del Consumo (mpg)", 
     xlab = "Miglia per gallone", col = "skyblue", border = "white", prob = TRUE)
lines(density(consumo), col="red", lwd=2)
abline(v = mediana_mpg, col = "lightgrey", lty = 2)

# COMMENTO: La media (20.09) è superiore alla mediana (19.20, linea tratteggiata nel grafico), 
# e l'indice di skewness è positivo (0.64). 
# Questo indica una distribuzione asimmetrica a destra (positiva), 
# ovvero ci sono alcune auto con consumi molto bassi (valori di mpg molto alti) 
# che trascinano la media verso l'alto.

#----------------------------------------------------------
# Punto 2: Confrontare le distribuzioni del consumo (mpg) condizionatamente 
# al tipo di trasmissione (am), utilizzando un grafico appropriato. 
#Calcolare le medie condizionate e confrontare la variabilità tra i due gruppi.
#----------------------------------------------------------

# Medie condizionate 
medie_cond <- aggregate(mpg ~ am, data = df, mean)

# Variabilità condizionata
sd_cond <- aggregate(mpg ~ am, data = df, sd)

print(medie_cond)
print(sd_cond)

# Boxplot di confronto
boxplot(mpg ~ am, data = df,
        main = "Consumo per tipo di Trasmissione",
        xlab = "Trasmissione(0 = Automatica, 1 = Manuale)",
        ylab = "Miglia per Gallone",
        col = c("red", "purple"))


# COMMENTO: Le auto con cambio manuale (am=1) hanno un consumo medio 
# decisamente superiore (24.39 mpg) rispetto alle automatiche (17.15 mpg). 
# Anche la variabilità è maggiore nel gruppo delle manuali (sd = 6.16) 
# rispetto alle automatiche (sd = 3.83)

#----------------------------------------------------------
# Punto 3: Creare una nuova variabile categoriale "peso_cat" dividendo 
# la variabile wt (peso) in tre classi di pari numerosità. 
# Costruire una tabella di frequenza doppia tra peso_cat e cyl (numero di cilindri) 
# e commentare l’eventuale associazione tra le due variabili.
#----------------------------------------------------------
weigth <- df[, "wt"]

# Creazione variabile categoriale in 3 classi (terzili)
mtcars$peso_cat <- cut(weigth, 
                breaks = quantile(weigth, probs = seq(0, 1, length.out = 4)),
                include.lowest = TRUE,
                labels = c("Ligth", "Medium", "Heavy"))

# Tabella di frequenza doppia
tabella_doppia <- table(mtcars$peso_cat, mtcars$cyl)
print(tabella_doppia)

# COMMENTO: Dalla tabella si nota una forte associazione: le auto "Leggere" 
# sono quasi tutte a 4 cilindri, mentre le auto "Pesanti" sono quasi esclusivamente 
# a 8 cilindri. Questo suggerisce che all'aumentare della stazza del veicolo 
# aumenta proporzionalmente la potenza del motore richiesta.

#----------------------------------------------------------
# Punto 4: Analizzare la relazione lineare tra il consumo (mpg) e 
# il peso (wt) delle automobili:
# • Rappresentare i dati con un diagramma di dispersione.
# • Calcolare il coefficiente di correlazione di Pearson e commentarne il valore.
# • Adattare un modello di regressione lineare semplice, interpretare i coefficienti stimati e
#  valutarne la significativit`a statistica.
# • Commentare la bontà di adattamento del modello e prevedere il consumo atteso per
#   un’automobile che pesa 3 migliaia di libbre.
#----------------------------------------------------------

# Diagramma di dispersione
plot(mtcars$wt, mtcars$mpg, main = "Relazione Peso vs Consumo",
     xlab = "Peso (1000 lbs)", ylab = "mpg", pch = 19, col = "darkblue")

# Correlazione di Pearson
correlazione <- cor(mtcars$wt, mtcars$mpg)

# Regressione Lineare
modello <- lm(mpg ~ wt, data = mtcars)
summary_modello <- summary(modello)

# Previsione per wt = 3
previsione <- predict(modello, newdata = data.frame(wt = 3))

cat("Correlazione:", correlazione, "\nPrevisione per wt=3:", previsione)
abline(modello, col="red", lwd=2) # Aggiunge linea di regressione

# COMMENTO: Il valore del coefficiente di Correlazione di Pearson, -0.8676, indica una 
# correlazione negativa molto forte tra il consumo di un autombile e il suo peso: all'aumentare 
# del peso del veicolo il consumo sale parecchio e le miglia percorse per ogni gallone diminuiscono.
# Il coefficiente di regressione mostra che per ogni 1000 libre di peso di un veicolo
# le miglia per gallone diminiscono di 5.3445.
# La bontà di adattamento R-Squared è di circa 74%: ciò significa che il nostro modello 
# spiega il 74% della variabilità del consumo. Il restante 26% sicuramente sarà dipendente 
# da altre variabili (o da eventi casuali).
# Per un auto che pesa 3000 libre, si prevede che il consumo sia di circa 21.25 mpg


#==========================================================

# ESERCIZIO 4: Un produttore dichiara che la durata media, indicata con µ, delle batterie ricaricabili di un certo
# modello `e pari a 1000 ore. Un laboratorio indipendente vuole verificare se la durata effettiva sia
# inferiore a quanto dichiarato. Si assume che la variabile aleatoria X, durata di una batteria, sia
# distribuita normalmente con media µ e varianza σ2. Dalla prova sperimentale sono state ottenute
# le seguenti n= 10 osservazioni (ore): 
# x= (992,1003,995,987,1001,998,990,996,1005,991).

# PUNTO 1: costruire l’intervallo di confidenza per il parametro µal livello di confidenza 0.95, assumendo
# σ2 ignota

#Campione di osservazioni:

campione <- c(992,1003,995,987,1001,998,990,996,1005,991)

# Numero di osservazioni
n <- length(campione)

# Media Campionaria

X_bar <- mean(campione)

# Deviazione standard campionaria

sd_campione <- sd(campione)

alpha <- 0.05

# Valore critico della distribuzione t di Student
# qt(p, df) restituisce il quantile della t con df gradi di libertà
tcrit <- qt(1 - alpha/2, n - 1) #df = n -1 = 9

# Formula intervallo di confidenza 
# IC = Media +/- tcrit * (sd / sqrt(n))

IC <- c(X_bar - tcrit * sd_campione / sqrt(n),
        X_bar + tcrit * sd_campione / sqrt(n))

IC

# PUNTO 2: verificare il test di ipotesi
# H0 : µ= 1000 vs H1 : µ<1000
# al livello di significativit`a α = 0.05. Calcolare la statistica di test, il p-value e formulare la
# conclusione.

# Statistica di test t per campione piccolo e sigma  sconosciuta:
# t = (media - mu0) / (sd / sqrt(n))

t_stat <- (X_bar - 1000) / (sd_campione / sqrt(n)) 
t_stat

# P-value per test unilaterale (mu < 1000)
# pt(t, df) restituisce la probabilità cumulativa della t con df gradi di libertà

p_value <- pt(t_stat, n - 1)
p_value

## Il p-value (~0.026) è < 0.05, quindi rifiutiamo H0. 
# Possiamo affermare che la durata media
# delle batterie risulta significativamente inferiore a 1000 ore 
# con un livello di confidenza pari al 95%.

# Nota:
# L'intervallo di confidenza bilaterale include 1000, ma il test unilaterale rifiuta H0.
# Non è un controsenso: l'IC considera deviazioni sopra e sotto la media,
# mentre il test unilaterale guarda solo se la media è significativamente più bassa di 1000.


2* (1- pt(abs(t_stat), n - 1))
