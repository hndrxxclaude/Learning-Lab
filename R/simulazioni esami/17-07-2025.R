# ESERCIZIO 1
# Il dataset ToothGrowth contiene dati su 60 cavie relativi all’effetto della vitamina C sulla crescita
# dei denti. Le variabili sono:
# • len: lunghezza del dente (micrometri);
# • supp: tipo di supplemento somministrato (OJ = succo d’arancia, VC = vitamina C pura);
# • dose: dose di vitamina C somministrata (mg).

data("ToothGrowth")

# 1.1
# Rappresentare graficamente le distribuzioni delle tre variabili (len, supp, dose) e 
# commentarne le principali caratteristiche.

boxplot(ToothGrowth$len,
        col = "lightgreen")
summary(ToothGrowth$len)

# dal boxplot rappresentante la distribuzione della variabile len, possiamo notare che la distribuzione
# della lunghezza dei denti sembra essere piuttosto simmetrica e priva di outliers
# infatti la media è di poco minore della mediana (18.81 < 19.25 micrometri).
# anche i baffi superiore e inferiore sono sostanzialmente della stessa lunghezza

library(labstatR)
skew(ToothGrowth$len) # l'indice di skewness indica una leggera asimmetria negativa (-0.14)
# infatti la mediana è di poc più vicina al terzo quartile che al primo, ma può comunque 
# essere considerata piuttosto simmetrica

boxplot(ToothGrowth$supp,
        col = "lightcoral")
summary(ToothGrowth$supp)
# qui la distribuzione è completamente simmetrica, poichè il valore per entrambe le modalità della variabile
# è identico: a 30 cavie è stato sommiistrato il succo d'arancia e a 30 la vitamina C pura
# di conseguenza media e mediana coincidono

boxplot(ToothGrowth$dose,
        col = "orange")
summary(ToothGrowth$dose)
# la distribuzione della variabile dose è caratterizzata da un'asimmetria positiva
# la media (1.167 mg) è maggiore della mediana (1 mg) -> di conseguenza la mediana è più vicina al 
# minimo della distribuzione(0.5 mg) che al massimo (2 mg)
# questa distribuzione deve essere dovuta al fatto che per le tre modalità sono state assegnate 20 cavie
# ciascuna e c'è un maggior gap tra le modalità 0.5 e 1 (0.5 mg di differenza) e tra 1 e 2
# (1 mg di differenza)

# 1.2
# Descrivere la variabile len condizionatamente a supp in termini di posizione, variabilit`a e
# forma. Rappresentare graficamente le distribuzioni condizionate e commentare le differenze
# tra i gruppi.

media_cond <- tapply(ToothGrowth$len,
                     ToothGrowth$supp,
                     mean)

mediana_cond <- tapply(ToothGrowth$len,
                     ToothGrowth$supp,
                     median)

sd_cond <- tapply(ToothGrowth$len,
                     ToothGrowth$supp,
                     sd)

cv_cond <- sd_cond / media_cond

boxplot(len ~ supp,
        data = ToothGrowth,
        col = "lightblue",
        main = "Distribuzioni len ~ supp")

media_cond
mediana_cond
cv_cond

# come possiamo vedere dai boxplot e dai dati, le cavie a cui è stato somministrato succo d'arancia 
# (OJ) hanno dei denti mediamente più lunghi (20.66 micrometri) rispetto a quelle a cui è stata somministrata
# vitamina C pura (VC, 16.96 micrometri).
# mentre la prima distribuzione sembra avere una distribuzione abbastanza asimmetrica negativamente
# (mediana molto vicina al terzo quartile rispetto al primo), la seconda invece presenta
# un'asimmetria positiva più moderata ma caratterizzata da una variabilità maggiore, con un CV
# (coefficiente di variazione) di 0.487 (48.7%) contro il CV per OJ che è di 0.32 (32%)

# 1.3
# Dividere la variabile len in tre classi di uguale numerosit`a e costruire la tabella di frequenza
# doppia tra le nuove classi di len e supp.

ToothGrowth$len <- cut(ToothGrowth$len,
                       breaks = quantile(ToothGrowth$len, c(0, 1 / 3, 2 / 3, 1)),
                       include.lowest = TRUE)

tabella <- table(ToothGrowth$len, ToothGrowth$supp)
prop.table(tabella, 2)

# 1.4
# Adattare un modello di regressione lineare semplice utilizzando len e dose.
# • Motivare la scelta di quale variabile utilizzare come dipendente e quale come indipen-
#  dente;
# • Scrivere l’equazione del modello stimato;
# • Interpretare i coefficienti stimati e valutarne la significativit`a;
# • Commentare l’adeguatezza del modello per descrivere la relazione tra le variabili.

