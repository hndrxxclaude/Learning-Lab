# Python DateTime Excercises

# LEVEL 1

# 1. Get the current day, hour, minute and timestamp from datetime module

from datetime import datetime

now = datetime.now()

print(f"Day: {now.day}")
print(f"Hour: {now.hour}")
print(f"Minute: {now.minute}")
print(f"Timestamp: {now.timestamp()}")


# 2. Format the current date using this format: "%m/%d/%Y, %H:%M:%S"

t = now.strftime("%m/%d/%Y, %H:%M:%S")
print("Formatted time:", t)

# 3. Today is 5 December, 2019. Change this time string to time

today = "5 December, 2019"

date_object = datetime.strptime(today, "%d %B, %Y")
print("Parsed time:", date_object)


# 4. Calculate the time difference between now and new year
from datetime import date

new_year = date(2027, 1, 1)
curr = date.today()

print(f"Time left for new year: {new_year - curr}")


# 5. Calculate the time difference between 1 January 1970 and now

d = date(1970, 1, 1)

print(f"Time difference: {curr - d}")

