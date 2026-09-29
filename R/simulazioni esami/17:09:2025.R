# ESERCIZIO 1 
# Il dataset iris contiene dati relativi a 150 fiori appartenenti a tre specie (setosa, versicolor, vir-à 
# ginica). Per ciascun fiore sono misurate quattro caratteristiche (in cm):
# • Sepal.Length: lunghezza del sepalo;
# • Sepal.Width: larghezza del sepalo;
# • Petal.Length: lunghezza del petalo;
# • Petal.Width: larghezza del petalo.

# 1.1 
# Rappresentare graficamente le distribuzioni delle quattro variabili e commentarne le principali
# caratteristiche

data(iris)

media_sep_l <- mean(iris$Sepal.Length)
mediana_sep_l <- median(iris$Sepal.Length)

summary(iris$Sepal.Length)
# la media e la mediana per la lunghezza del sepalo sono pressochè identiche, suggerendo una distribuzione simmetrica

boxplot(iris$Sepal.Length,
        col = "lightgreen")
# dal boxplot, al contrario di come avevamo ipotizzato basandoci sui valori di media e mediana
# la distribuzione presenta un'asimmetria positiva piuttosto pronunciata. Il baffo superiore infatti
# è molto più lungo rispetto a quello inferiore.

library(labstatR)
skew(iris$Sepal.Length)
# anche l'indice di skewness (asimmetria) conferma quello ceh vediamo dal grafico, con un valore
# positivo di 0.312

media_sep_w <- mean(iris$Sepal.Width)
mediana_sep_w <- median(iris$Sepal.Width)

summary(iris$Sepal.Width)
# la media e la mediana per la larghezza del sepalo sono pressochè identiche, suggerendo una distribuzione simmetrica

boxplot(iris$Sepal.Width,
        col = "lightgreen")
# dal boxplot, possiamo confermare la nostra ipotesi precedente: baffo superiore e inferiore 
# hanno la stessa lunghezza. Sono presenti outliers

skew(iris$Sepal.Width)
# l'indice di skewness (asimmetria) non conferma quello che vediamo dal grafico, con un valore
# positivo di 0.32 suggerisce una distribuzione caratterizzata da una leggera asimmetria positiva

media_petal_w <- mean(iris$Petal.Width)
mediana_petal_w <- median(iris$Petal.Width)

summary(iris$Petal.Width)
# per la larghezza del petalo la media è leggermente inferiore rispetto alla mediana:
# potrebbe indicare una leggera asimmetria negativa della distribuzione

boxplot(iris$Petal.Width,
        col = "lightcoral")
# al contrario di come pensavamo, la distribuzione presenta un'asimmetria positiva, col basso 
# superiore decisamente più lungo di quello inferiore 

skew(iris$Petal.Width)
# l'indice di skewness invece afferma che l'asimmetria è negativa.
# ho imparato che per analizzare la simmetria della distribuzione devo guardare primo e terzo quartile 
# rispetto alla mediana. effettivamente la mediana è più vicina al terzo quartile, suggerendo un'asimmetria
# negativa come avevamo supposto inizialmente dai valori numerici e come ci conferma l'indice di skewness
# la lunghezza dei baffi è sempre influenzata da i valori massimi e minimi e dagli outliers


media_petal_l <- mean(iris$Petal.Length)
mediana_petal_l <- median(iris$Petal.Length)

summary(iris$Petal.Length)
# per la lunghezza dei petali la media è minore della mediana, possibile asimmetria negativa

boxplot(iris$Petal.Length,
        col = "purple")
# il boxplot ce lo conferma, c'è un'asimmetria negativa: la mediana è molto vicina
# al terzo quartile e molto distante dal primo. Il baffo superiore è più lungo a causa del valore massimo
# la media è di 3.7 e il massimo di 6.9 -> molta più differenza dalla media rispetto al minimo 
# che è 1


# 1.2 
# Confrontare, utilizzando un opportuno grafico, la lunghezza dei petali (Petal.Length) nelle
# tre specie di iris. Commentare le principali differenze tra i gruppi.

boxplot(Petal.Length ~ Species,
        data = iris,
        col = "blue",
        main = "Lunghezza dei petali condizionalmente alla specie",
        xlab = "Specie")

media_cond<- tapply(iris$Petal.Length,
                       iris$Species,
                       mean)

mediana_cond <- tapply(iris$Petal.Length,
                         iris$Species,
                         median)

