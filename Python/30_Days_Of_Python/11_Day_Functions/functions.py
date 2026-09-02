import math

# FUNCTIONS EXCERCISES

# LEVEL 1

# 1. Declare a function add_two_numbers. It takes two parameters and it returns a sum

def add_two_numbers(num1, num2):
    print(f"The sum of {num1} and {num2} is {num1 + num2}.")

add_two_numbers(2, 3)

# 2. Area of a circle is calculated as follows: area = π x r x r. Write a function that calculates area_of_circle

def area_of_circle(radius):
    print(f"The area of a circle of radius {radius} is {3.14 * radius ** 2}")

area_of_circle(10)

# 3. Write a function called add_all_nums which takes arbitrary number of arguments and sums all the arguments. 
# Check if all the list items are number types. If not do give a reasonable feedback.

def add_all_nums (*nums):
    total = 0
    for i in nums:
        if type(i) != type(1) and type(i) != type(3.14):
            print("All the arguments must be numbers")
            return
        total += i
    print("The sum of all the numbers passed as parameters is", total)

add_all_nums(1, 2, 'Claudio')
add_all_nums(1, 2, 3)

# 4. Temperature in °C can be converted to °F using this formula: °F = (°C x 9/5) + 32. 
# Write a function which converts °C to °F, convert_celsius_to-fahrenheit.

def convert_celsius_to_fahrenheit(degrees):
    return (degrees * (9 / 5)) + 32

print(convert_celsius_to_fahrenheit(30))

# 5. Write a function called check-season, it takes a month parameter and returns the season: Autumn, Winter, Spring or Summer.

def check_season(month):
    if month in ['December', 'January', 'February']:
        return 'Winter'
    elif month in ['March', 'April', 'May']:
        return 'Spring'
    elif month in ['June', 'July', 'August']:
        return 'Summer'
    elif month in ['September', 'October', 'November']:
        return 'Autumn'
    else:
        return "Invalid month: please pass the month in the format 'January, February...'"

print(check_season('December'))
print(check_season('October'))
print(check_season('sep'))


# 6. Write a function called calculate_slope which return the slope of a linear equation

# 7. Quadratic equation is calculated as follows: ax² + bx + c = 0.
# Write a function which calculates solution set of a quadratic equation, solve_quadratic_eqn.

# 8. Declare a function named print_list. It takes a list as a parameter and it prints out each element of the list.

def print_list(lst: list):
    print(f"Printing elements of the passed list: ")
    for element in lst:
        print(element)

cities = ['Palermo', 'Milano', 'Siracusa', 'Trieste', 'Budapest', 'Parigi', 'Vienna']
print_list(cities)

# 9. Declare a function named reverse_list. It takes an array as a parameter and it returns the reverse of the array (use loops).

def reverse_list(lst: list):
    i = 0
    j = len(lst) - 1
    while i < j:
        lst[i], lst[j] = lst[j], lst[i]
        i += 1
        j -= 1
    return lst

print(reverse_list([1, 2, 3, 4, 5]))
print(reverse_list(['A', 'B', 'C']))

# 10. Declare a function named capitalize_list_items. It takes a list as a parameter and it returns a capitalized list of items

def capitalize_list_items(lst: list):
    other_lst = [element.capitalize() for element in lst]
    return other_lst

print(capitalize_list_items(['potato', 'tomato', 'mango', 'milk']))

# 11. Declare a function named add_item. It takes a list and an item parameters. It returns a list with the item added at the end.

def add_item(lst: list, item):
    new_lst = lst
    new_lst.append(item)
    return new_lst

print(add_item(['potato', 'tomato', 'mango', 'milk'], 'egg'))

# 12. Declare a function named remove_item. It takes a list and an item parameters. It returns a list with the item removed from it.
def remove_item(lst: list, item):
    new_lst = lst
    new_lst.remove(item)
    return new_lst

print(remove_item(['potato', 'tomato', 'mango', 'milk'], 'milk'))

# 13. Declare a function named sum_of_numbers. It takes a number parameter and it adds all the numbers in that range.

def sum_of_numbers(num: int):
    total = 0
    for i in range(num):
        total += i
    return total

print(sum_of_numbers(5))

# 14. Declare a function named sum_of_odds. It takes a number parameter and it adds all the odd numbers in that range.

def sum_of_odds(num: int):
    total = 0
    for i in range(num):
        if i % 2 != 0:
            total += i
        else:
            continue
    return total

print(sum_of_odds(5))

# 15. Declare a function named sum_of_even. It takes a number parameter and it adds all the even numbers in that - range.

def sum_of_even(num: int):
    total = 0
    for i in range(num):
        if i % 2 == 0:
            total += i
        else:
            continue
    return total

