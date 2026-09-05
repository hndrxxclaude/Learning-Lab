import mymodule
print(mymodule.generate_full_name("Claudiomario", "Gentile"))

# MODULES EXCERCISES

# LEVEL 1

# 1. Write a function which generates a six digit/character random_user_id.

import string
import random

def random_user_id():
    pool = string.ascii_letters + string.digits
    id = ""
    for i in range(6):
        id += "".join(random.choice(pool))
    return id

print(random_user_id())


# 2. Modify the previous task. Declare a function named user_id_gen_by_user. 
# It doesn’t take any parameters but it takes two inputs using input(). 
# One of the inputs is the number of characters and the second input is the number of IDs which are supposed to be generated.

def user_id_gen_by_user():
    length = int(input("How long should the user IDs be? Please enter: "))
    number = int(input("How many IDs should be generated? Please enter: "))

    pool = string.ascii_letters + string.digits

    for i in range(number):
        id = ""
        for j in range(length):
            id += "".join(random.choice(pool))

        print(id)

user_id_gen_by_user()


# 3. Write a function named rgb_color_gen. It will generate rgb colors (3 values ranging from 0 to 255 each).

def rgb_color_gen():
    color = []
    for i in range(3):
        color.append(random.randint(0, 255))
    return f"rgb({color[0]}, {color[1]}, {color[2]})"

print(rgb_color_gen())


# =========================================================

# LEVEL 2

# 1. Write a function list_of_hexa_colors which returns any number of hexadecimal colors in an array 
# (six hexadecimal numbers written after #. Hexadecimal numeral system is made out of 16 symbols, 0-9 and first 6 letters of the alphabet, a-f. Check the task 6 for output examples).

def list_of_hexa_colors(number: int):
    colors = []

    pool = string.digits + "abcdef"

    for i in range(number):
        id = "#"
        for j in range(6):
            id += "".join(random.choice(pool))
        colors.append(id)

    return colors

print(list_of_hexa_colors(3))


# 2. Write a function list_of_rgb_colors which returns any number of RGB colors in an array.

def list_of_rgb_colors(number: int):
    colors = []

    for i in range(number):
        colors.append(rgb_color_gen())

    return colors

print(list_of_rgb_colors(3))

# 3. Write a function generate_colors which can generate any number of hexa or rgb colors.

def generate_colors(type: str, number: int):
    if type != "hexa" and type != "rgb":
        print("The type parameter either has to be 'hexa' or 'rgb'.")
        return

    if number <= 0:
        print("Number of colors must be a positive integer")
        return

    colors = []

    if type == "hexa":
        pool = string.digits + "abcdef"
        for i in range(number):
            id = "#"
            for j in range(6):
                id += "".join(random.choice(pool))
            colors.append(id)
        print(colors)
    else:
        for i in range(number):
            colors.append(rgb_color_gen())
        print(colors)

generate_colors("idk", 4)
generate_colors("rgb", -2)
generate_colors('hexa', 3)  
generate_colors('hexa', 1)
generate_colors('rgb', 3)  
generate_colors('rgb', 1)  


# =========================================================

# LEVEL 3

# 1. Call your function shuffle_list, it takes a list as a parameter and it returns a shuffled list

# 2. Write a function which returns an array of seven random numbers in a range of 0-9. All the numbers must be unique.
