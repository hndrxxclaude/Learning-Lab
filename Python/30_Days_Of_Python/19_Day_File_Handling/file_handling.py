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

