# CONDITIONALS EXCERCISES

# LEVEL 1

# 1. Get user input using input(“Enter your age: ”). If user is 18 or older, give feedback: You are old enough to drive.
# If below 18 give feedback to wait for the missing amount of years.

age = int(input("Enter your age: "))

print("You're old enough to drive.") if age >= 18 else print(f"You need {18 - age} more years to learn to drive.") # Short-hand form


# 2. Compare the values of my_age and your_age using if … else. Who is older (me or you)? 
# Use input(“Enter your age: ”) to get the age as input. You can use a nested condition to print 'year' for 1 year difference in age, 
# 'years' for bigger differences, and a custom text if my_age = your_age.

my_age = 20
your_age = int(input("Enter your age: "))

if my_age > your_age:
    if my_age - your_age == 1:
        print("You're 1 year younger than me.")
    else:
        print(f"You are {my_age - your_age} years younger than me")
elif your_age > my_age:
    if your_age - my_age == 1:
        print("You're 1 year older than me.")
    else:
        print(f"You are {your_age - my_age} years older than me")
else:
    print("We're the same age")


# 3. Get two numbers from the user using input prompt. If a is greater than b return a is greater than b, 
# if a is less b return a is smaller than b, else a is equal to b.

a = int(input("Enter number a: "))
b = int(input("Enter number b: "))

if a > b:
    print("a is greater than b.")
elif a < b:
    print("a is smaller than b.")
else:
    print("a is equal to b.")

# ======================================================

# LEVEL 2 

# 1. Write a code which gives grade to students according to theirs scores

grade = int(input("Enter your grade (0-100): "))

if 100 >= grade >= 90:
    print("You got an A.")
elif 89 >= grade >= 80:
    print("You got a B.")
elif 79 >= grade >= 70:
    print("You got a C.")
elif 69 >= grade >= 60:
    print("You got a D.")
else:
    print("Sorry, You got an F. Try harder.")

# 2. Get the month from user input then check if the season is Autumn, Winter, Spring or Summer. 
# If the user input is: September, October or November, the season is Autumn. December, January or February, the season is Winter. 
# March, April or May, the season is Spring June, July or August, the season is Summer

month = int(input("Enter the month (1-12): "))

if 9 <= month <= 11:
    print("It's Autumn.")
elif 3 <= month <= 5: 
    print("It's Spring.")
elif 6 <= month <= 8:
    print("It's Summer.")
else:
    print("It's Winter")

# 3. The following list contains some fruits:

fruits = ['banana', 'orange', 'mango', 'lemon']

# If a fruit doesn't exist in the list add the fruit to the list and print the modified list. 
# If the fruit exists print('That fruit already exist in the list')

frt = input("Enter a fruit: ")

if frt not in fruits:
    fruits.append(frt)
    print(f"Fruit added: {fruits}")
else:
    print("That fruit already exists in the list")


# ======================================================

# LEVEL 3

# 1. Here we have a person dictionary. Feel free to modify it!

    person={
    'first_name': 'Claudio',
    'last_name': 'Gentile',
    'age': 20,
    'country': 'Italy',
    'is_married': True,
    'skills': ['Java', 'C', 'Assembly', 'R', 'SQL', 'Python'],
    'address': {
        'street': 'Ha you thought',
        'zipcode': '0'
    }
    }

# * Check if the person dictionary has skills key, if so print out the middle skill in the skills list.
# * Check if the person dictionary has skills key, if so check if the person has 'Python' skill and print out the result.
# * If a person skills has only JavaScript and React, print('He is a front end developer'), if the person skills has Node, Python, MongoDB, print('He is a backend developer'), if the person skills has React, Node and MongoDB, Print('He is a fullstack developer'), else print('unknown title') - for more accurate results more conditions can be nested!
# * If the person is married and if he lives in Finland, print the information

# Checking and printing
if 'skills' in person.keys():
    skills = person['skills']
    if len(skills) % 2 == 0:    # if skills has a even number of elements, we must print the 2 middle ones
        print("Middle skills: ")
        print(skills[len(skills) // 2])
        print(skills[(len(skills) - 1) // 2])
    else:                       # else we print the middle skill only               
        print("Middle skill: ")
        print(skills[len(skills) // 2])

    if 'Python' in skills: # Here we check if the person has Python in their skills
        print("This person has Python in his skillset!")
    else:
        print("Unfortunately this person does not have Pyhton in his skillset.")

    if 'JavaScript' in skills and 'React' in skills and len(skills) == 2:
        print("He is a front end developer")
    elif 'Node' in skills and 'Python' in skills and 'MongoDB' in skills and len(skills) == 3:
        print("He's a back end developer")
    elif 'React' in skills and 'Node' in skills and 'MongoDB' in skills:
        print("He's a full stack developer")
    else:
        print("Unknown title")

if person['country'] == "Finland" and person['is_married']:
    print(f"{person['first_name']} {person['last_name']} lives in Finland. He is married")