# 1. Carico i dati
df <- read.csv("Cpus_data.csv", sep = ";", dec = ",")

# Pulizia: Rimuovo le righe che hanno dati mancanti (NA) per evitare errori dopo
df_clean <- na.omit(df)

#-----------------------------------------------------------------------------
#Punto 2: Trova quale variabile (tra le quelle quantitative) aiuta a predire meglio la variabile
#“Recommended_Customer_Price”, e stima i coefficienti di regressione
#-----------------------------------------------------------------------------

# Seleziono solo le colonne numeriche
dati_numerici <- df_clean[sapply(df_clean, is.numeric)]

# Calcolo la correlazione di tutto contro tutto
correlazioni <- cor(dati_numerici)

# Guardo solo la colonna del Prezzo
print(correlazioni[,"Recommended_Customer_Price"])

#La variabile con il numero più alto (in valore assoluto) per la correlazione è nb_of_Threads (Numero di Thread). 
#Quindi costruiamo il modello su quella.

model_simple <- lm(Recommended_Customer_Price ~ nb_of_Threads, data = df_clean)
summary(model_simple)

#-----------------------------------------------------------------------------
#Punto 3: Interpreta i coefficienti di regressione del modello scelto e 
#commenta anche loro significatività
#-----------------------------------------------------------------------------

coefficienti <- summary(model_simple)$coefficients
sommario <- summary(model_simple)
cat("Intercetta(Intercept): ", coefficienti[1,1], "\n")

#Significato: Matematicamente è il prezzo se i thread fossero 0. 
#Non ha senso nel mondo reale (prezzo negativo), serve solo a disegnare la retta.

cat("Coefficiente nb_of_Threads: ",coefficienti[2,1], "\n")

#Significato: Ci dice che, in media, per ogni Thread in più che aggiungi
#alla CPU, il prezzo sale di circa 129,50 dollari.

cat("Significatività(P_value): ",coefficienti[2,4], "\n")

#Il numero è piccolissimo -> Relazione solidissima(***), non è un caso statistico.

cat("R-Squared: ", round(sommario$adj.r.squared,3) * 100, "%\n")

#Significato: Usando solo i thread, riusciamo a spiegare 
#il 68% delle differenze di prezzo tra le CPU.

#-----------------------------------------------------------------------------
#Punto 4: Commenta i residui del modello scelto
#-----------------------------------------------------------------------------

plot(model_simple) # Grafico Residui vs Valori Predetti

# --- CODICE PER ANALISI GRAFICA RESIDUI ---

# 1. Prepariamo la finestra per vedere 4 grafici insieme
par(mfrow = c(2, 2)) 

# 2. Generiamo i grafici diagnostici del modello
# Assicurati di aver già eseguito: model_simple <- lm(...)
plot(model_simple)

# 3. Ripristiniamo la visualizzazione singola per il futuro
par(mfrow = c(1, 1))


# --- GUIDA ALLA LETTURA (Che cosa significano i 4 grafici appena usciti) ---

# GRAFICO 1 (In alto a SX): Residuals vs Fitted
# -----------------------------------------------------------------------------
# COSA CERCARE: La linea rossa deve essere dritta e orizzontale.
# I punti devono essere sparsi a caso (come una nuvola rettangolare).
#
# COSA VEDRAI PROBABILMENTE (Caso CPU):
# Vedrai una forma a "imbuto" (stretto a sinistra, largo a destra).
# SIGNIFICATO: "Eteroschedasticità". Il modello sbaglia poco sulle CPU economiche,
# ma fa errori enormi su quelle costose. L'errore non è costante.


# GRAFICO 2 (In alto a DX): Normal Q-Q
# -----------------------------------------------------------------------------
# COSA CERCARE: I pallini devono seguire la linea tratteggiata diagonale.
#
# COSA VEDRAI PROBABILMENTE:
# I pallini agli estremi (specialmente in alto a destra) si staccano dalla linea,
# curvando verso l'alto.
# SIGNIFICATO: "Non normalità delle code". Ci sono più valori estremi (prezzi altissimi)
# di quanto una distribuzione normale si aspetterebbe. I test statistici (t-test)
# potrebbero essere meno affidabili per questi outlier.


# GRAFICO 3 (In basso a SX): Scale-Location
# -----------------------------------------------------------------------------
# COSA CERCARE: La linea rossa deve essere orizzontale.
#
# COSA VEDRAI PROBABILMENTE:
# La linea rossa sale verso destra.
# SIGNIFICATO: Conferma il Grafico 1. Più aumenta il prezzo predetto (asse X),
# più aumenta la variabilità dell'errore (asse Y). Il modello è instabile sui prezzi alti.


# GRAFICO 4 (In basso a DX): Residuals vs Leverage
# -----------------------------------------------------------------------------
# COSA CERCARE: Punti che si trovano OLTRE le linee rosse tratteggiate (se presenti).
# Cerca punti isolati nell'angolo in alto a destra o in basso a destra.
#
# SIGNIFICATO:
# Se vedi un punto (es. riga 800) molto lontano dagli altri a destra, quello è un
# "Punto di Leva". Significa che quella singola CPU ha caratteristiche così uniche
# (es. troppi thread) che sta forzando la retta a piegarsi verso di sé.
# Se quel punto è anche oltre la linea rossa (Distanza di Cook), va rimosso perché
# sta falsando il modello.

#-----------------------------------------------------------------------------
#Punto 5: Trova il valore predetto della variabile “Recommended_Customer_Price” quando la
#variabile esplicativa prende valori pari a: primo quartile, mediana e terzo quartile.
#-----------------------------------------------------------------------------

# 1. Trovo i quartili dei Thread
quartili <- quantile(df_clean$nb_of_Threads, probs = c(0.25, 0.50, 0.75))

# 2. Creo una tabella con questi nuovi dati
nuovi_dati <- data.frame(nb_of_Threads = quartili)

# 3. Faccio la previsione
predict(model_simple, newdata = nuovi_dati)

#-----------------------------------------------------------------------------
#Punto 6: Adatta un modello di regressione multipla e commenta le differenze con il modello
#di regressione lineare semplice scelto in precedenza
#-----------------------------------------------------------------------------

# Uso il punto "." per dire "tutte le altre variabili nel dataframe"
model_multi <- lm(Recommended_Customer_Price ~ ., data = dati_numerici)
sommario_multiplo <- summary(model_multi)

cat("R-Squared: ", round(sommario_multiplo$adj.r.squared, 3) * 100, "%\n")
cat("Miglioramento della bontà del modello: ", 
    round((sommario_multiplo$adj.r.squared - sommario$adj.r.squared),3) * 100, 
    "% rispetto al modello lineare.\n")

cat("Cambiamento del Coefficiente per nb_of_Threads:\n")
cat("Prima: ", sommario$coefficients[2,1], "$ per unità di Thread.\n")
cat("Ora: ", sommario_multiplo$coefficients[5,1], "$ per unità di Thread.\n")

#Prima i "Thread" si prendevano tutto il merito. 
#Ora il merito è diviso: il modello ha capito che parte dell'aumento di prezzo 
#è dovuto anche alla memoria e al consumo (TDP), non solo ai thread. 
#Quindi il valore "puro" di un thread è sceso.

#Noterai che nb_of_Cores non ha le stelline (non è significativo), mentre nb_of_Threads sì.
#Siccome Core e Thread sono quasi la stessa cosa, il modello ne sceglie uno solo (i Thread) 
#e scarta l'altro (i Core) perché è un'informazione doppione.