data("ToothGrowth")

# scelgo la variabile len come dipedendente dalla variabile indispendente dose
# perchè mi aspetto logicamente che all'aumentare della dose di vitamina C somministrata
# aumenterà la lunghezza dei denti nelle cavie

# l'equazione per la regressione lineare semplice sarà costiutita dalla variabile 
# len che chiamerò y, a l'intercetta, b il coefficiente di regressione lineare e x la mia
# variabile dose
# l'equazione sarà -> y = a + bx

modello <- lm(len ~ dose,
              data = ToothGrowth)
summary(modello)

# come mi aspettavo, la variabile dose è significativa per la lunghezza del dente:
# il p_value è di 1.23 x 10^-14 <<< 0.05 ***.
# l'intercetta, che vale 7.42, mi dice quanti micrometri mi posso aspettare che
# sia lungo un dente in una cavia a cui è stata somministrata una dose di 0 mg di vitamina C
# e invece per un'aumento unitario di dose, quindi per ogni mg somministrato, posso aspettarmi
# un aumento di 9.76 micrometri -> y = 7.42 + 9.76x
# il coefficiente di bontà di adattamento R^2 è di 0.64, indicando che il modello è abbastanza
# buono per spiegare la variabilità della variabile len (ne spiega il 64%), suggerendo che
# deve esserci altro a contribuire (ad esempio il tipo di supplemento supp)

# ESERCIZIO 2
# Un centro assistenza riceve in media 3 segnalazioni di guasti ogni giorno.

# 2.1 
# Si definisca la variabile aleatoria X che rappresenta il numero di segnalazioni ricevute in
# un dato giorno. Qual `e la distribuzione di X? Calcolare la probabilit`a che esattamente 2
# segnalazioni vengano ricevute.

# X ~ Poisson(lambda) con lambda = 3

dpois(2, lambda = 3)

# 2.2
# Calcolare la probabilit`a che al pi`u 3 segnalazioni vengano ricevute in un giorno. Interpretare
# il risultato nel contesto applicativo.

ppois(3, lambda = 3)
# C'è circa il 64.7% di probabilità che il centro assistenza riceva un numero di 
# segnalazioni pari o inferiore a 3 in un giorno. 
# Questo suggerisce che giornate con un carico di lavoro "basso o medio" 
# (fino alla media di 3) sono la maggioranza, rappresentando quasi due terzi dei casi.

# 2.3
# Qual `e la probabilit`a che nelle prime 8 ore si siano ricevute almeno 2 segnalazioni, sapendo
# che le segnalazioni arrivano in modo omogeneo durante la giornata? Motivare l’approccio
# adottato.

# La distribuzione di Poisson gode della proprietà di omogeneità temporale (come suggerito dal testo "arrivano in modo omogeneo"). 
# Questo significa che il tasso medio λ è proporzionale alla lunghezza dell'intervallo di tempo.

1 - ppois(1, lambda = 1)
# C'è una probabilità del 26.4% di ricevere almeno 2 segnalazioni nelle prime 8 ore.


# ESERCIZIO 4
# Un’azienda afferma che almeno il 90% dei dispositivi elettronici prodotti supera con successo un
# test di qualit`a finale. Un laboratorio indipendente vuole verificare se tale affermazione `e supportata
# dai dati. Si definisca p come la proporzione di dispositivi conformi, e si assuma 
# che l’esito del test su ciascun dispositivo sia modellabile come una variabile casuale 
# Bernoulliana con parametro p. Sulla base del seguente campione casuale di n= 50 dispositivi,
# 42 di essi risultano conformi. Si richiede di:

# 4.1 
# Costruire un intervallo di confidenza al 95% per il parametro p, utilizzando
# l’approssimazione normale.

# --- DATI DI INPUT ---
n <- 50             # Dimensione del campione
x <- 42             # Numero di successi (conformi)
p_hat <- x / n      # Proporzione campionaria stimata
alpha <- 0.05       # Livello di significatività (per il 95%)

# --- PUNTO 1: INTERVALLO DI CONFIDENZA (WALD) ---

# 1. Calcolo del quantile Z critico per il 95% (coda 0.025 per parte)
z_critico <- qnorm(1 - alpha / 2)

# 2. Calcolo dell'Errore Standard (SE) usando p_hat
SE_hat <- sqrt((p_hat * (1 - p_hat)) / n)

