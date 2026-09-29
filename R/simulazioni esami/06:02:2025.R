# ESERCIZIO 1
# dataset trees contiene dati relativi a 31 alberi, per ciascuno dei quali sono state misurate la
# circonferenza del tronco (Girth, i n pollici), l'altezza (Height, in piedi) e il volume del legno
# (Volume, in piedi cubi).

# 1.1
# appresentare graficamente le distribuzioni delle tre variabili.

data("trees")

boxplot(trees$Girth, col = "lightgreen")
# la distribuzione sembra essere caratterizzata da una leggera asimmetria positiva:
# la mediana (linea nera) è di poco più vicina al primo quartile che al terzo
# il baffo superiore è decisamente più lungo di quello inferiore

summary(trees$Girth)
library(labstatR)
skew(trees$Girth)
# come immaginavo l'indice di skewness di 0.53 indica un'asimmetria positiva

boxplot(trees$Height, col = "orange")
# per la variabile Height la distribuzione sembra essere sostanzialmente simmetrica
# con la mediana che sembra essere pressochè equidistante da primo e terzo quartile
# il baffo inferiore è più lungo di quello superiore -> possibile asimmetria negativa
# non sono presenti outliers

summary(trees$Height)
skew(trees$Height)
# media e mediana sono uguali -> ci aspettavamo una distribuzione simmetrica
# tuttavia il baffo inferiore è molto più lungo di quello superiore ->
# maggiore distanza del minimo dal primo quartile che del massimo dal terzo
# -> asimmetria negativa (skewness = -0.37)

boxplot(trees$Volume, col = "lightblue")
# per la variabile Volume la distribuzione presenta un'asimmetria positiva abbastanza accentuata
# la mediana è molto vicina al primo quartile e il baffo superiore è molto più lungo di quello inferiore

summary(trees$Volume)
skew(trees$Volume)
# media > mediana -> asimmetria positiva -> skewness = 1.06

# 1.2
# Confrontare la variabilità delle tre variabili utilizzando u n opportuno indice statistico.

# Per confrontare variabili con medie sostanzialmente diverse devo utilizzare un indice relativo
# per confrontarle, come il coefficiente di variazione CV = sd / media

cv_girth <- cv(trees$Girth)
cv_height <- cv(trees$Height)
cv_volume <- cv(trees$Volume)

cv_girth
cv_height
cv_volume

# la variabile con la maggiore variabilità è il Volume con una variabilità discreta attorno alla media
# del 53.6%, seguita dalla circonferenza del tronco con una variabilità contenuta del 23.3%
# e infine l'altezza con bassa variabilità dell'8.2%

# 1.3
# Costruire la matrice di correlazione tra le tre variabili e interpretarne i risultati.

cor(trees)
# sulla diagonale principale il coefficiente di correlazione di Pearson varrà sempre 1
# perchè una variabile avrà la massima correlazione con se stessa
# notiamo che la circonferenza e il volume hanno una correlazione altissima = 0.97 circa,
# mentre altezza con circonferenza (0.52) e altezza con volume (0.6) hanno una buona correlazione

# 1.4 e 1.5
# Stimare il modello di regressione lineare in cui il volume dipende dalla circonferenza e
# dall'altezza.
# Interpretare i coefficienti della regressione stimata e calcolare un indice di bontà dell'adattamento.

modello <- lm(Volume ~ Girth * Height, data = trees)
summary(modello)
# dal modello vediamo che sia la circonferenza(p_value = 0.007 < 0.05 **) che l'altezza 
# (p_value = 0.005 < 0.05 **) sono significativi così come l'interazione tra tali variabili
# con un p_value di 7.48 x 10^-6 <<< 0.05 ***
# Dal summary notiamo che i coefficienti sono positivi (o negativi, controlla l'output).
# L'intercetta non ha un significato fisico reale (non esistono alberi con circonferenza 0).
# Il coefficiente positivo dell'interazione indica che l'effetto combinato di altezza
# e circonferenza amplifica l'aumento del volume più della semplice somma delle parti.
# il coefficinete di bontà di adattamento R^2 è altissimo: 0.976 ->
# il modello spiega il 97.6% della variabilità del Volume, ed è quindi praticamente perfetto
# dato che ne spiega quasi la totalità

# 1.6
# Utilizzare il modello stimato per prevedere il volume di un albero con circonferenza di 15
# pollici e altezza di 80 piedi.

nuovi_dati <- data.frame(Girth = 15, Height = 80)
valore <- predict(modello, newdata = nuovi_dati)
valore
# Il valore del Volume stimato per un albero di 15 pollici di circonferenza e 80 piedi di altezza,
# basandoci sul nostro modello è di 39.38 piedi cubi


# ESERCIZIO 4
# L'etichetta di una nota azienda produttrice di succhi di frutta riporta che l'ammontare 
# di vitamina C contenuta in ogni confezione è pari a 15 mg. Per valutare la veridicità 
# di quanto dichiarato, un gruppo di ricercatori ha rilevato l'ammontare di vitamina C 
# presente in un campione di 7 confezioni: di seguito si riportano i valori rilevati:

x <- c(12.74, 12.38, 13.62, 11.14, 14.68, 12.60, 12.73)

# Assumendo che l'ammontare di vitamina C sia distribuito normalmente con media u e varianza
# o. il candidato:

# 4.1
# struisca l'intervallo di confidenza per il parametro pi ad un livello fiduciario dello 0.99;

# per campione piccolo e varianza reale ignota, uso una distribuzione T di student

# IC = X_bar +/- t_crit * SE
# X_bar = media campionaria
# t_crit = quantile critico che ci aiuta a definire gli estremi del nsotro IC
# SE = S / sqrt(n)

n <- length(x) # dimensione del campione
X_bar <- mean(x)
S <- sd(x)

SE <- S / sqrt(n) # errore standard
df <- n - 1 # gradi di libertà per la distribuzione T di student
alpha <- 0.01 # coefficiente di significatività

t_crit <- qt(1 - alpha / 2, df) # qt ritorna il quantile sulla distribuzione T di student con df gradi di libertà
# che lascia sotto la curva 1 - alpha / 2 probabilità (o alpha / 2 sotto le code, in questo caso che è bilaterale)

IC <- c(X_bar - t_crit * SE,
        X_bar + t_crit * SE)
IC

# 4.2
# saggi il sistema d'ipotesi Ho : u = 15 vs H1: u < 15 a d un livello di significatività
# a = 0.01.

mu_0 <- 15

t_obs <- (X_bar - mu_0) / SE

t_crit_test <- qt(alpha, df)

t_obs
t_crit_test
# il t_obs = -5.22 < del t_crit_test = -3.14 -> rifiuto l'ipotesi nulla H0.
# con una confidenza del 99% posso dire che la quantità di vitamina C è minore di 15mg

# Verifico anche con p valore

p_value <- pt(t_obs, df)
p_value
# il p valore è di 0.001 circa < 0.01 -> rifiuto l'ipotesi nulla H0
# la probabilità di ottenere una media così bassa è molto bassa -> non può essere legato al caso
# e possiamo affermarlo con una confidenza del 99%

# ESERCIZIO 3 (generato da gemini)
# Il dataset npk disponibile in R contiene i risultati di un esperimento sulla resa 
# di piante di piselli (yield) in libbre/parcella. L'esperimento considera l'uso di 
# diversi fertilizzanti. Si analizzino i seguenti due fattori (variabili binarie 0/1):
# N: utilizzo di Azoto (0 = no, 1 = sì).
# P: utilizzo di Fosfato (0 = no, 1 = sì).

data(npk)

df <- npk
df$N <- factor(df$N, labels = c("Azoto No", "Azoto Sì")) 
# trasformo N e P in fattori così vengono trattati come etichette e non come numeri 
df$P <- factor(df$P, labels = c("Fosfato No", "Fosfato Sì"))

# 3.1
# Calcolare le medie della resa (yield) per l'utilizzo di Azoto, 
# per l'utilizzo di Fosfato e per le combinazioni dei due trattamenti.

library(tidyverse)

df |> 
  group_by(N) |>
  summarise(medie_cond = mean(yield))
# le piante trattate con azoto hanno una media della resa maggiore di quele non trattate (57.7 > 52.1)

df |> 
  group_by(P) |>
  summarise(medie_cond = mean(yield))
# le piante trattate con Fosfato hanno una resa media minore di quelle non trattate (54.3 < 55.5)

df |>
  group_by(N, P) |>
  summarise(medie_cond = mean(yield))

# 3.2
# Costruire un grafico delle medie (interaction plot) per visualizzare l'effetto 
# congiunto dei due fertilizzanti sulla resa.

df |>
  group_by(N, P) |>
  summarise(medie_cond = mean(yield)) |>
  ggplot(aes(x = N, y = medie_cond, col = P, group = P)) +
  geom_point() + geom_line() + theme_minimal()
# dal grafico è visibile un'interazione tra le due variabili N e P:
# le rette si incrociano
# mentre la resa per le piante alle quali non è stato applicato alcun trattamento è minore 
# di quelle trattate con solo Fosfato, quelle trattate con solo azoto hanno la resa migliore di tutte
# anche di quelle trattate con entrambi

# 3.3
# Eseguire un'analisi della varianza (ANOVA) a due vie per verificare:
# l'effetto principale dell'Azoto (N);
# l'effetto principale del Fosfato (P);
# l'eventuale presenza di interazione tra i due fertilizzanti (N:P).
# Riportare la tabella ANOVA completa e commentare dettagliatamente le conclusioni 
# statistiche al livello di significatività α=0.05.

modello_aov <- aov(yield ~ N * P, data = df)
summary(modello_aov)
# dal nostro modello apprendiamo che ad essere significativa è solo la variabile N, il trattamento con l'azoto
# con p_value = 0.0263 < 0.05 *. Il trattamento con Fosfato e l'interazione tra i 2 trattamenti
# non sono significativi al fine di spiegare l'andamento della resa

# 3.4
# Qualora appropriato, applicare il test di Tukey HSD per i confronti multipli, 
# identificando se l'uso combinato dei fertilizzanti porta a differenze significative 
# rispetto all'uso singolo o nullo.

tukey <- TukeyHSD(modello_aov)
tukey
# il test di Tukey, coe ci aspettavamo, risulta ridondante, dato che l'interazione tra N e P non è risultata
# significativa,
# Gli unici gruppi a presentare una differenza significativa sono quelli trattati con N e non trattati