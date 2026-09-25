import os
import re
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