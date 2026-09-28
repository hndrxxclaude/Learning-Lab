# WEB SCRAPING EXCERCISES

# 1. Scrape the following website and store the data as json file(url = 'http://www.bu.edu/president/boston-university-facts-stats/').

import requests
from bs4 import BeautifulSoup
import json

boston_url = 'http://www.bu.edu/president/boston-university-facts-stats/'

boston_response = requests.get(boston_url)
print(boston_response)

soup = BeautifulSoup(boston_response.text, "html.parser")

with open("22_Day_Web_Scraping/boston_university_facts.json", "w", encoding = "utf-8") as f:
    json.dump({"text": soup.get_text(" ", strip = True)}, f, ensure_ascii = False, indent = 4)


# 2. Extract the table in this url (https://archive.ics.uci.edu/dataset/53/iris) and change it to a json file

iris_url = 'https://archive.ics.uci.edu/dataset/53/iris'

iris_response = requests.get(iris_url)
iris_soup = BeautifulSoup(iris_response.text, "html.parser")

tables = iris_soup.find_all("table")
print(f"Found {len(tables)} tables.")

result = []
for table in tables:
    headers = [th.get_text(" ", strip = True) for th in table.find_all("th")]

    rows = []
    for tr in table.find_all("tr"):
        cells = [td.get_text(" ", strip = True) for td in tr.find_all("td")]


        if not cells:
            continue
        if headers and len(headers) == len(cells):
            rows.append(dict(zip(headers, cells)))
        else:
            rows.append(cells)

    result.append({"headers": headers, "rows": rows})

with open("22_Day_Web_Scraping/iris_table.json", "w", encoding = "utf-8") as f:
    json.dump({"tables": result}, f, ensure_ascii = False, indent = 4)


# 3. Scrape the presidents table and store the data as json(https://en.wikipedia.org/wiki/List_of_presidents_of_the_United_States).
# The table is not very structured and the scrapping may take very long time.

presidents_url = 'https://en.wikipedia.org/wiki/List_of_presidents_of_the_United_States'

presidents_response = requests.get(presidents_url, headers = {"User-Agent": "Day-22-Learning-Scraper/1.0 (student project; claudiomariogentile0@gmail.com)"})
presidents_soup = BeautifulSoup(presidents_response.text, "html.parser")

print(presidents_response.status_code)

presidents_tables = presidents_soup.find_all("table")

presidents_result = []

for table in presidents_tables:
    headers = [th.get_text(" ", strip = True) for th in table.find_all("th")]

    rows = []
    for tr in table.find_all("tr"):
        cells = [td.get_text(" ", strip = True) for td in tr.find_all("td")]

    if not cells: 
        continue
    if headers and len(headers) == len(cells):
        rows.append(dict(zip(headers, cells)))
    else:
        rows.append(cells)

    presidents_result.append({"headers": headers, "rows": rows})

with open("22_Day_Web_Scraping/list_of_presidents.json", "w", encoding = "utf-8") as f:
    json.dump({"tables": presidents_result}, f, ensure_ascii = False, indent = 4)