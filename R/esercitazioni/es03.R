rm(list=ls())

# Esercizio: Importare il file DatiStat1.txt
df <- read.table("DatiStat1.txt", header = T)

# 1. Controllare la natura delle variabili
str(df)
class(df)

# 2. Assegnate ad un nuovo vettore che chiamerete "alt" la variabile Altezza
alt <- df$Altezza

# 3. Definite il grado di istruzione del padre e della madre come fattori ordinali
df$GIP <- factor(df$GIP,
                 levels = c("Elementare", "Media", "Diploma", "Laurea"), 
                 ordered = T)

df$GIM <- factor(df$GIM,
       levels = c("Elementare", "Media", "Diploma", "Laurea"), 
       ordered = T)
# Non posso trasformare la variabile GIM in un Factor perchè nel file abbiamo un <NA>, quindi:

pos <- which(!(df$GIM %in% c("Elementare", "Media", "Diploma", "Laurea"))) 
# Trovo la posizione in cui abbiamo un FALSE.

# Fix del problema:
df[pos, "GIM"] <- "Diploma"
which(!(df$GIM %in% c("Elementare", "Media", "Diploma", "Laurea")))

df$GIM <- factor(df$GIP,
                 levels = c("Elementare", "Media", "Diploma", "Laurea"), 
                 ordered = T)

str(df)

# 4. Selezionate gli studenti provenienti dal Liceo Scientifico
df[df$Diploma == "Scientifico",]

# 5. Selezionare gli studenti più bassi di 168 cm e identificarli
#    (individuare la loro posizione all’interno del database)
which(df$Altezza < 168)
# IN ALTERNATIVA: subset(df, Altezza < 168)

# 6. Selezionate solo gli studenti i cui genitori hanno entrambi il grado di istruzione ”Laurea”
df[df$GIP == "Laurea" & df$GIM == "Laurea",]
# IN ALTERNATIVA: subset(df, GIP > "Diploma" & GIM > "Diploma")