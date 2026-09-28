# CLASSES AND OBJECTS EXCERCISES

# LEVEL 1

# 1. Python has the module called statistics and we can use this module to do all the statistical calculations.
# However, to learn how to make function and reuse function let us try to develop a program, which calculates 
# the measure of central tendency of a sample (mean, median, mode) and measure of variability (range, variance, standard deviation). 
# In addition to those measures, find the min, max, count, percentile, and frequency distribution of the sample. 
# You can create a class called Statistics and create all the functions that do statistical calculations as methods 
# for the Statistics class.
import math

class Statistics:
    def __init__(self, data):
        self.data = data

    def count(self):
        return len(self.data)

    def sum(self):
        total = 0
        for elem in self.data:
            total += elem
        return total

    def min(self):
        return sorted(self.data)[0]

    def max(self):
        return sorted(self.data)[-1]

    def range(self):
        return self.max() - self.min()

    def mean(self):
        return round(self.sum() / self.count(), 2)

    def median(self):
        if len(self.data) % 2 == 0:
            return (sorted(self.data)[(len(self.data) // 2) - 1] + sorted(self.data)[(len(self.data) // 2)]) / 2
        else:
            return sorted(self.data)[(len(self.data) // 2) - 1]

    def mode(self):
        counter = dict()
        for elem in self.data:
            if elem not in counter.keys():
                counter[elem] = 1
            else:
                counter[elem] += 1
        mode = sorted(counter.items(), key = lambda item: item[1], reverse = True)[0]
        return f"Mode: {mode[0]}, Count: {mode[1]}"

    def var(self, population = True):
        data_mean = self.mean()
        sum_of_squared = 0
        for elem in self.data:
            sum_of_squared += (elem - data_mean) ** 2
        if population:
            return round(sum_of_squared / self.count(), 2)
        else:
            return round(sum_of_squared / self.count() - 1, 2)

    def std(self):
        return round(math.sqrt(self.var()), 2)

    def freq_dist(self):
        counter = dict()
        for elem in self.data:
            counter[elem] = counter.get(elem, 0) + 1
        n = self.count()
        return sorted(((c / n * 100, v) for v, c in counter.items()), reverse = True)

ages = [31, 26, 34, 37, 27, 26, 32, 32, 26, 27, 27, 24, 32, 33, 27, 25, 26, 38, 37, 31, 34, 24, 33, 29, 26]

data = Statistics(ages)

print('Count:', data.count()) # 25
print('Sum: ', data.sum()) # 744
print('Min: ', data.min()) # 24
print('Max: ', data.max()) # 38
print('Range: ', data.range()) # 14
print('Mean: ', data.mean()) # 30
print('Median: ', data.median()) # 29
print(data.mode()) # {'mode': 26, 'count': 5}
print('Standard Deviation: ', data.std()) # 4.2
print('Variance: ', data.var()) # 17.5
print('Frequency Distribution: ', data.freq_dist()) # [(20.0, 26), (16.0, 27), (12.0, 32), (8.0, 37), (8.0, 34), (8.0, 33), (8.0, 31), (8.0, 24), (4.0, 38), (4.0, 29), (4.0, 25)]


# ========================================================

# LEVEL 2

# 1. Create a class called PersonAccount. It has firstname, lastname, incomes, expenses properties and it has total_income, 
# total_expense, account_info, add_income, add_expense and account_balance methods. 
# Incomes is a set of incomes and its description. The same goes for expenses.

class PersonAccount:
    def __init__(self, firstname, lastname, incomes: list[tuple], expenses: list[tuple]):
        self.firstname = firstname
        self.lastname = lastname
        self.incomes = incomes
        self.expenses = expenses

    def total_income(self):
        total = 0
        for elem in self.incomes:
            total += elem[0]
        return total

    def total_expense(self):
        total = 0
        for elem in self.expenses:
            total += elem[0]
        return total

    def account_balance(self):
        return self.total_income() - self.total_expense()

    def account_info(self):
        return f"Account holder: {self.firstname} {self.lastname} | Balance: {self.account_balance()}"

    def add_income(self, amount, description):
        self.incomes.append((amount, description))
        print(f"Income added! {description}")
        print(f"Actual balance: {self.account_balance()}")

    def add_expense(self, amount, description):
        self.expenses.append((amount, description))
        print(f"Expense added! {description}")
        print(f"Actual balance: {self.account_balance()}")


firstname = "Mario"
lastname = "Rossi"

incomes = [
    (1500, "Stipendio"),
    (200, "Freelance"),
    (50, "Regalo"),
]

expenses = [
    (600, "Affitto"),
    (120, "Spesa"),
    (40, "Abbonamento palestra"),
]

account = PersonAccount(firstname, lastname, incomes, expenses)


print(account.account_info())
print("Total income:", account.total_income())    # 1750
print("Total expense:", account.total_expense())  # 760
print("Balance:", account.account_balance())      # 990

# --- Aggiunta di un'entrata e di una spesa ---
account.add_income(300, "Rimborso")               # balance: 1290
account.add_expense(80, "Bolletta luce")          # balance: 1210

print(account.account_info())
print("Total income:", account.total_income())    # 2050
print("Total expense:", account.total_expense())  # 840


# This is why i used a list instead of a set: 
# if i used a set this income wouldn't be added, since the same amount and description were already in the set
account.add_income(300, "Rimborso")
print("Total income:", account.total_income()) 