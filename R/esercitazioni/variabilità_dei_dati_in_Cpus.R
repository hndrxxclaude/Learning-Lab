# ===================================================================
# Analisi della variabilità e dell’asimmetria dei dati in Cpus_data
# ===================================================================

# Pulizia dell’ambiente
rm(list = ls())

# Importazione del dataset
df <- read.csv2("Cpus_data.csv")

# ---------------------------------------------------------------
# 1. VARIABILITÀ DELLE VARIABILI RCP e CS
# ---------------------------------------------------------------

# Estrazione delle variabili di interesse
RCP <- df$Recommended_Customer_Price
CS  <- df$Cache_Size
n   <- nrow(df)

# --- Varianza (formula con denominatore n) ---
var_RCP <- var(RCP) * (n - 1) / n
var_CS  <- var(CS)  * (n - 1) / n
# In alternativa:
# var_RCP <- sum((RCP - mean(RCP)) ^ 2) / n
# var_CS  <- sum((CS  - mean(CS))  ^ 2) / n

# --- Deviazione standard ---
sd_RCP <- sqrt(var_RCP)
sd_CS  <- sqrt(var_CS)

# --- Coefficiente di variazione (CV = sd / media) ---
cv_RCP <- sd_RCP / mean(RCP)
cv_CS  <- sd_CS  / mean(CS)

# ---------------------------------------------------------------
# 2. VARIABILITÀ CONDIZIONATA A "Product_Collection"
# ---------------------------------------------------------------

# Varianza condizionata (non corretta)
var_cond <- tapply(RCP, df$Product_Collection, var)

# Funzione per calcolare la varianza corretta (moltiplicando per (m-1)/m)
var_corr <- function(x) {
  n <- length(x)
  var(x) * (n - 1) / n
}

# Applicazione funzione di correzione
var_corretta <- tapply(RCP, df$Product_Collection, var_corr)

# Media condizionata
mean_cond <- tapply(RCP, df$Product_Collection, mean)

# Deviazione standard corretta
sd_corr <- sqrt(var_corretta)

# --- Coefficiente di variazione condizionato ---
coef_var <- function(x) {
  n  <- length(x)
  sd_corr <- sd(x) * sqrt((n - 1) / n)
  sd_corr / mean(x)
}

cv_cond <- tapply(RCP, df$Product_Collection, coef_var)
# In alternativa:
# cv_cond <- sd_corr / mean_cond

# ---------------------------------------------------------------
# 3. INDICE DI ETEROGENEITÀ di "Product_Collection"
# ---------------------------------------------------------------

PC <- df$Product_Collection

# Frequenze relative
freq_rel <- table(PC) / length(PC)

# Indice di Gini
gini <- 1 - sum(freq_rel ^ 2)

# Gini normalizzato
j <- length(freq_rel)
gini_norm <- gini / ((j - 1) / j)

# ---------------------------------------------------------------
# 4. ANALISI DELL’ASIMMETRIA DELLA VARIABILE RCP
# ---------------------------------------------------------------

# --- Boxplot ---
boxplot(RCP)

# Interpretazione:
# - Asimmetria positiva (a destra)
# - Media > Mediana > Moda
# - Possibile presenza di outlier ad alto valore

# --- Confronto media e mediana ---
mean_RCP   <- mean(RCP)
median_RCP <- median(RCP)

# --- Indice di asimmetria ---
# Necessita del pacchetto labstatR (oppure calcolo manuale)
# install.packages("labstatR") # se non già installato
skew_RCP <- skew(RCP)

# Calcolo manuale (alternativa)
# skew_RCP <- mean((RCP - mean(RCP))^3) / (sqrt(mean((RCP - mean(RCP))^2))^3)