#Esercizio 1

n <- 30
mu <- 2
sigma2 <- 1.44
sigma <- sqrt(sigma2)
alpha <- 0.05

# a) Con sigma noto
campione <- rnorm(n, mean = mu, sd = sigma)
X_bar <- mean(campione)

TS <- (X_bar - mu) / (sigma / sqrt(n))
z_crit <- qnorm(1 - (alpha / 2))

if(abs(TS) > z_crit) {
  cat("Decisione: |Z_oss| =", round(abs(TS), 3), ">", round(z_crit, 3), 
      "→ RIFIUTO H₀\n\n")
} else {
  cat("Decisione: |Z_oss| =", round(abs(TS), 3), "≤", round(z_crit, 3), 
      "→ NON RIFIUTO H₀\n\n")
}

# b) Con sigma ignoto
df <- n - 1
S2 <- var(campione)
S <- sqrt(S2)

TSI <- (X_bar - mu) / (S / sqrt(n))
z_crit_t <- qt(1 - (alpha / 2), df) 

if(abs(TSI) > z_crit_t) {
  cat("Decisione: |Z_oss| =", round(abs(TSI), 3), ">", round(z_crit_t, 3), 
      "→ RIFIUTO H₀\n\n")
} else {
  cat("Decisione: |Z_oss| =", round(abs(TSI), 3), "≤", round(z_crit_t, 3), 
      "→ NON RIFIUTO H₀\n\n")
}

# c) Verifica l'errore di prima specie alpha

B <- 10000

rifiuti <- logical(B)
p_valori <- numeric(B)

for (i in 1:B) {
  campioni <- rnorm(n, mean = mu, sd = sigma)
  
  test <- t.test(campioni, mu = mu)
  p_valori[i] <- test$p.value
  rifiuti[i] <- test$p.value < alpha
}

n_true <- sum(rifiuti)
n_false <- sum(!rifiuti)
percentuale <- n_true / B

verifica_errore_1_specie <- abs(percentuale - alpha)

# L'errore di prima specie è verificato in quanto fissato alpha 0,05 e presi 10000 campioni
# l'ipotesi H0 è stata rifiutata nel 4,94% dei casi

# d) Calcola la potenza del test per H1 : mu = 1.8

mu_vera <- 1.8

rifiuti_H1 <- logical(B)
p_values_H1 <- numeric(B)

for(i in 1:B) {
  campione <- rnorm(n, mu_vera, sigma)
  
  test <- t.test(campione, mu = mu)
  p_values_H1[i] <- test$p.value
  rifiuti_H1[i] <- (test$p.value < alpha)
}

potenza <- mean(rifiuti_H1)

# --- e) ANALISI E INTERPRETAZIONE DELLA POTENZA (MEMENTO) ---

# Calcoliamo Beta (Probabilità di Errore di II specie: Falso Negativo)
beta <- 1 - potenza

cat("========================================\n")
cat(" RISULTATI ANALISI POTENZA (H1: mu=1.8)\n")
cat("========================================\n")
cat("Potenza calcolata (1 - Beta):", round(potenza, 4), 
    "-->", round(potenza * 100, 2), "%\n")
cat("Rischio Beta (Falso Negativo):", round(beta, 4), 
    "-->", round(beta * 100, 2), "%\n\n")

# Logica di interpretazione automatica
if(potenza < 0.20) {
  cat("INTERPRETAZIONE: POTENZA BASSA (Test 'Debole')\n")
  cat("----------------------------------------------\n")
  cat("1. COSA SIGNIFICA: Il test è poco sensibile. Se la media reale è scesa\n")
  cat("   a 1.8, hai solo il 14% di probabilità di accorgertene e rifiutare H0.\n")
  cat("   Nell'86% dei casi (Beta), il test fallirà e ti dirà erroneamente che\n")
  cat("   la media è ancora 2.0.\n\n")
  
  cat("2. PERCHÉ SUCCEDE: C'è troppo 'rumore' rispetto al 'segnale'.\n")
  cat("   - Segnale (Delta): |2.0 - 1.8| = 0.2 (Differenza molto piccola)\n")
  cat("   - Rumore (Sigma): 1.2 (Deviazione standard alta)\n")
  cat("   - Campione (n): 30 (Troppo pochi per vedere una diff così piccola in mezzo a tanto rumore).\n")
} else if (potenza > 0.80) {
  cat("INTERPRETAZIONE: POTENZA ALTA (Test 'Forte')\n")
  cat("Il test è molto affidabile nel rilevare questa differenza.\n")
} else {
  cat("INTERPRETAZIONE: POTENZA MEDIA.\n")
}

