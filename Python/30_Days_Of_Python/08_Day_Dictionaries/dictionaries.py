# DICTIONARIES EXCERCISES

# 1 Create an empty dictionary called dog
dog = {}

# 2 Add name, color, breed, legs, age to the dog dictionary

dog["Name"] = "Robi"
dog["Breed"] = "Rottweiler"
dog["Legs"] = 4
dog["Age"] = 20
print(dog)

# 3 Create a student dictionary and add first_name, last_name, gender, age, marital status, 
# skills, country, city and address as keys for the dictionary 

student = {
    "First name": "Claudiomario",
    "Last_name": "Gentile",
    "Gender": "M",
    "Age": 20,
    "Marital status": "Married",
    "Skills": ["Python", "C", "Assembly ARM", "Git", "Java"],
    "Country": "Italy",
    "City": "Palermo",
    "Address": {
        "Street": "Via Cozzo Brogna 35",
        "Postal Code": 90014
    }
}

print(student)

# 4 Get the length of the student dictionary
print(len(student))

# 5 Get the value of skills and check the data type, it should be a list
print(student["Skills"])
print(type(student["Skills"]))

# 6 Modify the skills values by adding one or two skills
student["Skills"].append("LangChain")
print(student["Skills"])

# 7 Get the dictionary keys as a list
print(student.keys())

# 8 Get the dictionary values as a list
print(student.values())

# 9 Change the dictionary to a list of tuples using items() method
print(student.items())

# 10 Delete one of the items in the dictionary
del student["Address"]
print(student)

# 11 Delete one of the dictionaries
del student
print(dog)
#print(student)