#1
list = ["Thirty", "Days", "Of", "Python"]
print(" ".join(list))

#2
list_2 = ["Coding", "For", "All"]
print(" ".join(list_2))

#3, 4, 5, 6, 7
company = "Coding For All"
print(company)
print(len(company))
print(company.upper())
print(company.lower())

#8
print("Coding For All".capitalize())
print("Coding For All".title())
print("Coding For All".swapcase())

#9
print(company[0:6])

#10 
print(company.find("Coding"))

#11, 12
print("Coding For All".replace("Coding", "Python"))
print("Python For Everyone".replace("Everyone", "All"))

#13
print("Coding For All".split(' '))

#14
print("Facebook, Google, Microsoft, Apple, IBM, Oracle, Amazon".split(", "))

#20, 21, 22, 23, 24
print("Coding For All".index("C"))
print("Coding For All".index("F"))
print("Coding For All People".rfind("l"))
print('You cannot end a sentence with because because because is a conjunction'.find("because"))
print('You cannot end a sentence with because because because is a conjunction'.rindex("because"))

#25
print('You cannot end a sentence with because because because is a conjunction'[31:54])

#28, 29, 30
print(company.startswith("Coding"))
print(company.endswith("Coding"))
print('   Coding For All      '.strip(" "))

#32
print("# ".join(['Django', 'Flask', 'Bottle', 'Pyramid', 'Falcon']))

#33
print("I\nam\nenjoying\nthis\nchallenge")
print("I\njust\nwonder\nwhat\nis\nnext")

#34
print("Name\tAge\tCountry\tCity")
print("Claudio\t20\tItaly\tMilan")

#35
radius = 10
area = 3.14 * 10 ** 2
print("The area of a circle with radius {} is {}".format(radius, int(area)))

#36
a = 8
b = 6
print(f"{a} + {b} = {a + b}")
print(f"{a} - {b} = {a - b}")
print(f"{a} * {b} = {a * b}")
print(f"{a} / {b} = {a / b:.2f}")
print(f"{a} % {b} = {a % b}")
print(f"{a} // {b} = {a // b}")
print(f"{a} ** {b} = {a ** b}")