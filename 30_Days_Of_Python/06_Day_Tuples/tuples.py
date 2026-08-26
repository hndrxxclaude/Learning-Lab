# TUPLE EXCERCISES

# Level 1

#1 Create an empty tuple

tpl = tuple()

#2 Create a tuple containing names of your sisters and your brothers (imaginary siblings are fine)

brothers = ('Marte', 'Marco Aurelio')
sisters = ('Ludovica', 'Afrodite')

#3 Join brothers and sisters tuples and assign it to siblings

print(f"Brothers: {brothers}")
print(f"Sisters: {sisters}")
siblings = brothers + sisters
print(f"All my siblings: {siblings}")

#4 How many siblings do you have?

print(f"I have {len(siblings)} siblings.")

#5 Modify the siblings tuple and add the name of your father and mother and assign it to family_members

parents = ('Claudio', 'Giada')
print(f"Parents: {parents}")
family_members = parents + siblings
print(f"Family members: {family_members}")

#-----------------------------------------------

#Level 2

#1 Unpack siblings and parents from family_members

print(len(family_members))
print(f"Siblings: {family_members[2:6]}")
print(f"Parents: {family_members[0:2]}")

#2 Create fruits, vegetables and animal products tuples. Join the three tuples and assign it to a variable called food_stuff_tp.

fruits = ('banana', 'peach', 'cherry', 'orange')
vegetables = ('salad', 'eggplant', 'tomato')
animal = ('meat', 'beef', 'eggs', 'chicken')

food_stuff_tp = fruits + vegetables + animal
print(f"Food: {food_stuff_tp}")

#3 Change the about food_stuff_tp tuple to a food_stuff_lt list

food_stuff_lt = list(food_stuff_tp)
print(f"Food (but as a List): {food_stuff_lt}")

#4 Slice out the middle item or items from the food_stuff_tp tuple or food_stuff_lt list.

print(len(food_stuff_lt))
print(food_stuff_lt[5])

#5 Slice out the first three items and the last three items from food_stuff_lt list

print(f"First three: {food_stuff_lt[0:3]}")
print(f"First three: {food_stuff_lt[-3:]}")

#6 Delete the food_stuff_tp tuple completely

del food_stuff_tp
#print(food_stuff_tp) is now deleted and can't be printed

#7 Check if an item exists in tuple:
# - Check if 'Estonia' is a nordic country
# - Check if 'Iceland' is a nordic country

nordic_countries = ('Denmark', 'Finland','Iceland', 'Norway', 'Sweden')

print(f"Estonia is a nordic country: {'Estonia' in nordic_countries}")
print(f"Iceland is a nordic country: {'Iceland' in nordic_countries}")