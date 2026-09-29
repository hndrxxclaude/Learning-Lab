rm(list = ls())

# ========================================
# ESERCIZI R PARTE 11

# Esercizio 1: Media Campionaria con Normale

# Parametri
mu <- 100
sigma2 <- 25
sigma <- sqrt(sigma2)
n <- 16

# a) Distribuzione di X̄
mu_xbar <- mu
sigma_xbar <- sigma / sqrt(n)
cat("a) X̄ ~ N(", mu_xbar, ",", sigma_xbar^2, ")\n")

# b) Probabilità
prob <- pnorm(102, mu_xbar, sigma_xbar) - pnorm(98, mu_xbar, sigma_xbar)
cat("b) P(98 ≤ X̄ ≤ 102) =", round(prob, 4), "\n\n")

# c) Simulazione
set.seed(1234)
B <- 5000


medie <- replicate(B, mean(rnorm(n, mu, sigma)))

prob_empirica <- mean(medie >= 98 & medie <= 102)
cat("c) Probabilità empirica:", round(prob_empirica, 4), "\n")

cat("   Differenza:", abs(prob - prob_empirica))

# Grafico
hist(medie, freq = FALSE, breaks = 40,
     col = "lightblue", border = "white",
     main = "Distribuzione di X̄ - Esercizio 1",
     xlab = expression(bar(X)))
curve(dnorm(x, mu_xbar, sigma_xbar), add = TRUE, col = "red", lwd = 2)
abline(v = c(98, 102), col = "darkgreen", lwd = 2, lty = 2)

# --------------------------------------------------------

#Esercizio 2: TLC con Esponenziale

# Parametri dell'esponenziale
lambda <- 0.2
mu <- 1/lambda        # media = 5
sigma2 <- 1/lambda^2  # varianza = 25
sigma <- sqrt(sigma2)
n <- 40

# a) Per TLC, X̄ ~ N(μ, σ²/n) approssimativamente
mu_xbar <- mu
sigma_xbar <- sigma / sqrt(n)
cat("a) X̄ ≈ N(", mu_xbar, ",", round(sigma_xbar^2, 3), ") per TLC\n\n")

# b) Probabilità
prob <- 1 - pnorm(6, mu_xbar, sigma_xbar)
cat("b) P(X̄ > 6) ≈", round(prob, 4), "\n\n")

# c) Simulazione
set.seed(2345)
B <- 5000
medie_exp <- replicate(B, mean(rexp(n, rate = lambda)))

prob_empirica <- mean(medie_exp > 6)
cat("c) Probabilità empirica:", round(prob_empirica, 4), "\n")

cat("   Differenza:", abs(prob - prob_empirica))

# Grafico
hist(medie_exp, freq = FALSE, breaks = 40,
     col = "lightyellow", border = "white",
     main = "TLC con Esponenziale - Esercizio 2",
     xlab = expression(bar(X)))
curve(dnorm(x, mu_xbar, sigma_xbar), add = TRUE, col = "red", lwd = 2)
abline(v = 6, col = "darkgreen", lwd = 2, lty = 2)

# --------------------------------------------------------

#Esercizio 3: Varianza Campionaria

# Parametri
sigma2 <- 4
n <- 25
df <- n - 1
x <- seq(0, 60, length = 200)
plot(x, dchisq(x, df), type = "l", lwd = 2, col = "blue",
     main = expression(paste("Distribuzione di V = ", frac((n-1)*S^2, sigma^2))),
     ylab = "Densità", xlab = "V")

# --------------------------------------------------------

#Esercizio 4: Errore Standard e Dimensione Campionaria

# Parametri
sigma <- 15000
mu <- 45000  # assumiamo per la simulazione

# a) Errore standard con n = 25
n1 <- 25
se1 <- sigma / sqrt(n1)
cat("a) Con n = 25, ES(X̄) =", se1, "€\n\n")

# b) n necessario per ES ≤ 2000
se_target <- 2000
n_needed <- ceiling((sigma / se_target)^2)
cat("b) n necessario per ES ≤ 2000:", n_needed, "\n")

cat("   Verifica: ES =", sigma / sqrt(n_needed), "€\n\n")

# c) Simulazione per diverse n
set.seed(4567)
B <- 5000
n_values <- c(10, 25, 50, 100, 200)

risultati <- data.frame(
  n = n_values,
  SE_teorico = sigma / sqrt(n_values),
  SE_empirico = NA
)

for(i in 1:length(n_values)) {
  medie <- replicate(B, mean(rnorm(n_values[i], mu, sigma)))
  risultati$SE_empirico[i] <- sd(medie)
}

cat("c) Confronto teorico vs empirico:\n")
print(round(risultati, 2))

# Grafico
plot(risultati$n, risultati$SE_teorico, type = "b", 
     col = "red", lwd = 2, pch = 19,
     main = "Errore Standard vs Dimensione Campionaria",
     xlab = "n", ylab = "Errore Standard (€)",
     ylim = range(c(risultati$SE_teorico, risultati$SE_empirico)))
points(risultati$n, risultati$SE_empirico, col = "blue", pch = 17, cex = 1.2)
lines(risultati$n, risultati$SE_empirico, col = "blue", lwd = 2, lty = 2)
abline(h = se_target, col = "darkgreen", lwd = 2, lty = 3)
legend("topright",
       legend = c("SE teorico", "SE empirico", "Target (2000)"),
       col = c("red", "blue", "darkgreen"),
       lwd = 2, lty = c(1, 2, 3), pch = c(19, 17, NA))