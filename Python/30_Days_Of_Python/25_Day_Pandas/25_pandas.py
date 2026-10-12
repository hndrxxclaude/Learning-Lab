# PANDAS EXERCISES

import pandas as pd
import numpy as np

# 1. Read the hacker_news.csv file from data directory
df = pd.read_csv('data/hacker_news.csv')

# 2. Get the first five rows
print(df.head())

# 3. Get the last five rows
print(df.tail())

# 4. Get the title column as Pandas Series
titles = df['title']
print(titles)

# 5. Count the number of rows and columns:
# - Filter the titles wich contain Python
# - Filter the titles wich contain JavaScript
# - Explore the data and make sense of it

print(f"Number of rows: {df.shape[0]}\nNumber of columns: {df.shape[1]}")

# 5.1
python_df = df[df['title'].str.contains(r'\bpython', case = False, na = False)] # case = False in order to make it not case sensitive, na = False in order to not raise errors if some fields are N/A
print(python_df)

# 5.2
js_df = df[df['title'].str.contains(r'\bjava\s?script\b', case = False, na = False)] # \s? is an optional whitespace
print(js_df)

# 5.3
print(df.info())
print(df.describe())
print(df.columns)
print(df['num_points'].head())