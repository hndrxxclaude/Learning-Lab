# ESERCIZIO 4 

# Un'azienda produce energy drink e vuole verificare se la quantità media di caffeina 
# in una bottiglia sia almeno 80 mg. Si misura la quantità di caffeina su un campione casuale
# di 12 bottiglie, ottenendo i seguenti valori (in mg):

campione <- c(78.5, 81.2, 79.8, 82.0,80.5, 79.9, 80.1, 79.7, 81.0, 78.8, 79.5, 80.3)

media_campione <- mean(campione) # media campionaria

n <- length(campione) #dimensione del campione

sd_campione <- sd(campione) #deviazione standard campionaria

# 4.1
# Testare al livello di significatività a = 0.05 l'ipotesi
# Ho: mu =80 vs H1: mu > 80
# La varianza è ignota -> devo usare una T di student 

alpha <- 0.05 # livello di significatività
mu_0 <- 80

# Statistica di test t per campione piccolo e varianza ignota
# t_stat = (X_bar - mu) / (sigma / sqrt(n))

t_stat <- (media_campione - mu_0) / (sd_campione / sqrt(n))
t_stat

# Calcolo del P-Value
# Poiché H1: mu > 80, cerchiamo la probabilità che T sia MAGGIORE del t osservato.
# pt(t_stat, df) restituisce l'area a SINISTRA. Noi vogliamo quella a DESTRA.
df <- n - 1 # Gradi di libertà (12 - 1 = 11)

p_value <- 1 - pt(t_stat, df)
p_value

# il p_value (0.355) è parecchio maggiore di 0.05
# non rifiuto l'ipotesi H0. Non c'è evidenza statistica sufficiente per dire che la media 
# è superiore a 80.

# 4.2
# Costruire un intervallo di confidenza al 95% per la media u.

# Valore critico della distribuzione t di Student
# qt(p, df) restituisce il quantile della t con df gradi di libertà
t_crit <- qt(1 - alpha/2, df)

# Formula per intervallo di confidenza:
# IC = media +/- tcrit * (sd / sqrt(n))
IC <- c(media_campione - t_crit * (sd_campione / sqrt(n)), 
        media_campione + t_crit * (sd_campione / sqrt(n)))
IC

# CONCLUSIONE:
# L'intervallo [79.48, 80.73] INCLUDE il valore 80.
# Questo conferma il test precedente: H0 è plausibile.

# 4.3 
# Costruire un intervallo di confidenza al 95% per la varianza o' 
# e per la deviazione standard

# Per costruire l'intervallo di confidenza per deviazione standard e varianza devo usare 
# la distribuzione Chi-quadrato
# Formula IC per la Varianza:
# IC_var = [(n-1) * s^2 /chi_alto, (n-1) * s^2 / chi_basso] 

chi_alto <- qchisq(1 - alpha / 2, df) # coda sinistra
chi_basso <- qchisq(alpha / 2, df) # coda destra

numeratore <- (n - 1) * sd_campione ^ 2

IC_var <- c(numeratore / chi_alto,
            numeratore / chi_basso)

IC_var

# Per la deviazione standard, basta fare la radice quadrata degli estremi
IC_sd <- sqrt(IC_var)
IC_sd


# ESERCIZIO 1 

library(MASS)
data("Pima.tr") # uso data per caricare il dataset richiesto

# 1.1 

n <- length(Pima.tr$bmi) # numero di osservazioni del dataset, in particolare della variabile bmi
media_bmi <- mean(Pima.tr$bmi) # media per la variabile bmi
media_glu <- mean(Pima.tr$glu) # media per la variabile glu
mediana_bmi <- median(Pima.tr$bmi) # mediana per la variabile bmi
mediana_glu <- median(Pima.tr$glu) # mediana per la variabile glu

summary(Pima.tr$bmi)
# osserviamo che per quanto riguarda la variabile bmi la media e leggermente inferiore 
# alla mediana, supponendo una leggera asimmetria negativa della distribuzione

summary(Pima.tr$glu)
# invece osserviamo il contrario per la variabile glu. la media è di un bel po' maggiore 
# della mediana, suggerendo una distribuzione caratterizzata da un'asimmetria positiva 
# più pronunciata

var_bmi <- var(Pima.tr$bmi) * (n - 1) / n
# moltiplico per n - 1 / n poichè la funzione var mi restituisce la varianza campionaria

