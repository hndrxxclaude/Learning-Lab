rm(list = ls())

# ===== VARIABILI ALEATORIE =====

# Valore atteso (discreto)
sum(x * p)

# Valore atteso (continuo)
integrate(function(x) x * f(x), lower = a, upper = b)$value

# Varianza
# Discreto: sum((x - mu)^2 * p)
# Continuo: integrate(function(x) (x - mu)^2 * f(x), a, b)$value

# ===== DISTRIBUZIONI NOTE =====

# PREFISSI:
# d = densità/massa
# p = probabilità cumulata (CDF)
# q = quantile (inversa della CDF)
# r = simulazione

# NORMALE: norm(x, mean, sd)
dnorm(1.96)                    # densità in x=1.96
pnorm(1.96)                    # P(X ≤ 1.96)
1 - pnorm(1.96)                # P(X > 1.96)
pnorm(b) - pnorm(a)            # P(a < X ≤ b)
qnorm(0.975)                   # quantile 97.5%
rnorm(100, mean=0, sd=1)       # 100 valori casuali

# BINOMIALE: binom(x, size, prob)
dbinom(5, size=10, prob=0.3)   # P(X = 5)
pbinom(5, 10, 0.3)             # P(X ≤ 5)
1 - pbinom(4, 10, 0.3)         # P(X ≥ 5)
qbinom(0.5, 10, 0.3)           # mediana
rbinom(100, 10, 0.3)           # 100 simulazioni

# POISSON: pois(x, lambda)
dpois(3, lambda=2)             # P(X = 3)
ppois(3, 2)                    # P(X ≤ 3)
qpois(0.9, 2)                  # 90° percentile
rpois(100, 2)                  # 100 simulazioni

# UNIFORME: unif(x, min, max)
dunif(0.5, 0, 1)               # densità
punif(0.7, 0, 1)               # P(X ≤ 0.7)
qunif(0.5, 0, 1)               # mediana
runif(100, 0, 1)               # 100 valori casuali

# ESPONENZIALE: exp(x, rate)
dexp(2, rate=0.5)              # densità
pexp(2, 0.5)                   # P(X ≤ 2)
qexp(0.9, 0.5)                 # 90° percentile
rexp(100, 0.5)                 # 100 simulazioni

#=====================================================

#PARTE 9: ESERCIZI FINALI

#Esercizio: Variabile Casuale Continua

f <- function(x) 3 * x ^ 2
g <- function(x) x * f(x)
h <- function(x) x ^ 2 * f(x)
EX <- integrate(g, lower = 0, upper = 1)$value
VarX <- integrate(h, lower = 0, upper = 1)$value - EX ^ 2
VarX

#----------------------------------------------------------
#Esercizio: Problema delle Lotterie

n <- 50
p <- 0.01
atLeast_one <- 1 - pbinom(0, n, p)
cat("P(almeno una vittoria) = ", atLeast_one, "\n")

one_W <- dbinom(1, n, p)
cat("P(esattamente una vittoria) = ", one_W, "\n")

atLeast_two <- 1 - pbinom(1, n, p)
cat("P(almeno 2 vittorie) = ", atLeast_two, "\n")

#Verifica approssimazione Normale

cat("np(1-p) = ", n * p *(1 - p), "\n")

#L'approssimazione normale non è appropriata (np(1-p) >= 9)

#Se la usiamo comunque

mu <- n * p
sigma <- sqrt(n * p * (1-p))
prob_c_norm <- 1 - pnorm(2, mu, sigma)
prob_c_norm

#molto diverso dal valore esatto

#----------------------------------------------------------

#Esercizio: Problema dei voli Milano - New York

mu <- 500
sigma2 <- 625
sigma <- sqrt(sigma2)
under_9_hours <- pnorm(540, mean = mu, sd = sigma)
cat("a) P(X < 540) = ", under_9_hours, "\n")
over_510 <- 1 - pnorm(510, mean = mu, sd = sigma)
cat("b) P(X > 510) = ", over_510, "\n")

prob_c <- pnorm(520, mean = mu, sd = sigma) - pnorm(470, mean = mu, sd = sigma)
cat("c) P(47' < X < 520) = ", prob_c, "\n")

#Funzione di ripartizione della variabile "durata dei voli"

x <- seq(400, 600, length = 200)
plot(x, pnorm(x, mu, sigma), type = "l", lwd = 2,
     col = "navy",
     main = "Funzione di Ripartizione - Durata Voli",
     xlab = "Durata(minuti)",
     ylab = "F(x)")
abline(v = c(470, 500, 520, 540), lty = 3, col = "gray")

#----------------------------------------------------------

#Esercizio: Componenti Elettronici

n <- 100
p <- 0.02
prob_a <- dbinom(3, n, p)
cat("a) P(X = 3) = ", prob_a, "\n")
prob_b <- pbinom(5, n, p)
cat("b) P(X <= 5) = ", prob_b, "\n")

set.seed(1234)
lotti <- rbinom(1000, size = n, prob = p)

prob_a_emp <- mean(lotti == 3)
prob_b_emp <- mean(lotti <= 5)