# -------------------------------------------------------------------------
# NOTE PER IL FUTURO (DA LEGGERE NEL CODICE):
# -------------------------------------------------------------------------
# - Potenza (1-Beta): Capacità di trovare l'ago nel pagliaio (rifiutare H0 quando è falsa).
# - Qui la potenza è bassa (0.14) perché le due campane (H0 e H1) sono
#   quasi sovrapposte. È difficile distinguere se un dato viene da media 2.0
#   o da media 1.8 perché la sigma (1.2) "spancia" le curve.
# - Soluzione per alzare la potenza: Aumentare n (dimensione campione).
# -------------------------------------------------------------------------


# =========================================================================

# Esercizio 2

# --- DATI ---
n <- 40
mu_h0 <- 1.2
sigma2 <- 0.25
sigma <- sqrt(sigma2) # 0.5
alpha <- 0.01

# Generiamo il campione
set.seed(123) # Opzionale: per risultati riproducibili
campione <- rnorm(n, mean = mu_h0, sd = sigma)
X_bar <- mean(campione)

# --- PUNTO 1: Sigma NOTO (Z-Test) ---

# 1. Calcolo Statistica Z
# Formula: (Media_Camp - Media_H0) / (Sigma / sqrt(n))
Z_oss <- (X_bar - mu_h0) / (sigma / sqrt(n))

# 2. Valore Critico (Coda Destra perché H1: mu > 1.2)
# Usiamo qnorm perché è una normale standard
z_crit <- qnorm(1 - alpha) 

# 3. P-Value (Area a destra di Z_oss nella normale)
p_value_z <- 1 - pnorm(Z_oss)

# Decisione
cat("--- Risultati Z-Test (Sigma Noto) ---\n")
cat("Z osservato:", Z_oss, "\n")
cat("Z critico:", z_crit, "\n")
cat("P-value:", p_value_z, "\n")

if (p_value_z < alpha) {
  cat("Decisione: RIFIUTO H0\n")
} else {
  cat("Decisione: NON RIFIUTO H0\n")
}

# PUNTO 2: Con sigma ignoto

df <- n - 1
S2 <- var(campione)
S <- sd(campione)

TS <- (X_bar - mu_h0) / (S / sqrt(n))
z_crit_t <- qt(1 - alpha, df)

if(TS > z_crit_t) {
  cat("Decisione: |Z_oss| =", round(TS, 3), ">", round(z_crit_t, 3), 
      "→ RIFIUTO H₀\n\n")
} else {
  cat("Decisione: |Z_oss| =", round(TS, 3), "≤", round(z_crit_t, 3), 
      "→ NON RIFIUTO H₀\n\n")
}

# PUNTO 3: Verifica l'errore di prima specie alpha

B <- 10000

rifiuti <- logical(B)
p_valori <- numeric(B)

for (i in 1:B) {
  campioni <- rnorm(n, mean = mu_h0, sd = sigma)
  
  test <- t.test(campioni,
                 mu = mu_h0,
                 alternative = "greater",
                 conf.level = 0.99)
  p_valori[i] <- test$p.value
  rifiuti[i] <- test$p.value < alpha
}

percentuale <- mean(rifiuti)

verifica_errore_1_specie <- abs(percentuale - alpha)

if (verifica_errore_1_specie < 0.1) {
  cat("L'errore di prima specie è verificato!")
} else {
  cat("L'errore alpha non è verificato.")
}

# PUNTO 4: Supponi H1 : mu = 1.5 e calcola la potenza del test

mu_vero <- 1.5

rifiuti_H1 <- logical(B)
p_valori_H1 <- numeric(B)

