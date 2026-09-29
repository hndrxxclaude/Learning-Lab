# ===============================================
# 📦 Caricamento librerie
# ===============================================
library(dplyr)
library(nycflights13)

# ===============================================
# 📊 Dataset di riferimento
# ===============================================
df <- nycflights13::flights


# ===============================================
# 1️⃣ Voli con ritardo in arrivo di più di 2 ore
# ===============================================
voli_ritardo <- filter(flights, arr_delay > 120)


# ===============================================
# 2️⃣ Voli diretti a Houston (IAH o HOU)
# ===============================================
houston <- filter(flights, dest == "IAH" | dest == "HOU")


# ===============================================
# 3️⃣ Voli operati da United, American o Delta
# ===============================================
operati <- filter(flights, carrier == "UA" | carrier == "DL" | carrier == "AA")


# ===============================================
# 4️⃣ Voli partiti in estate (July, August, September)
# ===============================================
estate <- filter(flights, month == 7 | month ==8 | month ==9)


# ===============================================
# 5️⃣ Arrivati con più di 2 ore di ritardo ma partiti in orario
# ===============================================
ritardo_arrivo_non_partenza <- filter(flights, dep_delay == 0 & arr_delay > 120)


# ===============================================
# 6️⃣ Partiti con almeno 1 ora di ritardo,
#     ma che hanno recuperato in volo più di 30 minuti
# ===============================================
ritardo_ora_recupero <- filter(flights, dep_delay > 60 & arr_delay < 30)


# ===============================================
# 7️⃣ Partiti tra mezzanotte e le 6am (inclusi)
# ===============================================
mezzanotte_sei <- filter(flights, dep_time >=  0 & dep_time <=  600 | dep_time == 2400)

# OPPURE 

# 📦 Caricamento pacchetti ----
library(dplyr)
library(nycflights13)

# 📊 Dataset di riferimento
df <- nycflights13::flights

# ✈️ 1. Voli con ritardo in arrivo superiore a 2 ore ----
voli_ritardo <- df %>%
  filter(arr_delay > 120)

# 🛫 2. Voli diretti a Houston (IAH o HOU) ----
houston <- df %>%
  filter(dest %in% c("IAH", "HOU"))

# 🏢 3. Voli operati da United, American o Delta ----
operati <- df %>%
  filter(carrier %in% c("UA", "AA", "DL"))

# 🌞 4. Voli partiti in estate (luglio, agosto, settembre) ----
estate <- df %>%
  filter(month %in% 7:9)   # mesi numerici (7 = July, 8 = August, 9 = September)

# ⏰ 5. Arrivati con più di 2 ore di ritardo, ma partiti in orario ----
ritardo_arrivo_non_partenza <- df %>%
  filter(dep_delay <= 0, arr_delay > 120)

# ⏩ 6. Partiti con almeno 1 ora di ritardo, ma che hanno recuperato in volo >30 min ----
ritardo_ora_recupero <- df %>%
  filter(dep_delay > 60, arr_delay - dep_delay < -30)

# 🌙 7. Partiti tra mezzanotte e le 6:00 (inclusi) ----
mezzanotte_sei <- df %>%
  filter(between(dep_time, 0, 600))
