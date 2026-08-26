import math

age = 20 #1
height = 1.75 #2
cnum = 1 + 2j #3

#4
base = float(input("Enter the base of the triangle: "))
h = float(input("Enter the height of the triangle: "))
print("The area of the triangle is: " + str((0.5 * base * h)))

#5
a = float(input("Enter side a of the triangle: "))
b = float(input("Enter side b of the triangle: "))
c = float(input("Enter side c of the triangle: "))

print("Perimeter of the triangle: " + str(a + b + c))

#6
length = float(input("Enter length of the rectangle: "))
width = float(input("Enter width of the rectangle: "))

print("Area of the rectangle: " + str(width * length))
print("Perimeter of the rectangle: " + str(2 * (width + length)))

#7
radius = float(input("Enter radius of the circle: "))
print("Area of the circle: " + str(3.14 * (radius ** 2)))
print("Circumference: " + str(2 * 3.14 * radius))

#8
slope = 2
y_intercept = -2
x_intercept = 1

#9
slope_2 = (10 - 2) / (6 - 2)
euclidean = math.sqrt(((6 - 2) ** 2) + ((10 - 2) ** 2))

#10
print(slope == slope_2)

#11
x = -3

#12
print(len("python") > len("dragon"))

#13
print("on" in "python" and "on" in "dragon")

#14
print("jargon" in "I hope this course is not full of jargon")

#15
print("on" not in "python" and "on" not in "dragon")

#16
py_len = str(float(len("python")))
print(type(py_len))

#17
#By dividing with the % operator by 2:

is_even = 8 % 2 == 0
print(is_even)

#18
print(7 // 3 == int(2.7))

#19
print(type("10") == type(10))

#20
print(int(float("9.8")) == 10)

#21
hours = float(input("How many hours do you work per week? Please Enter: "))
pay = float(input("How much do you get paid per hour? Please Enter: "))

print("Your weekly earning:",str(hours * pay),"$")

#22
years = int(input("Enter how many years you have lived: "))

print("You have lived for", str(31536000 * years), "seconds")

#23
print("\n1","1","1","1","1")
print("2","1","2","4","8")
print("3","1","3","9","27")
print("4","1","4","16","64")
print("5","1","5","25","125")