var_glu <- var(Pima.tr$glu) * (n - 1) / n

sd_bmi <- sqrt(var_bmi) # per ottenere la deviazione standard mi bastas fare la radice quadrata della varianza
sd_glu <- sqrt(var_glu)

cv_bmi <- (sd_bmi / media_bmi) * 100
cv_bmi
# Il coefficiente di variazione è del 19% circa per la variabile bmi, indicando una 
# variabilità molto contenuta. La dispersione dei dati intorno alla media non è eccessiva

cv_glu <- (sd_glu / media_glu) * 100
cv_glu

# Il coefficiente di variazione è del 25% circa per la variabile glu, indicando una 
# variabilità contenuta. La dispersione dei dati intorno alla media non è eccessiva

library(labstatR)

skewness_bmi <- skew(Pima.tr$bmi)
skewness_bmi
# uso la funzione skew della libreria labstatR che mi dà un indice di skewness,
# ossia di simmetria della distribuzione.
# Sebbene la media sia inferiore alla mediana, l'indice di skewness è prossimo allo zero 
# (leggermente positivo), indicando una distribuzione sostanzialmente simmetrica.

skewness_glu <- skew(Pima.tr$glu)
skewness_glu
# per la variabile glu invece è 0.45 indicando come previsto un'asimmetria positiva
par(mfrow = c(1,2)) # 1 riga, 2 colonne

boxplot(Pima.tr$bmi,
        col = "lightgreen")
# il boxplot verde è per la variabile bmi, si nota che non sono presenti outliers 
# la lunghezza del baffo superiore e quello inferiore è pressochè la stessa

boxplot(Pima.tr$glu,
        col = "lightcoral")
# il boxplot rosso corallo è per la variabile glu, si nota che non sono presenti outliers 
# la lunghezza del baffo superiore e quello inferiore è pressochè la stessa, anche se quello superiore
# è di poco più lungo

# 1.2

# scelgo la variabile age per dividerla in quattro classi di uguale numerosità

table(cut(Pima.tr$age, 
    breaks = quantile(Pima.tr$age, 
                      c(0, 1 / 4, 2 / 4, 3 / 4, 1)),
    include.lowest = TRUE))

# La variabile age presenta una forte asimmetria positiva (coda a destra). 
# La densità di frequenza è molto alta nelle età giovani (per questo l'intervallo è stretto) 
# e molto bassa nelle età avanzate (per questo l'intervallo è largo).

# 1.3 

tabella_assolute <- table(Pima.tr$type)
tabella_assolute

tabella_relative <- prop.table(tabella_assolute)
tabella_relative

# Creo una tabella unica per visualizzare bene i risultati
tabella_freq <- cbind(Assolute = tabella_assolute, Relative = round(tabella_relative, 3))
tabella_freq    

# --- 2. Indice di Eterogeneità di Gini ---

# Formula: G = 1 - somma(frequenze relative ^2)
Gini <- 1 - sum(tabella_relative^2)
Gini

# Per commentare correttamente, calcolo il Gini Normalizzato
# G_norm = Gini / Gini_max
# Dove Gini_max = (k - 1) / k. Qui k = 2 (No, Yes)

k <- length(tabella_assolute) 
Gini_max <- (k - 1) / k
Gini_norm <- Gini / Gini_max

Gini_norm

# COMMENTO:
# L'indice di Gini normalizzato è circa 0.89 (su una scala da 0 a 1).
# Questo indica una *elevata eterogeneità*.
# Le due categorie (Sane/Diabetiche) sono ben rappresentate entrambe, 
# non c'è una categoria che domina in modo schiacciante sull'altra 
# (infatti le percentuali sono circa 66% e 34%).

# 1.4 
# Confrontare la distribuzione della variabile glu condizionatamente a type, 
# utilizzando opportuni indici descrittivi e una rappresentazione grafica adeguata. 
# Commentare le differenze osservate.

media_cond <- tapply(Pima.tr$glu,
                     Pima.tr$type,
                     mean)

mediana_cond <- tapply(Pima.tr$glu,
                     Pima.tr$type,
                     median)

sd_cond <- tapply(Pima.tr$glu,
                  Pima.tr$type,
                  sd)
media_cond
mediana_cond
sd_cond

cv_cond <- tapply(Pima.tr$glu,
                  Pima.tr$type,
                  cv)
cv_cond

