# PYTHON PIP - PYTHON PACKAGE MANAGER EXCERCISES

# 1. Read this url and find the 10 most frequent words.
import functions

romeo_and_juliet = 'https://www.gutenberg.org/cache/epub/1513/pg1513-images.html'

import requests

response = requests.get(romeo_and_juliet)

print(response) 
txt = response.text

print(functions.find_most_common_words(txt, 10))


# 2. Read the cats API and find:
# - the min, max, mean, median, standard deviation of cats' weight in metric units.
# - the min, max, mean, median, standard deviation of cats' lifespan in years.
# - Create a frequency table of country and breed of cats
import re
import statistics

cats_api = 'https://api.thecatapi.com/v1/breeds'
my_cats_key = 'YOUR_API_KEY_HERE'

headers = {
    'x-api-key': my_cats_key
}


api_response = requests.get(cats_api, headers=headers)
print(api_response.status_code)

breeds = api_response.json()
# print(breeds[:3])

# 2.1 
weights = []
weights_regex = r'[0-9]+(?:[.,][0-9]+)?'

for breed in breeds:
    matches = re.findall(weights_regex, breed['weight']['metric'])
    for match in matches:
        weights.append(float(match))

sorted_weights = sorted(weights)
print(f"Weight Min: {sorted_weights[0]}")
print(f"Weight Max: {sorted_weights[-1]}")
print(f"Weight Mean: {round(statistics.mean(sorted_weights), 2)}")
print(f"Weight Median: {statistics.median(sorted_weights)}")
print(f"Weight Standard deviation: {round(statistics.stdev(sorted_weights), 2)}")

# 2.2
lifespans = []
lifespans_regex = r'[0-9]+'

for breed in breeds:
    matches = re.findall(lifespans_regex, breed['life_span'])
    for match in matches:
        lifespans.append(int(match))

sorted_lifespans = sorted(lifespans)
print(f"Lifespan Min: {sorted_lifespans[0]}")
print(f"Lifespan Max: {sorted_lifespans[-1]}")
print(f"Lifespan Mean: {round(statistics.mean(sorted_lifespans), 2)}")
print(f"Lifespan Median: {statistics.median(sorted_lifespans)}")
print(f"Lifespan Standard deviation: {round(statistics.stdev(sorted_lifespans), 2)}")

# 2.3 
frequency_table = dict()
for breed in breeds:
    if breed['origin'] not in frequency_table.keys():
        frequency_table[breed['origin']] = 1
    else:
        frequency_table[breed['origin']] += 1

print(frequency_table)


# 3. Read the countries api and find:
# - the 10 largest countries
# - the 10 most spoken languages
# - the total number of languages in the countries API

countries_api = 'https://api.restcountries.com/countries/v5'
my_countries_key = 'YOUR_API_KEY_HERE'

countries_api_response = requests.get(countries_api, headers = {'Authorization': f'Bearer {my_countries_key}'})
print(countries_api_response.status_code)

text = countries_api_response.json()

# Since every country field sits under data.objects...

countries = text['data']['objects']

# 3.1
largest_countries = []
for country in countries:
    largest_countries.append({"country": country['names']['official'], "area": country['area']['kilometers']})

print(f"Ten largest countries: \n{sorted(largest_countries, key = lambda k: k['area'], reverse = True)[:10]}")

# 3.2
languages = dict()
for country in countries:
    for lang in country['languages']:
        if lang['name'] not in languages.keys():
            languages[lang['name']] = 1
        else:
            languages[lang['name']] += 1

print(f"Ten most spoken languages: \n{sorted(languages.items(), key = lambda item: item[1], reverse = True)[:10]}")

# 3.3
print(f"Total number of languages: {len(languages)}")


# 4. UCI is one of the most common places to get data sets for data science and machine learning. 
# Read the content of UCL (https://archive.ics.uci.edu/datasets). 
# Without additional libraries it will be difficult, so you may try it with BeautifulSoup4

from bs4 import BeautifulSoup

url = 'https://archive.ics.uci.edu/datasets'
uci_response = requests.get(url)

soup = BeautifulSoup(uci_response.text, "html.parser")

print("Title:", soup.title.text)
print("First paragraph:", soup.find("p").text)