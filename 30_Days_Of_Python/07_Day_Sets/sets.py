# SETS EXCERCISES

# LEVEL 1

# 1 Find the length of the set it_companies

# sets
it_companies = {'Facebook', 'Google', 'Microsoft', 'Apple', 'IBM', 'Oracle', 'Amazon'}
A = {19, 22, 24, 20, 25, 26}
B = {19, 22, 20, 25, 26, 24, 28, 27}
age = [22, 19, 24, 25, 26, 24, 25, 24]

print(len(it_companies))

# 2 Add 'Twitter' to it_companies
it_companies.add('Twitter')
print(it_companies)

# 3 Insert multiple IT companies at once to the set it_companies
lst = ['NVIDIA', 'Meta', 'Reply', 'Bending Spoons', 'Tesla']
it_companies.update(lst)
print(it_companies)

# 4 Remove one of the companies from the set it_companies
it_companies.pop()

# 5 What is the difference between remove and discard
# The discard method does not raise an exception if an item is missing from a set

#===================================


# LEVEL 2

# 1 Join A and B
print(A.union(B))

# 2 Find A intersection B
print(A.intersection(B))

# 3 Is A subset of B
print("A is a subset of B: ", A.issubset(B))

# 4 Are A and B disjoint sets
print("A and B are disjoint sets: ", A.isdisjoint(B))

# 5 Join A with B and B with A
print(A.union(B))
print(B.union(A))

# 6 What is the symmetric difference between A and B
print(A.symmetric_difference(B))

# 7 Delete the sets completely
del A
del B

#===================================


# LEVEL 3

# 1 Convert the ages to a set and compare the length of the list and the set, which one is bigger?

st = set(age)
print(len(st))
print(len(age))
print("Are they the same length?", len(st) == len(age))
print("The age list is longer:", len(age) > len(st))

# 2 Explain the difference between the following data types: string, list, tuple and set

# String: a group of characters, that can be manipulated in many ways
# List: A collection, ordered, it can be modified
# Tuple: A collection, ordered, immutable
# Set: A collection, un-ordered, it can be modified 

# 3 I am a teacher and I love to inspire and teach people. 
# How many unique words have been used in the sentence? Use the split methods and set to get the unique words.

my_phrase_as_lt = "I am a teacher and I love to inspire and teach people".split()
my_phrase_as_st = set(my_phrase_as_lt)
print(f"Unique words: {my_phrase_as_st}\nNumber of unique words: {len(my_phrase_as_st)}")