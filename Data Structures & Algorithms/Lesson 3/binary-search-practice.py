"""You're going to write a binary search function.
You should use an iterative approach - meaning
using loops.
Your function should take two inputs:
a Python list to search through, and the value
you're searching for.
Assume the list only has distinct elements,
meaning there are no repeated values, and
elements are in a strictly increasing order.
Return the index of value, or -1 if the value
doesn't exist in the list."""

def binary_search(input_array, value):
    low_index = 0
    high_index = len(input_array) - 1
    while low_index <= high_index:
        middle_index = (low_index + high_index ) / 2
        if input_array[middle_index] == value:
            return middle_index
        elif input_array[middle_index] < value:
            low_index = middle_index + 1
        else:
            high_index = middle_index - 1
    return -1


test_list = [1,3,9,11,15,19,29]
test_val1 = 25
test_val2 = 15
print binary_search(test_list, test_val1) # should return -1
print binary_search(test_list, test_val2) # should return 4