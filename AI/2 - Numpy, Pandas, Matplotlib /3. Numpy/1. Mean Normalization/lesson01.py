import numpy as np

# Using the Built-in functions you learned about in the
# previous lesson, create a 4 x 4 ndarray that only
# contains consecutive even numbers from 2 to 32 (inclusive)

X = np.arange(2,34,2).reshape((4,4))

import numpy as np

# Create a 5 x 5 ndarray with consecutive integers from 1 to 25 (inclusive).
# Afterwards use Boolean indexing to pick out only the odd numbers in the array

# Create a 5 x 5 ndarray with consecutive integers from 1 to 25 (inclusive).
X = np.arange(1,26)

# Use Boolean indexing to pick out only the odd numbers in the array
Y = X[X % 2 == 1]

import numpy as np

# Use Broadcasting to create a 4 x 4 ndarray that has its first
# column full of 1s, its second column full of 2s, its third
# column full of 3s, etc.. 


X = np.empty((4,4))
X.fill(1)
X = X * np.arange(1,5)