print(sum_of_even(5))

# ==========================================================

# LEVEL 2

# 1. Declare a function named evens_and_odds . It takes a positive integer as parameter and it counts number of evens and odds in the number.

def even_and_odds(num: int):
    if num < 0:
        return "The number must be a positive integer"

    total_even = 0
    total_odd = 0
    i = 0
    while i <= num:
        if i % 2 == 0:
            total_even += 1
        else:
            total_odd += 1
        i += 1

    return f"Total of even numbers in {num}: {total_even}.\nTotal of odd numbers in {num}: {total_odd}."

print(even_and_odds(100))

# 2. Call your function factorial, it takes a whole number as a parameter and it return a factorial of the number

def factorial(num: int):
    total = 1
    for i in range(num):
        if i == 0:
            continue
        total *= i
    return total * num

print(factorial(4))

# 3. Write different functions which take lists. 
# They should calculate_mean, calculate_median, calculate_mode, calculate_range, calculate_variance, calculate_std (standard deviation).

def calculate_mean(lst:list):
    total = 0
    for element in lst:
        total += element
    return (total / len(lst))

print(calculate_mean([5, 7.5, 10, 6.5]))

def calculate_median(lst:list):
    lst.sort()
    length = len(lst)
    if length % 2 == 0:
        return [lst[(length // 2) - 1], lst[length // 2]]
    else:
        return lst[length // 2]

print(calculate_median([1, 87, 3, 56, 7, 33]))


def calculate_range(lst:list):
    lst.sort()
    return lst[len(lst) - 1] - lst[0]

print(calculate_range([1, 87, 3, 56, 7, 33]))

def calculate_mode(lst:list):
    count = dict()
    for num in lst:
        if num not in count.keys():
            count[num] = 1
        else:
            count[num] += 1

    most_occurrences = max(count.values())

    mode = 0
    for key, value in count.items():
        if value == most_occurrences:
            mode = key
    return mode

print(calculate_mode([1, 7, 3, 56, 7, 33]))

def calculate_variance(lst:list):
    mean = calculate_mean(lst)

    scarti = list()
    
    for num in lst:
        scarti.append((num - mean) ** 2)

    total = 0
    for scarto_quadratico in scarti:
        total += scarto_quadratico

    return total / len(lst)

print(calculate_variance([1, 7, 3, 56, 7, 33]))
print(math.sqrt(calculate_variance([1, 7, 3, 56, 7, 33])))

def calculate_std(lst:list):
    return math.sqrt(calculate_variance(lst))

print(calculate_std([1, 7, 3, 56, 7, 33]))

# 4. Write a function called greet which takes a default argument, name. 
# If no argument is supplied it should print "Hello, Guest!", otherwise it should greet the person by name.

def greet(name = "Guest"):
    print(f"Hello {name}!")

greet()
greet("Claudio")

# 5. Create a function called show_args to take an arbitrary number of named arguments and print their names and values.

def show_args(name, value):
    print(f"Name: {name}, Value: {value}")

# ==========================================================

# LEVEL 3

# 1. Write a function called is_prime, which checks if a number is prime.

def is_prime(num: int):
    if num < 2:
        print(f"{num} is not a prime number.")
        return
    divisions = 0
    i = 1
    while i <= num:
        if num % i == 0:
            divisions += 1
        i += 1
    if divisions == 2:
        print(f"{num} is a prime number!")
    else:
        print(f"{num} is not a prime number.")

is_prime(2)
is_prime(3)
is_prime(4)
is_prime(7)
is_prime(9)
is_prime(13)

# 2. Write a functions which checks if all items are unique in the list.

def all_uniques(lst: list):
    if len(set(lst)) == len(lst):
        print("The elements of the list are all uniques!")
    else:
        print("The elements of the list are not uniques.")

all_uniques([1, 3, 7, 56, 13, 87])
all_uniques([1, 3, 7, 56, 13, 7])

# 3. Write a function which checks if all the items of the list are of the same data type.

def same_data_type(lst: list):
    data_types = {type(element) for element in lst}

    if len(data_types) <= 1:
        print("The elements of the list are all of the same data type!")
    else:
        print("The elements of the list are of multiple data types.")

same_data_type([1, 3, 7, 56, 13, 87])
same_data_type([1, 3, 7, 'Different type', 13, 87])

# 4. Write a function which check if provided variable is a valid python variable

def valid_variable(variable):
    pass

# 5. Go to the data folder and access the countries-data.py file.
# - Create a function called the most_spoken_languages in the world. It should return 10 or 20 most spoken languages in the world in descending order
# - Create a function called the most_populated_countries. It should return 10 or 20 most populated countries in descending order.

def most_spoken_languages():
    pass

def most_populated_countries():
    pass