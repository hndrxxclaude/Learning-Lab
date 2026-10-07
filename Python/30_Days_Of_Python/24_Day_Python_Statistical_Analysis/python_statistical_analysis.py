import numpy as np

print('NumPy:', np.__version__)

# print(dir(np)) printing all the available methods

python_list = [1, 2, 3, 4, 5]

print(type(python_list))
print(python_list)

two_dimensional_list = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print(two_dimensional_list)

# Creating NumPy (Numerical Python) array from python_list
numpy_array = np.array(python_list)
print(type(numpy_array))
print(numpy_array)

# Creating float array from python list
numpy_float_array = np.array(numpy_array, dtype=float)
print(numpy_float_array)

# Creating boolean array from python list
numpy_bool_array = np.array([0, 1, -1, 0, 0], dtype=bool)
print(numpy_bool_array)

# Creating two dimensional array from two dimensional list
numpy_two_dimensional_array = np.array(two_dimensional_list)
print(type(numpy_two_dimensional_array))
print(numpy_two_dimensional_array)

# Converting NumPy arrays into Python lists
np_to_list = numpy_array.tolist()
print(type(np_to_list))
print("One dimensional list:", np_to_list)
print("Two dimensional list:", numpy_two_dimensional_array.tolist())

# Creating a NumPy array from a Python tuple
tpl = (1, 2, 3, 4, 5)
print(type(tpl))
print("Python tuple:", tpl)
np_array_from_tuple = np.array(tpl)
print(type(np_array_from_tuple))
print("NumPy array from tuple:", np_array_from_tuple)

# Obtaining the shape of a NumPy array as a tuple
print(numpy_array.shape) # (5,) because it is one dimensional

print("Shape of a two dimensional array:", numpy_two_dimensional_array.shape)

three_by_four_array = np.array([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]])
print("Shape of a 3 by 4 array:", three_by_four_array.shape)

# Obtaining the data type of a NumPy array
int_list = [1, 3, 5, 7, 9]
int_array = np.array(int_list)
float_array = np.array(int_list, dtype = float)
print(type(int_list))
print(int_list)
print("Data type of int_array:", int_array.dtype)
print(int_array)
print("Data ype of float_array:", float_array.dtype)
print(float_array)

# Obtaining the size of a NumPy array
print("Size of numpy_array", numpy_array.size)
print("Size of two dimensional array:", numpy_two_dimensional_array.size)

# Mathematical operations on a NumPy array
lst = [10, 11, 12, 13, 14]
new_np_arr = np.array(lst)
print(new_np_arr + 10)
print(new_np_arr - 10)
print(new_np_arr * 10)
print(new_np_arr / 10)
print(new_np_arr % 2)
print(new_np_arr // 3)
print(new_np_arr ** 2)

# Getting items from a NumPy array
two_dim_np_arr = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
first_row = two_dim_np_arr[0]
second_row = two_dim_np_arr[1]
third_row = two_dim_np_arr[2]

print("First row:", first_row)
print("Second row:", second_row)
print("Third row:", third_row)

first_column = two_dim_np_arr[:, 0]
second_column = two_dim_np_arr[:, 1]
third_column = two_dim_np_arr[:, 2]

print("First column:", first_column)
print("Second column:", second_column)
print("Third column:", third_column)

print(two_dim_np_arr)

# Slicing NumPy arrays
print("First two rows and columns:", two_dim_np_arr[0:2, 0:2])

# Reversing rows and columns
print(two_dim_np_arr[::-1, ::-1])

# Various functions
print(np.zeros((2,2), dtype = int, order="C"))
print(np.ones((3,3), dtype=int, order="F"))

print(np.array([[1, 2, 3], [4, 5, 6]]).reshape(3,2)) # from 2 by 3 to a 3 by 2

print(np.array([[1, 2, 3], [4, 5, 6]]).reshape(3,2).flatten()) # flattened array

# Horizontal and Vertical Append
np_arr_one = np.array([1, 2, 3])
np_arr_two = np.array([4, 5, 6])

print(np_arr_one + np_arr_two)
print("Horizontal Append:", np.hstack((np_arr_one, np_arr_two)))
print("Vertical Append:", np.vstack((np_arr_one, np_arr_two)))

# Generating random numbers
random_float = np.random.random()
print(random_float)

random_float_arr = np.random.random(7)
print(random_float_arr)

print(np.random.randint(0, 11)) # generating a random integer between 0 and 10

print(np.random.randint(1, 16, size = 5)) # generating an array of random integers between 1 and 15

print(np.random.randint(1, 16, size = (2, 2))) # generating an array of random integers between 1 and 15

normal_array = np.random.normal(50, 12, 40)
print(normal_array)

# NumPy and Statistics
import matplotlib.pyplot as plt
import seaborn as sns
sns.set()
print(plt.hist(normal_array, color = "grey", bins = 10))

# Matrix in NumPy
matrix = np.matrix(np.ones((3, 3), dtype=float))
print(matrix)

np.asarray(matrix)[2] = 4
print(matrix)

# numpy.arange()
numbers = np.arange(0, 21)
print(numbers)

even_numbers = np.arange(2, 21, 2)
print(even_numbers)

# numpy.linspace() and numpy.logspace()

