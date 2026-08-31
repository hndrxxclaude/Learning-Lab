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
    pass

def calculate_median(lst:list):
    pass

def calculate_range(lst:list):
    pass

def calculate_mode(lst:list):
    pass

def calculate_variance(lst:list):
    pass

def calculate_std(lst:list):
    pass


# LEVEL 3

