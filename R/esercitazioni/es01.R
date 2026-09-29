rm(list=ls())

# 1. Costruire una sequenza da 1 a 100 di passo 5;
seq(from = 1, to = 100, by = 5)

# 2. Assegnare all’oggetto creato il nome s1;
s1 <- seq(from = 1, to = 100, by = 5)

# 3. Determinare la lunghezza dell’oggetto;
length(s1)

# 4. Costruire un nuovo vettore non numerico s2 in cui si abbia
#    il carattere “M” ripetuto 10 volte e il carattere “F” ripetuto
#    10 volte utilizzando una singola istruzione;
s2 <- rep(c("M", "F"), each = 10)

# 5. Mettere insieme i due oggetti in una matrice chiamata M1;
M1 <- cbind(s1, s2)

# 6. Verificate che l’oggetto creato sia una matrice;
is.matrix(M1)

# 7. Costruite il dataframe M1.df con gli stessi vettori e date alle
#    colonne della matrice M1 i seguenti nomi: eta e sesso;
M1.df <- data.frame(eta = s1, sesso = s2)

# 8. Selezionate le sole osservazioni con eta <= 50.
M1.df[M1.df$eta <= 50,]
# IN ALTERNATIVA: subset(M1.df, eta <= 50)