# per entrambi i gruppi la media è maggiore della mediana suggerendo una distribuzione con una 
# asimmetria positiva. la media del livello di glucosio nelle donne affette da diabete è sensibilmente
# più alta di quella del gruppo di donne non affette.
# il coefficente di variazione è molto simile per entrambi i gruppi (23% No e 20% si) indicando 
# una variabilità contenuta dei dati per entrambi i gruppi


par(mfrow = c(1,1))
# --- 2. Rappresentazione Grafica (Boxplot) ---

# Il grafico migliore è il Boxplot affiancato
boxplot(glu ~ type, 
        data = Pima.tr,
        col = c("lightblue", "salmon"),
        main = "Distribuzione Glucosio per Stato Diabetico",
        xlab = "Diabete (Type)",
        ylab = "Concentrazione Glucosio (glu)")

# dal boxplot vengono confermate tutte le ipotesi precedenti.
# per il gruppo di donne non affette tuttavia si osservano diversi outliers

# 1.5 
# Analizzare la relazione tra le variabili glu e bmi:
# • rappresentare la relazione mediante un diagramma di dispersione;
# • calcolare il coefficiente di correlazione di Pearson e commentarne segno e intensità;
# • adattare un modello di regressione lineare semplice, interpretando i coefficienti stimati;
# • valutare la significatività statistica dei parametri e la bontà complessiva del modello;
# • condurre un'analisi dei residui;

plot(glu ~ bmi,
     data = Pima.tr,
     pch = 19, col = "red",
     main = "Relazione glu ~ bmi") # scatterplot
# dallo scatterplot sembra esserci una relazione lineare positiva tra le due variabili,
# anche se non sembra essere molto forte. all'aumentare del bmi sembra aumentare anche il livello di glucosio

cor(Pima.tr$glu, Pima.tr$bmi) 
# il coefficeiente di correlazione di Pearson è di 0.217 circa.
# ciò conferma la presenza di una relazione lineare positiva tra le due variabili,
# anche se molto debole (è più vicina a 0 che a 1). la linea non avrà molta pendenza, 
# sarà quasi orizzontale

modello <- lm(glu ~ bmi, 
              data = Pima.tr)
abline(modello, col = "blue", lwd = 2)

summary(modello)
# l'intercetta (87.78) in questo caso non ha un significato statistico. infatti essa rappresenta
# il valore che avrebbe il glucosio plasmatico in una donna con bmi = 0 (impossibile)
# il valore estimate nella riga di bmi indica che per un aumento unitario della variabile bmi
# glu aumenta di 1.12
#il pvalue (0.002 < 0.05) conferma la significatività del coefficiente di regressione, anche se non è un valore
# estremamente basso
# il coefficiente di bontà di adattamento R^2 invece è estremamente basso (0.04). Il modello
# spiega solamente il 4% della variabilità del glucosio plasmatico, confermando che la relazione
# tra le due variabili non è molto forte e che il bmi non è un predittore rilevante per la variabile
# glu

#analisi dei residui
par(mfrow = c(1,1))
plot(modello)

# Residuals vs Fitted: serve a verificare l'ipotesi di linearità.
# I punti dovrebbero essere distribuiti casualmente attorno alla linea 
# orizzontale dello 0, senza pattern evidenti. è questo il caso

# Normal Quantile - Quantile: serve a verificare l'ipotesi di normalità dei residui.
# I punti dovrebbero giacere sulla bisettrice tratteggiata.
# nel nostro caso si notano delle lievi deviazioni sulle code ma nel 
# complesso l'ipotesi di normalità degli errori appare plausibile.

# Scale - Location: serve a verificare l'ipotesi di omoschedasticità, ossia di
# varianza costante degli errori. La linea rossa dovrebbe essere orizzontale e 
# e i punti sparsi uniformemente. è questo il caso

# Residuals vs Leverage: Serve a identificare outliers e punti influenti.
# Bisogna guardare se qualche punto supera la distanza di Cook
# non si evidenziano punti che oltrepassano la distanza di Cook critica (le linee tratteggiate agli angoli, se presenti). 
# Pertanto, non sembrano esserci osservazioni influenti che stanno distorcendo 
# in modo significativo i coefficienti del modello.


# ESERCIZIO 3