media_cond
mediana_cond
# dal boxplot sono evidenti differenze significative tra le varie specie:
# la specie setosa è quella con i petali più corti, di media circa uguale a 1.5 cm
# la specie versicolor ha una media di 4.26 cm di lunghezza per i suoi petali e infine
# la specie virginica è quella con i petali più lunghi con una media di 5.55cm
# tutte le distribuzioni sono pressochè simmetriche

# 1.3
# Studiare la relazione lineare tra la larghezza (Sepal.Width) e la lunghezza (Sepal.Length)
# dei sepali. Rappresentare i dati con un grafico di dispersione, 
# adattare un modello di regressione lineare. Commentare l’interpretazione 
# dei coefficienti e la significaviti`a e la bont`a di adattamento della retta.

# Diagramma di dispersione
plot(Sepal.Width ~ Sepal.Length,
     data = iris,
     pch = 19, col = "blue")
# dallo scatterplot non sembra emergere una relazione lineare tra le due variabili:
# la dispersione dei punti sembra casuale e non segue un andamento crescente o decrescente

# Modello di regressione lineare
modello <- lm(Sepal.Width ~ Sepal.Length,
              data = iris)
abline(modello,
       col = "red", lwd = 2)

# dalla retta rappresentata nel grafico è evidente che è presente una relazione lineare negativa molto debole
# la retta infatti è quasi orizzontale. all'aumentare della lunghezza del sepalo la larghezza sembra diminuire
# di poco
cor(iris$Sepal.Width,
    iris$Sepal.Length)
# il coefficiente di correlazione di Pearson conferma la nostra ipotesi: la relazione tra le due variabili
# è molto debole, con un coefficiente di -0.11 che in valore assoluto è molto più vicino allo 0 che all'1

summary(modello)
# l'intercetta in questo caso non ha un significato reale. per un fiore con un sepalo di lunghezza 
# 0, quindi un fiore senza sepalo (non esistente), la larghezza del sepalo sarebbe 3.42 cm
# come ci aspettavamo la variabile Sepal.length non è significativa per la variabilità della larghezza
# il p_value è di 0.152 >>> 0.05.
# il coefficiente di bontà di adattamento R^2 è anch'esso molto basso: 0.01
# il nostro modello spiega solamente l'1% della variabilità

# 1.4
# Costruire la distribuzione di frequenza doppia tra Petal.Length e Petal.Width, suddivi-
# dendo entrambe le variabili in tre classi ottenute tramite i percentili 33 e 67. Commentare i
# risultati.

iris$Petal.Length <- cut(iris$Petal.Length,
                         breaks = quantile(iris$Petal.Length, c(0, 1 / 3, 2 / 3, 1)),
                         include.lowest = TRUE,
                         labels = c("Corto", "Media Lunghezza", "Lungo"))

iris$Petal.Width <- cut(iris$Petal.Width,
                         breaks = quantile(iris$Petal.Width, c(0, 1 / 3, 2 / 3, 1)),
                         include.lowest = TRUE,
                         labels = c("Stretto", "Media Larghezza", "Largo"))

# Tabella di frequenza doppia

table(iris$Petal.Length, iris$Petal.Width)

# dalla tabella si può notare una fortissima correlazione tra la lunghezza e la larghezza di un petalo
# infatti tutti e 50 i fiori che rientrano nella categoria di fiore con petalo corto, fanno parte della
# categoria di petalo stretto. a sua volta la quasi totalità dei petali di media lunghezza sono di media larghezza
# e questa relazione vale anche per petali lunghi e larghi. tutto è visibile dalla diagonale principale della matrice


# ESERCIZIO 4
# Un’azienda produttrice di sensori di pressione dichiara che il valore medio della pressione calibrata
# dei suoi dispositivi `e pari a 100 kPa.
# Un laboratorio indipendente desidera verificare se, in realt`a, la pressione media sia inferiore a
# quanto dichiarato.
# Si assume che la pressione misurata (indicata con X) sia una variabile casuale distribuita
# normalmente con media µ e varianza σ2 (entrambi ignoti).
# Sulla base del seguente campione di n= 10 sensori:

# Campione
x <- c(99.42, 100.15, 98.73, 99.05, 97.98, 100.52, 98.81, 99.33, 97.65, 99.87)

# Dati sul campione
n <- length(x) # numerosità del campione
X_bar <- mean(x)
sigma2_bar <- var(x)
sigma_bar <- sqrt(sigma2_bar)

# 4.1
# costruisca un intervallo di confidenza al 95% per il parametro µ;

# Standard Error 
# SE = sd / sqrt(n)

SE = sigma_bar / sqrt(n)

