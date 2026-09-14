# REGULAR EXPRESSIONS EXCERCISES

# LEVEL 1

# 1. What is the most frequent word in the following paragraph?

paragraph = 'I love teaching. If you do not love teaching what else can you love. I love Python if you do not love something which can give you all the capabilities to develop an application what else can you love.'

import re

regex_pattern_1 = r'\w+'

matches = re.findall(regex_pattern_1, paragraph.lower())

counter = dict()

for word in matches:
    if word not in counter.keys():
        counter[word] = 1
    else:
        counter[word] += 1

sorted_words = sorted(counter.items(), key = lambda item: item[1], reverse = True)

print(f"Most frequent word in the paragraph: {sorted_words[0]}")


# 2. The position of some particles on the horizontal x-axis are -12, -4, -3 and -1 in the negative direction, 0 at origin, 4 and 8 
# in the positive direction. Extract these numbers from this whole text and find the distance between the two furthest particles.

regex_pattern_2 = r'-?\d+'

txt = "The position of some particles on the horizontal x-axis are -12, -4, -3 and -1 in the negative direction, 0 at origin, 4 and 8 in the positive direction."

matches_2 = re.findall(regex_pattern_2, txt)

index = 0

while index <= len(matches_2) - 1:
    matches_2[index] = int(matches_2[index])
    index += 1

sorted_points = sorted(matches_2)

print(f"Max distance: {sorted_points[-1] - sorted_points[0]}")


# ====================================================================


# LEVEL 2

# 1. Write a pattern which identifies if a string is a valid python variable

def is_valid_variable(st: str):

    regex = r"^[a-zA-Z_][a-zA-Z0-9_]*$"

    match = re.match(regex, st)

    if match == None:
        return False
    else:
        return True

print(is_valid_variable('first_name'))
print(is_valid_variable('first-name'))
print(is_valid_variable('1first_name'))
print(is_valid_variable('firstname'))
print(is_valid_variable('first_name%'))
print(is_valid_variable(''))


# ====================================================================


# LEVEL 3

# 1. Clean the following text. After cleaning, count three most frequent words in the string

sentence = '''%I $am@% a %tea@cher%, &and& I lo%#ve %tea@ching%;. There $is nothing; &as& mo@re rewarding as educa@ting &and& 
@emp%o@wering peo@ple. ;I found tea@ching m%o@re interesting tha@n any other %jo@bs. %Do@es thi%s mo@tivate yo@u to be a tea@cher!?'''

new_sentence = re.sub('%|@|&|#|;|\$', '', sentence)

print(new_sentence)

matches_3 = re.findall('\w+', new_sentence)

counter_2 = dict()

for word in matches_3:
    if word not in counter_2:
        counter_2[word] = 1
    else:
        counter_2[word] += 1

sorted_words_2 = sorted(counter_2.items(), key = lambda item: item[1], reverse = True)

print(f"Three most frequent words in the sentence: {sorted_words_2[:3]}")