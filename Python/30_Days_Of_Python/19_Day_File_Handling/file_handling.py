# FILE HANDLING EXCERCISES

# LEVEL 1

# 1. Write a function which count number of lines and number of words in a text. All the files are in the data the folder:
# - Read obama_speech.txt file and count number of lines and words
# - Read michelle_obama_speech.txt file and count number of lines and words
# - Read donald_speech.txt file and count number of lines and words
# - Read melina_trump_speech.txt file and count number of lines and words

import re

def num_of_lines_and_words(file: str): 
    with open(file, "r", encoding = "utf-8") as f:
        lines = f.readlines()

    print(f"The file {file} contains {len(lines)} lines.")

    words = re.findall("\w+", "".join(lines))
    print(f"The file {file} contains {len(words)} words.")

num_of_lines_and_words("./data/obama_speech.txt")
num_of_lines_and_words("./data/michelle_obama_speech.txt")
num_of_lines_and_words("./data/donald_speech.txt")
num_of_lines_and_words("./data/melina_trump_speech.txt")


# 2. Read the countries_data.json data file in data directory, create a function that finds the ten most spoken languages
import json

def most_spoken_languages(filename: str, number: int):
    with open(filename, "r", encoding = "utf-8") as f:
        text = f.read()
        text_as_dct = json.loads(text)

        languages = dict()
        for country in text_as_dct:
            for lang in country["languages"]:
                if lang not in languages.keys():
                    languages[lang] = 1
                else:
                    languages[lang] += 1

        return sorted(languages.items(), key = lambda item: item[1], reverse = True)[:number]

print(most_spoken_languages("./data/countries_data.json", 10))
print(most_spoken_languages("./data/countries_data.json", 3))


# 3. Read the countries_data.json data file in data directory, create a function that creates a list of the ten most populated countries

def most_populated_countries(filename: str, number: int):
    with open(filename, "r", encoding = "utf-8") as f:
        text = f.read()
        text_as_dct = json.loads(text)

        countries = []
        for country in text_as_dct:
            countries.append({'country': country["name"], 'population': country["population"]})

        return sorted(countries, key = lambda k: k['population'], reverse = True)[:number]

print(most_populated_countries("./data/countries_data.json", 10))
print(most_populated_countries("./data/countries_data.json", 3))


# ========================================================================


# LEVEL 2 

# 1. Extract all incoming email addresses as a list from the email_exchange_big.txt file.

def extract_emails(filename: str):
    with open(filename, "r", encoding = "utf-8") as f:
        txt = f.read()

        regex = r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}"

        matches = re.findall(regex, txt)

        return matches
    
# print(extract_emails("./data/email_exchanges_big.txt")) leaving it as a comment because it's too many mails

# 2. Find the most common words in the English language. Call the name of your function find_most_common_words, 
# it will take two parameters - a string or a file and a positive integer, indicating the number of words. 
# Your function will return an array of tuples in descending order. Check the output
import os
    

def find_most_common_words(text: str, number: int):
    if number <= 0:
        raise ValueError("The number of words must be a positive integer.")
    
    regex = r'\w+'

    if os.path.isfile(text):
        with open(text, "r", encoding = "utf-8") as f:
            content = f.read().lower()
    else:
        content = text.lower()
    
    matches = re.findall(regex, content)

    words = dict()
    for word in matches:
        if word not in words.keys():
            words[word] = 1
        else:
            words[word] += 1
    
    print(f"The {number} most frequent words in {text} are: ")
    return sorted(words.items(), key = lambda item: item[1], reverse = True)[:number]

print(find_most_common_words("./data/obama_speech.txt", 3))
print(find_most_common_words("I love love because love is all we need", 1))


# 3. Use the function, find_most_frequent_words to find:
# - The ten most frequent words used in Obama's speech
# - The ten most frequent words used in Michelle's speech
# - The ten most frequent words used in Trump's speech
# - The ten most frequent words used in Melina's speech

print(find_most_common_words("./data/obama_speech.txt", 10))
print(find_most_common_words("./data/michelle_obama_speech.txt", 10))
print(find_most_common_words("./data/donald_speech.txt", 10))
print(find_most_common_words("./data/melina_trump_speech.txt", 10))


# 4. Write a python application that checks similarity between two texts. It takes a file or a string as a parameter and 
# it will evaluate the similarity of the two texts. For instance check the similarity between the transcripts 
# of Michelle's and Melina's speech. You may need a couple of functions, function to clean the text(clean_text), 
# function to remove support words(remove_support_words) and finally to check the similarity(check_text_similarity). 
# List of stop words are in the data directory

from stop_words_copy import stop_words as sw

def clean_text(text: str) -> list[str]:
    if os.path.isfile(text):
        with open(text, "r", encoding = "utf-8") as f:
            content = f.read().lower()
    else:
        content = text.lower()

    return re.findall(r"\b\w+\b", content)


def remove_support_words(text: list[str]) -> list[str]:
    return [word for word in text if word not in sw]


def check_text_similarity(text_1: str, text_2: str) -> float:
    words_1 = set(remove_support_words(clean_text(text_1)))
    words_2 = set(remove_support_words(clean_text(text_2)))

    intersection = words_1.intersection(words_2)
    union = words_1.union(words_2)

    return round(len(intersection) / len(union), 2) if union else 0.0

print(f"Text similarity between Michelle's and Melina's speeches: {check_text_similarity("./data/michelle_obama_speech.txt", "./data/melina_trump_speech.txt")}")


# 5. Find the 10 most repeated words in the romeo_and_juliet.txt

print(find_most_common_words("./data/romeo_and_juliet.txt", 10))


# 6. Read the hacker news csv file and find out:
# - Count the number of lines containing python or Python
# - Count the number lines containing JavaScript, javascript or Javascript
# - Count the number lines containing Java and not JavaScript

with open("./data/hacker_news.csv") as f:
   txt = f.readlines() # we have a list of all the lines in the file

    # counters
   py_number = 0
   js_number = 0
   java_number = 0

   py_regex = r'\b[Pp]ython\b'
   js_regex = r'\b[Jj]ava[Ss]cript\b'
   java_regex = r'\bJava\b'
   not_js_regex = r'^(?!.*\bJavaScript\b).*$' # ^ start of string or line, ?! negation, .* any single character 0 or more times,

   for line in txt:
        if len(re.findall(py_regex, line)) > 0:
            py_number += 1
        if len(re.findall(js_regex, line)) > 0:
           js_number += 1
        if len(re.findall(java_regex, line)) > 0 and len(re.findall(not_js_regex, line)) > 0:
            java_number += 1

print(f"Number of lines containing python or Python: {py_number}")
print(f"Number of lines containing JavaScript, javascript or Javascript: {js_number}")
print(f"Number of lines containing Java and not JavaScript: {java_number}")
   