library(tidyverse)
# Creazione della variabile npreg_cat usando i quantili (0 - 33% - 66% - 100%)
# cut() divide la variabile in intervalli
Pima.tr$npreg_cat <- cut(Pima.tr$npreg,
                         breaks = quantile(Pima.tr$npreg, probs = c(0, 1 / 3, 2 / 3, 1)),
                         include.lowest = TRUE,
                         labels = c("basso", "medio", "alto"))
  
table(Pima.tr$npreg_cat)

# 3.1 e 3.2

# Media per fattore 'type' (Già vista, ma richiesta)
medie_type <- Pima.tr |> 
  group_by(type) |> 
  summarise(media_glu = mean(glu))

boxplot(glu ~ type,
        data = Pima.tr, col = "lightgreen")

# Media per fattore 'npreg_cat'
medie_npreg_cat <- Pima.tr |>
  group_by(npreg_cat) |> 
  summarise(media_glu = mean(glu))

boxplot(glu ~ npreg_cat,
        data = Pima.tr, col = "lightcoral")
# Dal boxplot emerge che il livello di glucosio plasmatico sembra essere pressochè 
# invariato tra i gruppi di donne con un numero basso e medio di gravidanze, con qualche
# outlier in quest'ultimo gruppo, mentre la media è più alta nelle donne con un numero alto di 
# gravidanze

# Media per interazione 
medie_interaction <- Pima.tr |>
  group_by(type, npreg_cat) |>
  summarise(mean_glu = mean(glu))

boxplot(glu ~ type * npreg_cat,
data = Pima.tr, col = "purple")
# da questo boxplot emerge che come precedentemente osservato i gruppi di donne affette dal
# diabete ha livelli di glu maggiori di donne che non lo hanno a prescindere dal numero di 
# gravidanze. Non sembra comunque esserci una relazione tra le due variabili in quanto non 
# c'è un pattern che possa evidenziare un aumento di glu all'aumento di gravidanze o qualsiasi
# altra correlazione

medie_type
medie_npreg_cat
medie_interaction

# dalle tabelle, le medie confermano le ipotesi. c'è solo un lieve aumento nelle medie che sembra essere
# lineare all'aumentare del numero di gravidanze nelle donne non affette da diabete.

# Interaction plot

Pima.tr |>
  group_by(type, npreg_cat) |>
  summarise(medie_cond = mean(glu)) |>
  ggplot(aes(x = type, y = medie_cond, color = npreg_cat, group = npreg_cat)) + 
  geom_point() + geom_line() +
  theme_minimal() + 
  labs(y = "Medie di glu")
# dal grafico si nota che c'è una forte interazzione tra le variabili type e npreg_cat
# nel caso in cui le donne non sono affette da diabete e hanno un basso numero di gravidanze

# --- 2. Grafico Boxplot ---

ggplot(Pima.tr, aes(x = npreg_cat, y = glu, fill = type)) +
  geom_boxplot() +
  scale_fill_manual(values = c("lightblue", "lightcoral")) +
  labs(title = "Distribuzione Glucosio per N. Gravidanze e Diabete",
       x = "Numero Gravidanze (Categorizzato)",
       y = "Concentrazione Glucosio (glu)",
       fill = "Diabete (Type)") +
  theme_minimal()

# 3.3 
#Eseguire un'analisi della varianza (ANOVA) a due vie per verificare:
#• l'effetto principale della variabile type;
#• leffetto principale della variabile npreg cat;
#• l'eventuale presenza di interazione tra i due fattori.

# Il modello considera gli effetti principali E l'interazione
anova_model <- aov(glu ~ type * npreg_cat, data = Pima.tr)

summary(anova_model)
# dall'ANOVA a due vie è emerso che ad essere statisticamente significativa è solo 
# la variabile type (p_value estremamente piccolo ( < 0.001) ***)
# per la variabile npreg_cat il p_valore è troppo grande per essere considerata significativa
# 0.738 > 0.05 e lo stesso vale per l'effetto dell'interazione tra le variabili type e npre_cat
# 0.141 > 0.05

# 3.4
# "Non è necessario procedere con un test post-hoc di Tukey complesso. 
# L'interazione e la variabile npreg_cat non sono significative. 
# Per la variabile type, essendo significativa ma avendo solo due livelli (Yes vs No), 
# l'ANOVA ci dice già che le medie sono diverse, rendendo il confronto a coppie ridondante 
# (anche se confermerebbe il risultato)."

tukey_test <- TukeyHSD(anova_model)
tukey_test

