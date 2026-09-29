library(labstatR)

# --- Funzioni Helper Definite dall'Utente ---
# (Spostate dall'originale fondo del file alla cima per chiarezza)

# Calcola il coefficiente di variazione (basato sulla varianza della popolazione, n)
coef_var <- function(k) {
  n <- length(k)
  # Calcola la dev. std. della popolazione (divisione per n)
  s_d <- sd(k) * sqrt((n - 1) / n)
  s_d / mean(k)
}

# Calcola la varianza della popolazione (divisione per n)
var_corr <- function(k) {
  n <- length(k)
  # Converte la var. campionaria (n-1) in var. della popolazione (n)
  var(k) * (n - 1) / n
}


# --- Caricamento Dati ---
df <- read.csv2("Cpus_data.csv")


# --- 1. Varianza e CV di 'Recommended_Customer_Price' e 'Cache_Size' ---

RCP <- df$Recommended_Customer_Price
CS <- df$Cache_Size

# Usa le funzioni helper per calcolare varianza (pop) e CV
var_RCP <- var_corr(RCP)
var_CS <- var_corr(CS)

CV_RCP <- coef_var(RCP)
CV_CS <- coef_var(CS)


# --- 2. CV di 'Recommended_Customer_Price' condizionato a 'Product_Collection' ---

# Calcola medie e varianze (pop) condizionate
medie_condizionate <- tapply(df$Recommended_Customer_Price,
                             df$Product_Collection,
                             mean)

varianze_corrette <- tapply(df$Recommended_Customer_Price,
                            df$Product_Collection,
                            var_corr) # Molto più pulito che ricalcolarlo

# Calcola CV condizionato
deviazione_condizionata <- sqrt(varianze_corrette)
CV_condizionato <- deviazione_condizionata / medie_condizionate


# --- 3. Indice di Eterogeneità (Gini) per 'Product_Collection' ---

# Frequenze relative
freq_rel <- table(df$Product_Collection) / dim(df)[1]

# Indice di Gini
eterogeneità <- 1 - sum(freq_rel^2)

# Gini normalizzato
m <- length(freq_rel)
gini_normalizzato <- eterogeneità / ((m - 1) / m)


# --- 4. Analisi di Simmetria per 'Recommended_Customer_Price' ---

# Boxplot
boxplot(df$Recommended_Customer_Price)

# Confronto Media e Mediana
mean(df$Recommended_Customer_Price)
median(df$Recommended_Customer_Price)

# Indice di Asimmetria (Skewness)
skew(df$Recommended_Customer_Price)