for (i in 1:B) {
  campioni_H1 <- rnorm(n, mean = mu_vero, sd = sigma)
  
  test_H1 <- t.test(campioni_H1,
                    mu = mu_h0,
                    alternative = "greater",
                    conf.level = 0.99)
  p_valori_H1[i] <- test_H1$p.value
  rifiuti_H1[i] <- test_H1$p.value < alpha
}

potenza <- mean(rifiuti_H1)


# ESERCIZIO 3

# PUNTO 1: Con sigma noto

mu <- -0.5
sigma2 <- 0.49
sigma <- sqrt(sigma2)
n <- 25
alpha <- 0.05

campione <- rnorm(n, mean = mu, sd = sigma)
X_bar <- mean(campione)

Z_obs <- (X_bar - mu) / (sigma / sqrt(n))

Z_crit <- qnorm(1 - (alpha / 2))

if(abs(Z_obs) > Z_crit) {
  cat("Decisione: |Z_oss| =", round(abs(Z_obs), 3), ">", round(Z_crit, 3), 
      "→ RIFIUTO H₀\n\n")
} else {
  cat("Decisione: |Z_oss| =", round(abs(Z_obs), 3), "≤", round(Z_crit, 3), 
      "→ NON RIFIUTO H₀\n\n")
}

# PUNTO 2: Con sigma ignoto

df <- n - 1
S <- sd(campione)

Z_obs_t <- (X_bar - mu) / (S / sqrt(n))
Z_crit_t <- qt(1 - (alpha / 2), df)

if(abs(Z_obs_t) > Z_crit_t) {
  cat("Decisione: |Z_oss| =", round(abs(Z_obs_t), 3), ">", round(Z_crit_t, 3), 
      "→ RIFIUTO H₀\n\n")
} else {
  cat("Decisione: |Z_oss| =", round(abs(Z_obs_t), 3), "≤", round(Z_crit_t, 3), 
      "→ NON RIFIUTO H₀\n\n")
}

# PUNTO 3: Verifica sotto H0 che alpha = 0,05

B <- 10000

rifiuti <- logical(B)
p_valori <- numeric(B)

for (i in 1:B) {
  campioni <- rnorm(n, mean = mu, sd = sigma)
  
  test <- t.test(campioni, mu = mu)
  p_valori[i] <- test$p.value
  rifiuti[i] <- test$p.value < alpha
}

percentuale <- mean(rifiuti)
verifica_errore_1_specie <- abs(percentuale - alpha)

if (verifica_errore_1_specie < 0.1) {
  cat("L'errore di prima specie è verificato!")
} else {
  cat("L'errore alpha non è verificato.")
}

# PUNTO 4: Per H1 : mu = -0,7, calcola la potenza del test

mu_vero <- -0.7

rifiuti_H1 <- logical(B) 
p_valori_H1 <- numeric(B)

for (i in 1:B) {
  campioni_H1 <- rnorm(n, mean = mu_vero, sd = sigma)
  
  test_H1 <- t.test(campioni_H1, mu = mu)
  p_valori_H1[i] <- test_H1$p.value
  rifiuti_H1[i] <- test_H1$p.value < alpha
}

potenza <- mean(rifiuti_H1)

# ESERCIZIO 4

# PUNTO 1: Con sigma noto

n <- 60
mu <- 100
sigma2 <- 64
sigma <- sqrt(sigma2)
alpha <- 0.05

campione <- rnorm(n, mean = mu, sd = sigma)
X_bar <- mean(campione)

Z_obs <- (X_bar - mu) / (sigma / sqrt(n))

Z_crit <- qnorm(alpha)

if(Z_obs < Z_crit) {
  cat("Decisione: |Z_oss| =", round(Z_obs, 3), ">", round(Z_crit, 3), 
      "→ RIFIUTO H₀\n\n")
} else {
  cat("Decisione: |Z_oss| =", round(Z_obs, 3), "≤", round(Z_crit, 3), 
      "→ NON RIFIUTO H₀\n\n")
}

# PUNTO 2: Con sigma ignoto
df <- n - 1
S <- sd(campione)

Z_obs_t <- (X_bar - mu) / (S / sqrt(n))
Z_crit_t <- qt(alpha, df)