# 3. Calcolo dei limiti inferiore e superiore
IC_lower <- p_hat - z_critico * SE_hat
IC_upper <- p_hat + z_critico * SE_hat

# --- PUNTO 2: TEST D'IPOTESI ---

p0 <- 0.90  # Valore sotto H0

# 1. Calcolo dell'Errore Standard sotto H0
SE_0 <- sqrt((p0 * (1 - p0)) / n)

# 2. Calcolo della statistica test Z
Z_stat <- (p_hat - p0) / SE_0

# 3. Calcolo del P-value
# Poiché H1 è p < p0 (coda sinistra), calcoliamo l'area a sinistra di Z_stat
p_value <- pnorm(Z_stat)

# Output
cat("Statistica Test Z:", round(Z_stat, 4), "\n")
cat("P-value:", round(p_value, 4), "\n")

# Decisione automatica
if(p_value < alpha) {
  print("Rifiuto H0: C'è evidenza statistica che la proporzione sia inferiore a 0.90")
} else {
  print("Non rifiuto H0: Non c'è sufficiente evidenza per dire che la proporzione sia inferiore a 0.90")
}


# ESERCIZIO 3 (generato da Gemini)
# Simile all'esercizio presente nella simulazione del 18 dicembre,
# ma focalizzato sull'ANOVA a due vie invece che sulla regressione.

# Il dataset mtcars contiene dati su prestazioni e caratteristiche di automobili. 
# Si vuole studiare se l'accelerazione (qsec) dipenda dal tipo di trasmissione (am: 0=automatico, 1=manuale) 
# e dal numero di marce (gear).
# Assicurarsi di convertire am e gear in fattori prima dell'analisi.

data("mtcars")

# 3.1
# Costruire una tabella che mostri la media e la deviazione standard di qsec
# per ogni combinazione di trasmissione e marce.

mtcars$am <- factor(mtcars$am)
mtcars$gear <- factor(mtcars$gear)
library(tidyverse)

tabella <- mtcars |> 
  group_by(am, gear) |> 
  summarise(medie_cond = mean(qsec),
            sd_cond = sd(qsec))

tabella

# 3.2 
# Produrre un grafico (boxplot o interaction plot) che mostri la relazione tra qsec, 
# am e gear. Commentare se visivamente sembra esserci un'interazione 
# (es. se le linee si incrociano o se l'effetto delle marce cambia in base alla trasmissione).

mtcars |> 
  group_by(am,gear) |> 
  summarise(medie_cond = mean(qsec)) |> 
  ggplot(aes(x = gear, y = medie_cond, col = am, group = am)) +
  geom_point() + geom_line() + theme_minimal()

# Dal grafico di interazione si osserva una particolarità del disegno sperimentale (sbilanciato): 
# le auto automatiche (am=0) presentano solo 3 o 4 marce, mentre le manuali (am=1) 
# ne hanno 4 o 5. L'unico punto di sovrapposizione è a 4 marce, 
# dove le auto automatiche risultano nettamente più lente (qsec più alto) 
# rispetto a quelle manuali.
# Osservando le pendenze: per le auto automatiche, passare da 3 a 4 marce fa aumentare 
# il tempo qsec (peggiore accelerazione), mentre per le manuali, passare da 4 a 5 marce 
# fa diminuire il tempo (migliore accelerazione). Queste pendenze discordanti 
# (una sale, l'altra scende) suggeriscono una forte interazione tra trasmissione e
# numero di marce, anche se il modello non è un fattoriale completo.

# 3.3
# Eseguire un'analisi della varianza (ANOVA) a due vie col modello: qsec ~ am * gear.
# Verificare le ipotesi:
  # Effetto della trasmissione;
  # Effetto delle marce;
  # Interazione trasmissione-marce.

modello_aov <- aov(qsec ~ am * gear, 
                    data = mtcars)
summary(modello_aov)

# la trasmissione am non è significativa -> p_value = 0.106 > 0.05
# stessa cosa per la marcia -> p_value = 0.721 >> 0.05
# l'interazione tra trasmissione e marcia è significativa -> p_value = 6.77 x 10^-5 << 0.05 ***

# 3.4 
# Sulla base dei risultati ANOVA (α=0.05), determinare se è necessario procedere 
# con l'analisi post-hoc di Tukey e, in caso affermativo, eseguirla indicando quale 
# coppia di gruppi presenta la differenza più marcata.

# Dato che l'interazione tra am e gear è significativa è opportuno eseguire il test di Tukey

mtcars$am <- factor(mtcars$am)
mtcars$gear <- factor(mtcars$gear) 

tukey <- TukeyHSD(modello_aov)
tukey
