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

def find_most_common_words(text: str, number: int):
    if number <= 0:
        return "The number of most common words must be a positive integer."
    regex = r'\w+'

    try:
        with open(text, "r", encoding = "utf-8") as f:
            txt = f.read().lower()

            matches = re.findall(regex, txt)

            words = dict()
            for word in matches:
                if word not in words.keys():
                    words[word] = 1
                else:
                    words[word] += 1

            return sorted(words.items(), key = lambda item: item[1], reverse = True)[:number]
    except:
        print("Il testo passato come argomento non è un file.")

    txt = text.lower()

    matches = re.findall(regex, txt)
    
    words = dict()
    for word in matches:
        if word not in words.keys():
            words[word] = 1
        else:
            words[word] += 1
    
    return sorted(words.items(), key = lambda item: item[1], reverse = True)[:number]

print(find_most_common_words("./data/obama_speech.txt", 3))
print(find_most_common_words("Patata bollente patata bollente patata bollente patata", 1))