if(Z_obs_t < Z_crit_t) {
  cat("Decisione: |Z_oss| =", round(Z_obs_t, 3), ">", round(Z_crit_t, 3), 
      "→ RIFIUTO H₀\n\n")
} else {
  cat("Decisione: |Z_oss| =", round(Z_obs_t, 3), "≤", round(Z_crit_t, 3), 
      "→ NON RIFIUTO H₀\n\n")
}

# PUNTO 3: Verificare che l'errore di prima specie è pari ad alpha

B <- 10000
rifiuti <- logical(B)
p_valori <- numeric(B)

for (i in 1:B) {
  campioni <- rnorm(n, mean = mu, sd = sigma)
  
  test <- t.test(campioni,
                 mu = mu,
                 alternative = "less")
  p_valori[i] <- test$p.value
  rifiuti[i] <- test$p.value < alpha
}

percentuale <- mean(rifiuti)
verifica <- abs(percentuale - alpha)
if(verifica == 0) {
  cat("L'errore di prima specie è pari ad alpha!")
} else {
  cat("L'errore di prima specie non è pari ad alpha.")
}

# PUNTO 4: Calcola la potenza per H1 : mu = 98

mu_vero <- 98
rifiuti_H1 <- logical(B)
p_valori_H1 <- numeric(B)

for (i in 1:B) {
  campioni_H1 <- rnorm(n, mean = mu_vero, sd = sigma)
  
  test_H1 <- t.test(campioni_H1, 
                    mu = mu,
                    alternative = "less")
  
  p_valori_H1[i] <- test_H1$p.value
  rifiuti_H1[i] <- test_H1$p.value < alpha
}

potenza <- mean(rifiuti_H1)


# ESERCIZIO 5

# PUNTO 1: Con sigma noto 

n <- 35
mu <- 15
sigma2 <- 9
sigma <- sqrt(sigma2)
alpha <- 0.1

set.seed(123)
campione <- rnorm(n, mean = mu, sd = sigma)

X_bar <- mean(campione)

Z_obs <- (X_bar - mu) / (sigma / sqrt(n))
Z_crit <- qnorm(1 - alpha)

if (Z_obs > Z_crit) {
  cat("Rifiuto!")
} else {
  cat("Non rifiuto.")
}

# PUNTO 2: Con sigma ignoto

df <- n - 1 
S <- sd(campione)

TS <- (X_bar - mu) / (S / sqrt(n))
Z_crit_t <- qt(1 - alpha, df)

if (TS > Z_crit_t) {
  cat("Rifiuto!")
} else {
  cat("Non rifiuto.")
}

# PUNTO 3: Verifica che l'errore di prima specie alpha è corretto

B <- 10000
rifiuti <- logical(B)
p_valori <- numeric(B)

for (i in 1:B) {
  campioni <- rnorm(n, mean = mu, sd = sigma)
  
  test <- t.test(campioni,
                 mu = mu,
                 alternative = "greater")
  p_valori[i] <- test$p.value
  rifiuti[i] <- test$p.value < alpha
}

percentuale <- mean(rifiuti)
verifica <- abs(percentuale - alpha)

if(verifica < 0.01) {
  cat("L'errore di prima specie alpha è verificato!")
} else {
  cat("L'errore di prima specie alpha non è verificato.")
}

# PUNTO 4: Calcola la potenza per H1 : mu = 16

mu_vero = 16
rifiuti_H1 <- logical(B)
p_valori_H1 <- numeric(B)

for (i in 1:B) {
  campioni_H1 <- rnorm(n, mean = mu_vero, sd = sigma)
  
  test_H1 <- t.test(campioni_H1,
                    mu = mu,
                    alternative = "greater")
  p_valori_H1[i] <- test_H1$p.value
  rifiuti_H1[i] <- test_H1$p.value < alpha
}

potenza <- mean(rifiuti_H1)
cat("Potenza calcolata:", potenza, "\n")


# ESERCIZIO 6

# PUNTO 1: Con sigma noto 

n <- 50
mu <- -2.0
sigma2 <- 4
sigma <- sqrt(sigma2)
alpha <- 0.01

