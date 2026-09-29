# Esempio: X può assumere valori 0, 1, 2, 3, 4
x <- 0:4
p <- c(1/16, 1/4, 3/8, 1/4, 1/16)

# Verifichiamo che le probabilità sommino a 1
sum(p)

# Grafico della PMF
plot(x, p, type = "h", lwd = 3, col = "steelblue",
     main = "Funzione di Massa di Probabilità (PMF)",
     xlab = "x", ylab = "P(X = x)",
     ylim = c(0, max(p) * 1.1))
points(x, p, pch = 19, col = "steelblue", cex = 1.5)

# Calcoliamo la CDF come somma cumulativa
f <- cumsum(p)

# Grafico della CDF
plot(x, f, type = "s", lwd = 2, col = "darkred",
     main = "Funzione di Ripartizione",
     xlab = "x", ylab = "F(x) = P(X ≤ x)")
points(x, f, pch = 19, col = "darkred", cex = 1.2)

# Calcolo del valore atteso
EX <- sum(x * p)
cat("\nValore atteso E[X] =", EX)

# Calcolo della media
EX <- sum(x * p)
cat("Media E[X] =", EX, "\n")

# Calcolo di E[X²]
EX2 <- sum(x^2 * p)
cat("E[X²] =", EX2, "\n")

# Varianza (formula 1)
var1 <- EX2 - EX^2
cat("Var(X) = E[X²] - E[X]² =", var1, "\n")

# Varianza (formula alternativa)
var2 <- sum((x - EX)^2 * p)
cat("Var(X) =", var2, "\n")

# Deviazione standard
sd_x <- sqrt(var1)
cat("Deviazione standard σ =", sd_x)



# VARIABILI ALEATORIE CONTINUE

# Esempio: f(x) = x²/3 per x in [-1, 2]
x <- seq(from = -1, to = 2, by = 0.01)
y <- (x^2) / 3

plot(x, y, type = "l", lwd = 2, col = "darkgreen",
     main = "Funzione di Densità di Probabilità",
     xlab = "x", ylab = "f(x)")
abline(v = -1, lty = "dashed", col ="darkgreen")
abline(v = 2, lty = "dashed", col ="darkgreen")

# Definiamo la densità f(x) = 3*x^2 per x in [0,1]
f <- function(x) 3 * x^2

# Funzioni ausiliarie per il calcolo del valore atteso e della varianza
g <- function(x) x * f(x)      # x·f(x) per calcolare E[X]
h <- function(x) x^2 * f(x)    # x²·f(x) per calcolare E[X²]

#  Verifichiamo che l'integrale di f(x) su [0,1] sia 1
area <- integrate(f, lower = 0, upper = 1)$value
cat("Area sotto f(x):", round(area, 4), "\n")

#  Calcolo del valore atteso (media)
EX <- integrate(g, lower = 0, upper = 1)$value
cat("Valore atteso E[X] =", round(EX, 4), "\n")

#  Calcolo della varianza
EX2 <- integrate(h, lower = 0, upper = 1)$value
VarX <- EX2 - EX^2
cat("Varianza Var(X) =", round(VarX, 4), "\n")


# ESERCIZIO 1 

# Densità uniforme su [0,1]
f <- function(x) ifelse(x < 0 | x > 1, 0, 1)

# Probabilità
prob <- integrate(f, lower = 1/4, upper = 3/4)$value
cat("P(1/4 ≤ X ≤ 3/4) =", prob)


# ESERCIZIO 2

x <- 0:20
p <- x / 210

# Verifica
cat("Somma delle probabilità:", sum(p), "\n")

# Calcolare P(X > 17)
prob <- sum(p[x > 17])
cat("P(X > 17) =", prob)


# ESERCIZIO 3

x <- 0:4
p <- rep(1/5, 5)

EX <- sum(x * p)
cat("E[X] =", EX)


# ESERCIZIO 4 

f <- function(x) 3 * x^2 
g <- function(x) x * f(x)
h <- function(x) x^2 * f(x)

EX <- integrate(g, lower = 0, upper = 1)$value
EX2 <- integrate(h, lower = 0, upper = 1)$value
VarX <- EX2 - EX^2

cat("E[X] =", EX, "\n")

cat("Var(X) =", VarX)


# ESERCIZIO 5 

f <- function(x) 2 * x
integrate(f, lower = 1/4, upper = 1/2)$value


# ESERCIZIO 6

x <- 1:3
p <- 1 / 6 * x
sum(x * p)


# ESERCIZIO 7

x <- c(2, 4)
f <- 1/ 20 * x ^ 2
sum(x * f)


# ESERCIZIO 8 

f <- function(x) 3 / 2 * x ^ 2 + x
g <- function(x) x * f(x)
h <- function(x) x^2 * f(x)
EX <- integrate(g, lower = 0, upper = 1)$value
VarX <- integrate(h, lower = 0, upper = 1)$value - EX^2
VarX


# ESERCIZIO 9

x <- 1:4
f <- 1/ 4
EX <- sum(x * f)
EX2 <- sum(x ^ 2 * f)
EX2 - EX ^ 2