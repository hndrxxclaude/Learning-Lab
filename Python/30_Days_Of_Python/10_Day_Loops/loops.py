# LOOPS EXCERCISES

# LEVEL 1 

# 1. Iterate 0 to 10 using for loop, do the same using while loop.

for i in range(11):
    print(i)

number = 0
while number < 11:
    print(number)
    number += 1

# 2. Iterate 10 to 0 using for loop, do the same using while loop.

for i in range(10,-1,-1):
    print(i)

num = 10
while num >= 0:
    print(num)
    num -= 1


# 3. Write a loop that makes seven calls to print(), so we get on the output the following triangle: 
  #
  ##
  ###
  ####
  #####
  ######
  #######

for i in range(1, 8):
    print('#' * i)

# 4. Use nested loops to create the following:
# # # # # # # #
# # # # # # # #
# # # # # # # #
# # # # # # # #
# # # # # # # #
# # # # # # # #
# # # # # # # #
# # # # # # # #

for i in range (8):
    for j in range(8):
        print ('#', end = ' ')
    print()


# 5. Print the following pattern:
# 0 x 0 = 0
# 1 x 1 = 1
# 2 x 2 = 4
# 3 x 3 = 9
# 4 x 4 = 16
# 5 x 5 = 25
# 6 x 6 = 36
# 7 x 7 = 49
# 8 x 8 = 64
# 9 x 9 = 81
# 10 x 10 = 100

for i in range(11):
    print(f"{i} x {i} = {i * i}")


# 6. Iterate through the list, ['Python', 'Numpy','Pandas','Django', 'Flask'] using a for loop and print out the items.

lst = ['Python', 'Numpy','Pandas','Django', 'Flask']
for item in lst:
    print(item)

# 7. Use for loop to iterate from 0 to 100 and print only even numbers

for i in range (0, 101, 2):
    print(i)

# 8. Use for loop to iterate from 0 to 100 and print only odd numbers

for i in range(0, 100, 2):
    print(i + 1)


# ====================================================

# LEVEL 2

# 1. Use for loop to iterate from 0 to 100 and print the sum of all numbers.

sum = 0
for i in range(0, 101):
    sum += i
print(f"The sum of all numbers from 0 to a 100 is {sum}")

# 2. Use for loop to iterate from 0 to 100 and print the sum of all evens and the sum of all odds.

sum_evens = 0
sum_odds = 0

for i in range(0, 101):
    if i % 2 == 0:
        sum_evens += i
    else:
        sum_odds += i

print(f"The sum of all the even numbers between 0 and 100 is {sum_evens}.")
print(f"The sum of all the odd numbers between 0 and 100 is {sum_odds}.")


# ====================================================

# LEVEL 3

# 1. Go to the data folder and use the countries.py file. Loop through the countries and extract all the countries containing the word land.

# The excercise was completed in the countries.py file:

# for country in countries:
#   if 'land' in country:
#       print(country)

# Output:
# Finland
# Iceland
# Ireland
# Marshall Islands
# Netherlands
# New Zealand
# Poland
# Solomon Islands
# Switzerland
# Thailand


# 2. This is a fruit list, ['banana', 'orange', 'mango', 'lemon'] reverse the order using loop.

fruits = ['banana', 'orange', 'mango', 'lemon']

i = 0
j = len(fruits) - 1

while i < j:
    fruits[i], fruits[j] = fruits[j], fruits[i]
    i += 1
    j -= 1

print(fruits)

# 3. Go to the data folder and use the countries_data.py file.
# - What are the total number of languages in the data
# - Find the ten most spoken languages from the data
# - Find the 10 most populated countries in the world

# ALL COMPLETED - GO CHECK OUT 'countries-data.py' in the data folder