set.seed(123)
campione <- rnorm(n, mean = mu, sd = sigma)

X_bar <- mean(campione)

Z_obs <- (X_bar - mu) / (sigma / sqrt(n))
Z_crit <- qnorm(1 - (alpha / 2))

if (abs(Z_obs) > Z_crit) {
  cat("Rifiuto!")
} else {
  cat("Non rifiuto.")
}

# PUNTO 2: Con sigma ignoto

df <- n - 1 
S <- sd(campione)

TS <- (X_bar - mu) / (S / sqrt(n))
Z_crit_t <- qt(1 - (alpha / 2), df)

if (abs(TS) > Z_crit_t) {
  cat("Rifiuto!")
} else {
  cat("Non rifiuto.")
}

# PUNTO 3: Verifica alpha sotto H0

B <- 10000
rifiuti <- logical(B)
p_valori <- numeric(B)

for (i in 1:B) {
  campioni <- rnorm(n, mean = mu, sd = sigma)
  
  test <- t.test(campioni,
                 mu = mu,
                 alternative = "two.sided")
  p_valori[i] <- test$p.value
  rifiuti[i] <- test$p.value < alpha
}

percentuale <- mean(rifiuti)
verifica <- abs(percentuale - alpha)

if(verifica < 0.01) {
  cat("L'errore di prima specie alpha è verificato!")
} else {
  cat("L'errore di prima specie alpha non è verificato.")
}

# PUNTO 4: Calcola la potenza per H1 : mu = -1,5

mu_vero = -1.5
rifiuti_H1 <- logical(B)
p_valori_H1 <- numeric(B)

for (i in 1:B) {
  campioni_H1 <- rnorm(n, mean = mu_vero, sd = sigma)
  
  test_H1 <- t.test(campioni_H1,
                    mu = mu,
                    alternative = "two.sided")
  p_valori_H1[i] <- test_H1$p.value
  rifiuti_H1[i] <- test_H1$p.value < alpha
}

potenza <- mean(rifiuti_H1)
cat("Potenza calcolata:", potenza, "\n")


# ESERCIZIO 7

# PUNTO 1: Con sigma noto 

n <- 100
mu <- 50
sigma2 <- 100
sigma <- sqrt(sigma2)
alpha <- 0.05

set.seed(123)
campione <- rnorm(n, mean = mu, sd = sigma)

X_bar <- mean(campione)

Z_obs <- (X_bar - mu) / (sigma / sqrt(n))
Z_crit <- qnorm(alpha)

if (Z_obs < Z_crit) {
  cat("Rifiuto!")
} else {
  cat("Non rifiuto.")
}

# PUNTO 2: Con sigma ignoto

df <- n - 1 
S <- sd(campione)

TS <- (X_bar - mu) / (S / sqrt(n))
Z_crit_t <- qt(alpha, df)

if (TS < Z_crit_t) {
  cat("Rifiuto!")
} else {
  cat("Non rifiuto.")
}

# PUNTO 3: Verifica l'errore di prima specie alpha

B <- 10000
rifiuti <- logical(B)
p_valori <- numeric(B)

for (i in 1:B) {
  campioni <- rnorm(n, mean = mu, sd = sigma)
  
  test <- t.test(campioni,
                 mu = mu,
                 alternative = "less")
  p_valori[i] <- test$p.value
  rifiuti[i] <- test$p.value < alpha
}

percentuale <- mean(rifiuti)
verifica <- abs(percentuale - alpha)

if(verifica < 0.01) {
  cat("L'errore di prima specie alpha è verificato!")
} else {
  cat("L'errore di prima specie alpha non è verificato.")
}

# PUNTO 4: Calcola la potenza per H1 : mu = 48

mu_vero = 48
rifiuti_H1 <- logical(B)
p_valori_H1 <- numeric(B)

for (i in 1:B) {
  campioni_H1 <- rnorm(n, mean = mu_vero, sd = sigma)
  
  test_H1 <- t.test(campioni_H1,
                    mu = mu,
                    alternative = "less")
  p_valori_H1[i] <- test_H1$p.value
  rifiuti_H1[i] <- test_H1$p.value < alpha
}

