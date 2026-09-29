library(tidyverse)

#2.Quali variabili in mpg sono categoriali? Quali variabili sono continue?
  #(Suggerimento: digitare ?mpg per leggere la documentazione per il
   #dataset).

?mpg
str(mpg)

# Mappa una variabile continua su color,size e shape. Perch? questa
#estetica si comporta diversamente per variabili categoriali e continue?

ggplot(mpg, aes(displ, hwy, color= cty)) + geom_point()
ggplot(mpg, aes(displ, hwy, size= cty)) + geom_point()
ggplot(mpg, aes(displ, hwy, shape= cty)) + geom_point()
ggplot(mpg, aes(displ, hwy, shape= manufacturer)) + geom_point()


#  4 Cosa succede se si mappa la stessa variabile su pi? estetiche?

ggplot(mpg, aes(displ, hwy, shape= fl, color=fl)) + geom_point() # una sola legenda
ggplot(mpg, aes(displ, hwy, shape= fl, color=class)) + geom_point() # due legende



# Cosa succede se si condiziona a una variabile continua?
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ cty, nrow = 2)

ggplot(data = mpg) +
   geom_point(mapping = aes(x = displ, y = hwy)) +
   facet_wrap(.~ cty, nrow = 2) # identico al precedente

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(cty~. , nrow = 2)



# Quale geom useresti per disegnare un grafico a linee? Un boxplot? Un
#istogramma? Un grafico a torta?

View(economics)

#geom_line
economics %>% mutate(mese = lubridate::month(date)) %>% 
  mutate(giorno = lubridate::day(date)) %>%
  mutate(anno = lubridate::year(date)) %>%
  ggplot(aes(mese, psavert, group=anno ))+geom_line(aes(color= anno))

economics %>% mutate(mese = lubridate::month(date)) %>% 
  mutate(giorno = lubridate::day(date)) %>%
  mutate(anno = lubridate::year(date)) %>%
  ggplot(aes(mese, psavert, group=anno ))+geom_line(aes(color= as.factor(anno)))

#geom_boxplot
economics %>% mutate(mese = lubridate::month(date)) %>% 
  ggplot(aes(as.factor(mese), psavert))+geom_boxplot()

#geom_histogram
ggplot(diamonds, aes(carat)) +
  geom_histogram()

ggplot(diamonds, aes(carat)) +
  geom_histogram(binwidth = 0.01) #larghezza delle classi

ggplot(diamonds, aes(carat)) +
  geom_histogram(bins = 200) #numero delle classi

ggplot(diamonds, aes(carat)) +
  geom_histogram(breaks= seq(0,5,0.5)) # classi

ggplot(diamonds, aes(carat)) +
  geom_histogram(breaks= c(0, 1, 1.5, 2.5, 5), stat="density") # classi

# torta
df <- data.frame(
  group = c("Male", "Female", "Child"),
  value = c(25, 25, 50)
)
head(df)
##    group value
## 1   Male    25
## 2 Female    25
## 3  Child    50
#Use a barplot to visualize the data :


# Barplot
(bp<-ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity"))



#Create a pie chart :

bp + coord_polar("y", start=0)

diamonds %>% count(clarity) %>%ggplot(aes(x= "", y=n, fill=clarity)) +
  geom_bar(stat="identity", position="fill")+ coord_polar("y", start=0)+
  theme_void()

#1. Recreate the R code necessary to generate the following graphs.

# http://r4ds.had.co.nz/data-visualisation.html (ESERCIZIO 6 SECTION 3.6)



grafico<-ggplot(data = mpg,mapping = aes(x = displ, y = hwy)) + 
  geom_point()


#1
grafico+geom_smooth(se=F)

#2
grafico+  geom_smooth(mapping = aes(group = drv), se=F)

#3
grafico+
  geom_point(mapping=aes(color=drv))+
  geom_smooth(mapping = aes(color = drv), se=F)

#4
grafico+
  geom_point(mapping=aes(color=drv))+
  geom_smooth(se=F)

#5

grafico+
  geom_point(mapping=aes(color=drv))+
  geom_smooth(mapping = aes(linetype = drv), se=F)

#6
grafico+
  geom_point(mapping=aes(fill=drv), shape=21,color="white",size=3)
