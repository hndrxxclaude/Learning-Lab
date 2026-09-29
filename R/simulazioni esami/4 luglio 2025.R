# COMPITO 04 / 07 / 2025

# ESERCIZIO 1
# Il dataset Orange contiene dati su 35 alberi di arancio con le variabili: et`a (age, in giorni), circon-
# ferenza del tronco (circumference, in millimetri) e identificatore della pianta (Tree).
data("Orange")

# 1.1

media_age = mean(Orange$age) # media per la variabile age
mediana_age = median(Orange$age) # mediana per la variaile age
var_age = var(Orange$age) # varianza
sd_age = sqrt(var_age) # deviazione standard

media_age
mediana_age # la media risulta essere parecchio inferiore alla mediana -> ci aspettiamo 
# una distribuzione caratterizzata da un'asimmetria negativa
summary(Orange$age)

boxplot(Orange$age, col = "lightgreen")
# come possiamo notare dal boxplot il baffo inferiore è più lungo di quello superiore 
# confermando le nostre supposizioni riguardo l'andamento della distribuzione.

library(labstatR)
skewness_age = skew(Orange$age)
skewness_age # l'indice di skewness di -0.26 conferma ulteriormente quanto analizzato precedentemente


media_circ = mean(Orange$circumference) # media per la variabile circumference
mediana_circ = median(Orange$circumference) # mediana per la variaile circumference
var_circ = var(Orange$circumference) # varianza
sd_circ = sqrt(var_circ) # deviazione standard

media_circ
mediana_circ # la media risulta essere di poco superiore alla mediana -> ci aspettiamo 
# una distribuzione pressochè simmetrica
summary(Orange$circumference)

boxplot(Orange$circumference, col = "lightgreen")
# come possiamo notare dal boxplot il baffo superiore è poco più lungo di quello superiore 
# confermando le nostre supposizioni riguardo l'andamento della distribuzione.

skewness_circ = skew(Orange$circumference)
skewness_circ # l'indice di skewness è positivo ed ha un valore molto piccolo (dell'ordine di 10^-5)
# conferma ulteriormente quanto analizzato precedentemente

df_tree <- factor(Orange$Tree)
table(df_tree)

barplot(table(df_tree), col = "lightcoral")

# la distribuzione di frequenza è uniforme per ogni tipologia di pianta
# sono presenti 7 alberi per 5 diverse tipi di piante(categorie 1-5)

# 1.2 e 1.3
# indici di posizione della variabile circumference condizionata a Tree
media_cond <- tapply(Orange$circumference,
                     Orange$Tree,
                     mean) # media condizionata

mediana_cond <- tapply(Orange$circumference,
                     Orange$Tree,
                     median) # mediana condizionata

media_cond 
mediana_cond

# visualizzazione grafica 
boxplot(circumference ~ Tree,
        data = Orange,
        col = "purple",
        main = "Distribuzioni circumference ~ Tree")

# dal grafico si nota che mediamente le piante di tipo 4 e 2 sono quelle con i tronchi di circonferenza
# maggiore (media di 4 = 139 mm e media di 2 = 135 mm ) e per entrambi la distribuzione ha un'asimmetria
# negativa. Invece le piante di tipo 1 e 3 sono quelle con il tronco di circonferenza più piccola
# (media per 1 = 99 mm e media di 3 = 94 mm) per entrambi la distribuzione ha un'asimmetria positiva
# invece la pianta 5 ha un tronco mediamente più largo delle piante 3 e 1 è più stretto delle piante 2 e 4 
# media 5 = 111 mm

# 1.4 

plot(circumference ~ age,
     data = Orange,
     pch = 19, col = "blue",
     main = "Scatterplot circumference ~ age")
# già dal diagramma di dispersione sembra essere presente una relazione lineare positiva tra le
# variabili circumference e age

modello <- lm(circumference ~ age,
              data = Orange)
abline(modello, col = "red", lwd = 2)

# la scelta della variabile age come variabile indipendente è ovvia: l'aumentare della variabile
# è dovuto al naturale invecchiamento della pianta e da nessun'altra variabile. Invece 
# la scelta della variabile circumference come variabile dipendente è ovvia: logicamente
# viene da pensare che una pianta col passare del tempo cresca, e di conseguenza la circonferenza 
# del suo tronco

summary(modello)
# l'intercetta (17) in questo caso non ha un senso che possiamo interpretare: essa rappresenta i mm di circonferenza
# del tronco di una pianta con 0 giorni di vita: ovviamente se una pianta ha 0 giorni di vita non esiste
# e non ha un tronco di cui possiamo calcolare la circonferenza.
# la variabile age, come ci aspettavamo risulta essere statisticamente significativa, con un
# p_value molto piccolo (ordine della 10 ^ -14) << 0.05 ***. All'aumento unitario della variabile
# age, il tronco aumenta di circonferenza di 0.11 mm circa.
# il coefficiente di bontà di adattamento R^2 è molto alto: 0.83. Ciò significa che il nostro 
# modello si presta bene a spiegare la variabilità, spiegandone appunto l'83%, che è la gran parte.


# ESERCIZIO 4 

# Un’azienda produttrice di microchip dichiara che la temperatura media operativa dei suoi
# dispositivi `e pari a 74°C. Un laboratorio indipendente vuole verificare se, in realt`a,
# la temperatura media sia significativamente inferiore a quanto dichiarato.
# Si assume che la temperatura operativa misurata, indicata con X, sia una variabile casuale
# distribuita normalmente con media µ e varianza σ2. 
# Sulla base del seguente campione di n= 12 microchip:

campione <- c(73.5, 74.2, 72.8, 75.1, 74.0, 72.6, 73.8,72.3, 74.4,73.1,71.9,73.7)

media_campione <- mean(campione)
num_osservazioni <- length(campione)
var_campione <- var(campione)
sd_campione <- sd(campione)

# 4.1
# Varianza nota = 2

sigma2 <- 2
sigma <- sqrt(sigma2)
alpha <-0.05

# X ~ N(74, 2) 

SE <- sigma / sqrt(num_osservazioni) # Errore standard
# Formula per intervallo di confidenza bilaterale per una variable distribuita normalmente con
# varianza nota
# IC = Xbar +/- Z_crit * SE
Z_crit <- qnorm(1 - alpha / 2)

IC <- c(media_campione - Z_crit * SE,
        media_campione + Z_crit * SE)
IC
# notiamo che l'intervallo contiene 74

#test d'ipotesi 4.2 H0 = mu = 74, H1 = mu < 74

Z_oss <- (media_campione - 74) / SE

pnorm(Z_oss)
# il p_value è minore di 0.05 -> rifiuto l'ipotesi H0. siamo certi al 95% che la media operativa
# reale dei dispositivi è minore ai 74 gradi

# 4.3
# con varianza ignota la variabile X sarà distribuita come una T di student con df = n - 1
# gradi di libertà

SE_t <- sd_campione / sqrt(num_osservazioni)
df = n - 1 # gradi di libertà

t_crit <- qt(1 - alpha / 2, df)

IC_t <- c(media_campione - t_crit * SE_t,
          media_campione + t_crit * SE_t)
IC_t
# controintuitivamente, l'intervallo di confidenza del test t è più piccolo di quello per 
# la distribuzione normale

t_test <- (media_campione - 74) / SE_t

pt(t_test, df)
# il p_value risulta essere di 0.008 < 0.05 -> rifiuto il test di ipotesi H0