potenza <- mean(rifiuti_H1)
cat("Potenza calcolata:", potenza, "\n")


# ESERCIZIO 8

# PUNTO 1: Con sigma noto 

n <- 75
mu <- 5
sigma2 <- 2.25
sigma <- sqrt(sigma2)
alpha <- 0.05

set.seed(123)
campione <- rnorm(n, mean = mu, sd = sigma)

X_bar <- mean(campione)

Z_obs <- (X_bar - mu) / (sigma / sqrt(n))
Z_crit <- qnorm(1 - alpha)

if (Z_obs > Z_crit) {
  cat("Rifiuto!")
} else {
  cat("Non rifiuto.")
}

# PUNTO 2: Con sigma ignoto

df <- n - 1 
S <- sd(campione)

TS <- (X_bar - mu) / (S / sqrt(n))
Z_crit_t <- qt(1 - alpha, df)

if (TS > Z_crit_t) {
  cat("Rifiuto!")
} else {
  cat("Non rifiuto.")
}

# PUNTO 3: Verifica l'errore di prima specie.

B <- 10000
rifiuti <- logical(B)
p_valori <- numeric(B)

for (i in 1:B) {
  campioni <- rnorm(n, mean = mu, sd = sigma)
  
  test <- t.test(campioni,
                 mu = mu,
                 alternative = "greater")
  p_valori[i] <- test$p.value
  rifiuti[i] <- test$p.value < alpha
}

percentuale <- mean(rifiuti)
verifica <- abs(percentuale - alpha)

if(verifica < 0.01) {
  cat("L'errore di prima specie alpha è verificato!")
} else {
  cat("L'errore di prima specie alpha non è verificato.")
}

# PUNTO 4: Calcola la potenza per H1 : mu = 6

mu_vero = 6
rifiuti_H1 <- logical(B)
p_valori_H1 <- numeric(B)

for (i in 1:B) {
  campioni_H1 <- rnorm(n, mean = mu_vero, sd = sigma)
  
  test_H1 <- t.test(campioni_H1,
                    mu = mu,
                    alternative = "greater")
  p_valori_H1[i] <- test_H1$p.value
  rifiuti_H1[i] <- test_H1$p.value < alpha
}

potenza <- mean(rifiuti_H1)
cat("Potenza calcolata:", potenza, "\n")


# ESERCIZIO 9

# PUNTO 1: Con sigma noto 

n <- 45
mu <- 30
sigma2 <- 36
sigma <- sqrt(sigma2)
alpha <- 0.05

set.seed(123)
campione <- rnorm(n, mean = mu, sd = sigma)

X_bar <- mean(campione)

Z_obs <- (X_bar - mu) / (sigma / sqrt(n))
Z_crit <- qnorm(1 - (alpha / 2))

if (abs(Z_obs) > Z_crit) {
  cat("Rifiuto!")
} else {
  cat("Non rifiuto.")
}

# PUNTO 2: Con sigma ignoto

df <- n - 1 
S <- sd(campione)

TS <- (X_bar - mu) / (S / sqrt(n))
Z_crit_t <- qt(1 - (alpha / 2), df)

if (abs(TS) > Z_crit_t) {
  cat("Rifiuto!")
} else {
  cat("Non rifiuto.")
}

# PUNTO 3: Verifica sotto H0 che alpha = 0,05

B <- 10000
rifiuti <- logical(B)
p_valori <- numeric(B)

for (i in 1:B) {
  campioni <- rnorm(n, mean = mu, sd = sigma)
  
  test <- t.test(campioni,
                 mu = mu,
                 alternative = "two.sided")
  p_valori[i] <- test$p.value
  rifiuti[i] <- test$p.value < alpha
}

percentuale <- mean(rifiuti)
verifica <- abs(percentuale - alpha)

if(verifica < 0.01) {
  cat("L'errore di prima specie alpha è verificato!")
} else {
  cat("L'errore di prima specie alpha non è verificato.")
}

# PUNTO 4: Calcola la potenza per H1 : mu = 32

mu_vero = 32
rifiuti_H1 <- logical(B)
p_valori_H1 <- numeric(B)