cat("\nVerifica empirica:\n")
cat("P(X = 3) empirica =", round(prob_a_emp, 4), "\n")
cat("P(X ≤ 5) empirica =", round(prob_b_emp, 4), "\n")

#Grafico

hist(lotti, breaks = -0.5:max(lotti)+0.5,
     col = "lightpink",
     probability = TRUE,
     main = "Distribuzione empirica vs teorica",
     xlab = "Numero di difetti")
points(0:10, dbinom(0:10, n, p),
       col = "red",
       pch = 10,
       cex = 1.2)
legend("topright", legend = c("Empirica", "Teorica"),
       fill = c("lightpink", NA), 
       pch = c(NA, 10),
       col = c(NA, "red"))

#----------------------------------------------------------

#Esercizio: Tempo di Attesa

EX = 5        #media (1 / lambda)
lambda <- 1 / EX

prob_a <- pexp(3, lambda)
cat("a) P(X < 3) = ", prob_a, "\n")

prob_b <- pexp(8, lambda) - pexp(4, lambda)
cat("b) P(4 <= X <= 8) = ", prob_b, "\n")

tempo_90 <- qexp(0.9, lambda) 
cat("c) 90° percentile =", round(tempo_90, 2), "minuti\n")

# Visualizzazione
x <- seq(0, 30, length = 200)
plot(x, dexp(x, rate = lambda), type = "l", lwd = 2,
     col = "purple",
     main = "Densità Esponenziale (media = 5 min)",
     xlab = "Tempo (minuti)", ylab = "Densità")
abline(v = c(3, 4, 8, tempo_90), lty = 2, col = "gray")
text(3, 0.15, "3 min", pos = 4, col = "blue")
text(tempo_90, 0.15, "90° perc.", pos = 4, col = "red")

#----------------------------------------------------------

#Esercizio: Test Diagnostico

# Dati
prev <- 0.01        # prevalenza
sens <- 0.95        # P(T+ | M+)
spec <- 0.90        # P(T- | M-)

# Teorema di Bayes
# P(M+ | T+) = P(T+ | M+) × P(M+) / P(T+)

# P(T+) = P(T+|M+)×P(M+) + P(T+|M-)×P(M-)
p_test_pos <- sens * prev + (1 - spec) * (1 - prev)

# Probabilità a posteriori
p_malato_dato_pos <- (sens * prev) / p_test_pos

cat("Probabilità di essere malati dato test positivo:\n", round(p_malato_dato_pos * 100, 2), "%\n")

# Anche con un test positivo, la probabilità di essere effettivamente malati è solo 
round(p_malato_dato_pos * 100, 2)
# a causa della bassa prevalenza della malattia.

#----------------------------------------------------------

#Esercizio: Call Center

lambda <- 20 * 0.5

prob_a <- dpois(15, lambda)
prob_b <- 1 - ppois(12, lambda)

set.seed(333)
x <- rpois(100, lambda)

cat("\nStatistiche empiriche:\n")
cat("Media:", mean(x), "\n")
cat("Varianza:", var(x), "\n")
cat("(Teoriche: media = varianza =", lambda, ")\n")

# Grafico
hist(x, breaks = seq(min(x)-0.5, max(x)+0.5, by = 1),
     col = "lightseagreen", probability = TRUE,
     main = "Chiamate in 30 minuti (100 simulazioni)",
     xlab = "Numero di chiamate")

# Sovrapponiamo la distribuzione teorica
x_vals <- 0:25
points(x_vals, dpois(x_vals, lambda_30),
       col = "red", pch = 19, cex = 1.2)
legend("topright", 
       legend = c("Empirica", "Teorica Poisson(10)"),
       fill = c("lightseagreen", NA), 
       pch = c(NA, 19),
       col = c(NA, "red"))

#----------------------------------------------------------

#Esercizio: Azienda

mu <- 1000
sigma <- 100
n <- 50

#a) X bar ~ N (mu, sigma2 / n)

mu_xbar <- mu
sigma_xbar <- sigma / sqrt(n)

# b) Qual è la probabilità che la media campionaria sia feriore a 980 ore?

prob_b <- pnorm(980, mean = mu_xbar, sd = sigma_xbar)
cat("b) P(X̄ < 980) =", round(prob_b, 4), "\n\n")

# c) Se osserviamo una media di 970 ore, quanto è plausibile l'affermazione dell'azienda?

prob_c <- pnorm(970, mean = mu_xbar, sd = sigma_xbar)

# --- INTERPRETAZIONE DEL RISULTATO (Media osservata: 970) ---
# L'affermazione dell'azienda NON risulta plausibile.
# Il p-value calcolato è circa 0.017 (1.7%), ovvero inferiore alla soglia del 5%.
#
# Ciò significa che è molto improbabile ottenere una media così bassa per puro caso
# se la vera media fosse davvero 1000 ore.
#
# CONCLUSIONE:
# Escludendo la sfortuna campionaria (evento raro), l'ipotesi più probabile è che
# l'azienda stia sovrastimando la durata e che la media reale sia inferiore a 1000.