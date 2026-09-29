library(tidyverse)
library(nycflights13)

# Esercizi
# 1. Trova tutti i voli che
#   1. Hanno avuto un ritardo all’arrivo di due ore o più
filter(flights, arr_delay >= 120)

#   2. Sono volati verso Houston (IAH o HOU)
filter(flights, dest %in% c("IAH", "HOU"))  

#   3. Sono stati operati da United, American o Delta
filter(flights, carrier %in% c("AA", "DL", "UA"))

#   4. Sono partiti in estate (luglio, agosto e settembre)
filter(flights, month %in% c(7,8,9))
filter(flights, between(month,7,9))

#   5. Sono arrivati con più di due ore di ritardo, ma non sono partiti in ritardo
filter(flights, arr_delay > 120, dep_delay <= 0)



# 6. Sono partiti con almeno un’ora di ritardo, ma hanno recuperato più di 30 minuti in volo
filter(flights, dep_delay >= 60, (dep_delay - arr_delay) > 30)

# 7. Sono partiti tra mezzanotte e le 6 del mattino (incluse)
filter(flights, dep_time <= 600 | dep_time == 2400)

# Un altro helper utile per il filtraggio in dplyr è between().
filter(flights, between(dep_time, 0, 600) | dep_time == 2400)
filter(flights, dep_time %in% c(0:600, 2400))



# Esercizi
# 1. Ordina i voli per trovare quelli con il maggiore ritardo.
# 2. Quali voli hanno viaggiato più a lungo? Quali il più breve?

arrange(flights, desc(arr_delay))  
arrange(flights, desc(air_time))
arrange(flights, air_time)


# Esercizio
#  Ordina i voli per trovare quelli più veloci.

flights %>%
  mutate(speed = distance / air_time * 60) %>%
  select(speed, everything()) %>%
  arrange(-speed)


# Esercizio
# A che ora del giorno dovresti volare se vuoi evitare
# il più possibile i ritardi alla partenza?

flights %>%
  group_by(hour) %>%  
  summarise(
    flights_count = n(),  
    avg_delay = mean(arr_delay, na.rm = TRUE)  
  ) %>% filter(hour!=1) %>% 
  arrange(avg_delay)  