rm(list=ls())

# 1. Importa il dataframe "Cpus data".
df <- read.csv2("Cpus_data.csv")

# 2. Trova i percentili 0.1, 0.22, 0.4, 0.75 e 0.99 della variabile 
#    "Recommended Customer Price".
percentili <- quantile(df$Recommended_Customer_Price,
                       probs = c(0.1, 0.22, 0.4, 0.75, 0.99))

# 3. Dividi la distribuzione in classi utilizzando i percentili trovati in precedenza
valori <- c(min(df$Recommended_Customer_Price),
            percentili,
            max(df$Recommended_Customer_Price))

RCP_classi <- cut(df$Recommended_Customer_Price,
                  breaks = valori,
                  include.lowest = T)

table(RCP_classi, useNA = "always")

# 4. Calcola le frequenze assolute e relative cumulate.
table(RCP_classi)

cumsum(table(RCP_classi))
table(RCP_classi) / dim(df)[1]


# 5. Calcola la media della variabile "Recommended Customer Price":
#    - sulla distribuzione originale;
#    - sulla distribuzione divisa in classi.
mean(df$Recommended_Customer_Price)

pesi <- table(RCP_classi)

# valori[1:6] Valori inferiori.
# valori[2:7] Valori superiori.
centroidi <- (valori[1:6] + valori[2:7]) / 2

sum(centroidi * pesi) / sum(pesi)

# cat: Print più sistemato
cat("La media calcolata sulla distribuzione originale è pari a:",
    mean(df$Recommended_Customer_Price),
    "\nLa media calcolata sulla distribuzione in classi è pari a:",
    sum(centroidi * pesi) / sum(pesi))

# 6. Rappresenta i boxplot della variabile "Recommended Customer Price"
#    condizionata a "Product Collection".
boxplot(df$Recommended_Customer_Price ~ df$Product_Collection,  # Boxplot condizionato
        xlab = "Product Collection",
        ylab = "Recommended Customer Price")