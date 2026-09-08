# HIGH ORDER FUNCTIONS EXCERCISES 

countries = ['Estonia', 'Finland', 'Sweden', 'Denmark', 'Norway', 'Iceland']
names = ['Asabeneh', 'Lidiya', 'Ermias', 'Abraham']
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# LEVEL 1  

# 1. Explain the difference between map, filter, and reduce.

# map is a built-in higher order function, meaning that it can take another function as a parameter.
# map takes a function and an iterable as arguments, applying the function to every element of the iterable, returning the modified iterable
# filter is a built-in higher order function, that takes a function and an iterable as arguments, and returns a boolean for each item of the iterable.
# It filters the items that satisfy the filtering criteria.
# reduce is a built-in higher order function which takes a function and an iterable as arguments and return a single value.

# 2. Explain the difference between higher order function, closure and decorator

# A Higher Order Function is a function which can take another function as an argument, return other functions or even be assigned to variables
# A closure allows a nested functions to access the outer scope of the enclosing function
# A decorator is a design pattern which allows to add new functionality to an existing object without touching its structure.

# 3. Define a call function before map, filter or reduce, see examples.

def square(x):
    return x ** 2

# 4. Use for loop to print each country in the countries list.

for country in countries:
    print(country)

# 5. Use for to print each name in the names list.

for name in names:
    print(name)

# 6. Use for to print each number in the numbers list.

for num in numbers:
    print(num)


# ===========================================================


# LEVEL 2

# 1. Use map to create a new list by changing each country to uppercase in the countries list
countries_upper = map(str.upper, countries)
print(list(countries_upper))

# 2. Use map to create a new list by changing each number to its square in the numbers list
numbers_square = map(square, numbers)
print(list(numbers_square))

# 3. Use map to change each name to uppercase in the names list
names_upper = map(str.upper, names)
print(list(names_upper))

# 4. Use filter to filter out countries containing 'land'
countries_filtered = filter(lambda elem: elem.endswith('land'), countries)
print(list(countries_filtered))

# 5. Use filter to filter out countries having exactly six characters

def is_long_six(st: str):
    if len(st) == 6:
        return True
    else:
        return False

countries_six = filter(is_long_six, countries)
print(list(countries_six))

# 6. Use filter to filter out countries containing six letters and more in the country list.

countries_six_or_more = list(filter(lambda elem: len(elem) >= 6, countries))
print(countries_six_or_more)

# 7. Use filter to filter out countries starting with an 'E'

countries_starts_with_e = list(filter(lambda elem: elem[0] == 'E', countries))
print(countries_starts_with_e)

# 8. Chain two or more list iterators (eg. arr.map(callback).filter(callback).reduce(callback))

from functools import reduce

result = reduce(lambda acc, n: acc + n, filter(lambda n: n % 2 == 0, map(lambda n: n * n, numbers))) # acc = accumulator

print(result)

# 9. Declare a function called get_string_lists which takes a list as a parameter and then returns a list containing only string items.

def get_string_lists(lst: list):
    return list(filter(lambda elem: type(elem) == str, lst))

print(get_string_lists([1, 2, 3, 'Claudio', 4, 5, 'Gentile']))

# 10. Use reduce to sum all the numbers in the numbers list.

numbers_sum = reduce(lambda acc, num: acc + num, numbers)
print(numbers_sum)

# 11. Use reduce to concatenate all the countries and to produce this sentence: Estonia, Finland, Sweden, Denmark, Norway, and Iceland are north European countries
    
sentence = reduce(lambda acc, curr: f"{acc}, {curr}" if curr != countries[-1] else f"{acc} and {curr} are North European countries", countries)
print(sentence)

# 12. Declare a function called categorize_countries that returns a list of countries with some common pattern 
# (you can find the countries list in this repository as countries.js(eg 'land', 'ia', 'island', 'stan'))

more_countries = countries + ["Pakistan, Uzbekistan, Italia"]

def categorize_countries(lst: list):
    return list(filter(lambda country: "land" in country or "ia" in country or "stan" in country, lst))

print(categorize_countries(more_countries))

# 13. Create a function returning a dictionary, where keys stand for starting letters of countries and values are the number of country names starting with that letter

def countries_dictionary(lst: list):
    dct = dict()
    list(map(lambda country: dct.update({country[0]: dct.get(country[0], 0) + 1}), lst))
    return dct

print(countries_dictionary(more_countries))

# 14. Declare a get_first_ten_countries function - it returns a list of first ten countries from the countries.js list in the data folder

def get_first_ten_countries(country_list: list):
    return country_list[:10]

# 15. Declare a get_last_ten_countries function that returns the last ten countries in the countries list.

def get_last_ten_countries(country_list: list):
    return country_list[-10:]


# ===========================================================

# LEVEL 3

# 1. Use the countries_data.py (https://github.com/Asabeneh/30-Days-Of-Python/blob/master/data/countries-data.py) file and follow the tasks below

# - Sort countries by name, by capital, by population
# - Sort out the ten most spoken languages by location.
# - ort out the ten most populated countries.