df = n - 1 # df = gradi di libertà, dato che ho varianza ignota la mia variabile casuale si distribuirà come una T di student
alpha = 0.05 # per intervallo di confidenza al 95%
t_crit = qt(1 - alpha / 2, df) # 1 - alpha / 2 perchè devo costrire un intervallo di confidenza bilaterale
# lasciando il 2.5% di probabilità sotto la coda sinistra e sotto la coda destra

IC <- c(X_bar - t_crit * SE,
        X_bar + t_crit * SE)
IC

# 4.2
# conduca un test d’ipotesi al livello di significativit`a α= 0.05 per
# H0 : µ= 100 vs H1 : µ<100.
# Commentare brevemente i risultati ottenuti.

mu_0 <- 100

t_test <- (X_bar - mu_0) / SE
t_crit_test <- qt(alpha, df) # alpha perchè è un test unilaterale sinistro

t_test
t_crit_test

# il t osservato dal nostro test di ipotesi (-2.95) è molto inferiore al t crit per H1: mu < 100 (-1.83)
# -> rifiutiamo l'ipotesi nulla H0: abbiamo una certezza del 95% che la media della pressione dei dispositivi
# sia significativamente inferiore a 100kPa

p_value <- pt(t_test, df)
p_value
# anche il p_value lo conferma, essendo di 0.008 < 0.05 -> rifiuto l'ipotesi nulla H0

# ESERCIZIO 3 (generato da Gemini)
# Dataset: CO2 (presente di default in R).
# Il dataset riguarda l'assorbimento di anidride carbonica (uptake) in diverse piante.
# Consideriamo i due fattori: Type (origine della pianta: Quebec o Mississippi) e Treatment (trattamento: nonchilled o chilled).

# Si consideri il dataset CO2 disponibile in R. Si vuole analizzare la variabile uptake 
# (assorbimento di CO2) in funzione dell'origine della pianta e del trattamento subito.

data("CO2")
library(tidyverse)
# 3.1
# Calcolare le medie di uptake per ciascun livello dei due fattori (Type e Treatment) 
# e per ciascuna combinazione dei fattori (medie condizionate).
# 3.2
# Rappresentare graficamente le distribuzioni di uptake condizionate ai due fattori, 
# utilizzando un grafico appropriato (es. boxplot) o un grafico di interazione 
# (interaction.plot) per visualizzare potenziali effetti congiunti.

CO2 |> 
  group_by(Type) |>
  summarise(medie_cond = mean(uptake))

CO2 |>
  group_by(Treatment) |>
  summarise(medie_cond = mean(uptake))

CO2 |>
  group_by(Treatment, Type) |>
  summarise(medie_cond = mean(uptake)) |>
  ggplot(aes(x = Treatment, y = medie_cond, col = Type, group = Type)) +
  geom_point() + geom_line() + theme_minimal() +
  labs(y = "Medie di uptake")

# dalle tabelle e dai grafici le piante originarie del Quebec assorbono più CO2 di quelle del Missisipi
# a prescindere dal tipo di trattamento, che sia chilled o nonchilled. Quest'ultimo è il trattamento
# che sembra garantire un maggiore assorbimento di CO2 rispetto al metodo chilled in entrambe le origini
# dal grafico non sembra esserci interazione tra il trattamento e l'origine della pianta

# 3.3
# Eseguire un'analisi della varianza (ANOVA) a due vie per verificare:
# L'effetto principale dell'origine (Type);
# L'effetto principale del trattamento (Treatment);
# L'eventuale presenza di interazione tra i due fattori.
# Riportare la tabella ANOVA completa e commentare i risultati al livello 
# di significatività α=0.05.

modello_aov <- aov(uptake ~ Treatment * Type,
                   data = CO2)
summary(modello_aov)

# sia l'origine (p_value dell'ordine di 10^-10 ***) che il trattamento (p_value di 0.00018 << 0.05 ***)
# risultano essere significativi per l'uptake di CO2 delle piante. (il trattamento molto meno dell'origine)
# come ci aspettavamo, l'interazione tra l'origine e il tipo di trattamento non è 
# statisticamente significativa (p_value = 0.064 > 0.05) per l'uptake di CO2

# 3.4
# Qualora il termine di interazione o i fattori principali risultino significativi, 
# applicare il test di Tukey HSD per identificare quali combinazioni differiscono in modo significativo.

tukey <- TukeyHSD(modello_aov)
tukey

# come possiamo notare anche dal test di Tukey ad essere significativi sono sicuramente l'origine
# (p_valore 0 -> significatività altissima e fondamentale per spiegare la differenza di uptake
# e l'intervallo non contiene neanche lontanamente lo 0) e il tipo di trattamento, con p_valore 0.00018
# e intervallo non contenente lo 0