for (i in 1:B) {
  campioni_H1 <- rnorm(n, mean = mu_vero, sd = sigma)
  
  test_H1 <- t.test(campioni_H1,
                    mu = mu,
                    alternative = "two.sided")
  p_valori_H1[i] <- test_H1$p.value
  rifiuti_H1[i] <- test_H1$p.value < alpha
}

potenza <- mean(rifiuti_H1)
cat("Potenza calcolata:", potenza, "\n")

#=========================================================
# ESERCIZIO 10
#=========================================================

# --------------------------------------------------------
# DATI
# --------------------------------------------------------
n <- 20
mu <- 0
sigma2 <- 1
sigma <- sqrt(sigma2)
alpha <- 0.01

# --------------------------------------------------------
# PUNTO 1: Con sigma noto 
# --------------------------------------------------------
set.seed(123)
campione <- rnorm(n, mean = mu, sd = sigma)

X_bar <- mean(campione)
cat("Media campionaria: ", round(X_bar, 4), "\n")
cat("Media reale: ", round(mu, 4), "\n")

Z_obs <- (X_bar - mu) / (sigma / sqrt(n))
Z_crit <- qnorm(1 - alpha)

if (Z_obs > Z_crit) {
  cat("Z_obs: ", round(Z_obs, 4), "> Z_crit: ",round(Z_crit, 4)," -> Zona di rifiuto.\n")
} else {
  cat("Z_obs: ", round(Z_obs, 4), "< Z_crit: ",round(Z_crit, 4)," -> Zona di non rifiuto.\n")
}

# --------------------------------------------------------
# PUNTO 2: Con sigma ignoto 
# --------------------------------------------------------

df <- n - 1 
S <- sd(campione)

TS <- (X_bar - mu) / (S / sqrt(n))
Z_crit_t <- qt(1 - alpha, df)

if (TS > Z_crit_t) {
  cat("Statistica Test(TS): ", round(TS, 4), "> Z_crit_t: ",round(Z_crit_t, 4)," -> Zona di rifiuto.\n")
} else {
  cat("Statistica Test(TS): ", round(TS, 4), "< Z_crit_t: ",round(Z_crit_t, 4)," -> Zona di non rifiuto.\n")
}

# --------------------------------------------------------
# PUNTO 3: Verifica alpha sotto H0
# --------------------------------------------------------

B <- 10000
rifiuti <- logical(B)
p_valori <- numeric(B)

for (i in 1:B) {
  campioni <- rnorm(n, mean = mu, sd = sigma)
  
  test <- t.test(campioni,
                 mu = mu,
                 alternative = "greater")
  p_valori[i] <- test$p.value
  rifiuti[i] <- test$p.value < alpha
}

percentuale <- mean(rifiuti)
verifica <- abs(percentuale - alpha)

if(verifica < 0.01) {
  cat("L'errore di prima specie alpha è verificato sotto H0.\n")
  cat("Errore di prima specie: ",alpha, "\n")
  cat("Errore ottenuto dal test: ", round(percentuale, 4), "\n")
  cat("Differenza: ", round(verifica, 4), " < 0.01. E' un errore accettabile.\n")
} else {
  cat("L'errore di prima specie alpha non è verificato sotto H0.\n")
  cat("Errore di prima specie: ",alpha, "\n")
  cat("Errore ottenuto dal test: ", round(percentuale, 4), "\n")
  cat("Differenza: ", round(verifica, 4), " > 0.01. Non è un errore accettabile.\n")
}

# --------------------------------------------------------
# PUNTO 4: Calcola la potenza per H1 : mu = 0.2
# --------------------------------------------------------

mu_vero = 0.2
rifiuti_H1 <- logical(B)
p_valori_H1 <- numeric(B)

for (i in 1:B) {
  campioni_H1 <- rnorm(n, mean = mu_vero, sd = sigma)
  
  test_H1 <- t.test(campioni_H1,
                    mu = mu,
                    alternative = "greater")
  p_valori_H1[i] <- test_H1$p.value
  rifiuti_H1[i] <- test_H1$p.value < alpha
}

potenza <- mean(rifiuti_H1)
cat("Potenza calcolata: ", round(potenza, 4) * 100, "%\n")