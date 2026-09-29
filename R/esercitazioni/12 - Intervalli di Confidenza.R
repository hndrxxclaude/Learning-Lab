# ===== INTERVALLI DI CONFIDENZA =====

# IC per μ con σ nota (Z)
z_crit <- qnorm(1 - alpha/2)
ic <- mean(x) + c(-1, 1) * z_crit * sigma / sqrt(n)

# IC per μ con σ ignota (t)
t_crit <- qt(1 - alpha/2, df = n - 1)
ic <- mean(x) + c(-1, 1) * t_crit * sd(x) / sqrt(n)

# IC per σ²
chi_lower <- qchisq(alpha/2, df = n - 1)
chi_upper <- qchisq(1 - alpha/2, df = n - 1)
ic_var <- c((n - 1) * var(x) / chi_upper,
            (n - 1) * var(x) / chi_lower)

# IC per σ (deviazione standard)
ic_sd <- sqrt(ic_var)

# IC per una proporzione p
p_hat <- mean(x)     # x deve essere vettore di 0/1
se <- sqrt(p_hat * (1 - p_hat) / n)
z_crit <- qnorm(1 - alpha/2)
ic_prop <- p_hat + c(-1, 1) * z_crit * se



