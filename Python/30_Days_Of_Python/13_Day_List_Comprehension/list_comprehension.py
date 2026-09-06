# LIST COMPREHENSION EXCERCISES

# 1. Filter only negative and zero in the list using list comprehension

numbers = [-4, -3, -2, -1, 0, 2, 4, 6]

negative_and_zero = [number for number in numbers if number <= 0]

print(negative_and_zero)

# 2. Flatten the following list of lists of lists to a one dimensional list :

list_of_lists =[[1, 2, 3], [4, 5, 6], [7, 8, 9]]

flattened_list = [num for lst in list_of_lists for num in lst]

print(flattened_list)

# 3. Using list comprehension create the following list of tuples:

# [(0, 1, 0, 0, 0, 0, 0),
# (1, 1, 1, 1, 1, 1, 1),
# (2, 1, 2, 4, 8, 16, 32),
# (3, 1, 3, 9, 27, 81, 243),
# (4, 1, 4, 16, 64, 256, 1024),
# (5, 1, 5, 25, 125, 625, 3125),
# (6, 1, 6, 36, 216, 1296, 7776),
# (7, 1, 7, 49, 343, 2401, 16807),
# (8, 1, 8, 64, 512, 4096, 32768),
# (9, 1, 9, 81, 729, 6561, 59049),
# (10, 1, 10, 100, 1000, 10000, 100000)]

lst_of_tuples = [(i, i ** 0, i ** 1, i ** 2, i ** 3, i ** 4, i ** 5) for i in range(11)]

print(lst_of_tuples)

# 4. Flatten the following list to a new list:

countries = [[('Finland', 'Helsinki')], [('Sweden', 'Stockholm')], [('Norway', 'Oslo')]]

# output:
# [['FINLAND','FIN', 'HELSINKI'], ['SWEDEN', 'SWE', 'STOCKHOLM'], ['NORWAY', 'NOR', 'OSLO']]

flattend_countries = [[country.upper(), country[0:3].upper(), capital.upper()] for sublist in countries for country, capital in sublist]

print(flattend_countries)


# 5. Change the following list to a list of dictionaries:

# output:
# [{'country': 'FINLAND', 'city': 'HELSINKI'},
# {'country': 'SWEDEN', 'city': 'STOCKHOLM'},
# {'country': 'NORWAY', 'city': 'OSLO'}]

lst_of_dict = [{'country': country.upper(), 'city': city.upper()} for sublist in countries for country, city in sublist]

print(lst_of_dict)

# 6. Change the following list of lists to a list of concatenated strings:

names = [[('Asabeneh', 'Yetayeh')], [('David', 'Smith')], [('Donald', 'Trump')], [('Bill', 'Gates')]]

# output
# ['Asabeneh Yetaeyeh', 'David Smith', 'Donald Trump', 'Bill Gates']

concatenated_names = [first_name + " " + last_name for sublist in names for first_name, last_name in sublist]

print(concatenated_names)

# 7. Write a lambda function which can solve a slope or y-intercept of linear functions.

# slope = (y2 - y1) / (x2 - x1)

slope = lambda x1, x2, y1, y2: (y2 - y1) / (x2 - x1)

# y_intercept = y - m * x

y_intercept = lambda y, m, x: y - (m * x)

x1, y1 = 1, 2
x2, y2 = 3, 6

m = slope(x1, y1, x2, y2)
b = y_intercept(x1, y1, m)

print(f"Slope: {m}")
print(f"Y intercept: {b}")