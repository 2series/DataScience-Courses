"""Implement quick sort in Python.
Input a list.
Output a sorted list."""
def quicksort(array, start = 0, end = None):
    print('sorting the array', array, ' with start', start, ' and end', end)
    if end is None:
        end = len(array) - 1
    if end - start < 1:
        return
    else:
        current_index = start
        pivot_index = end
        while current_index != pivot_index:
            if array[current_index] > array[pivot_index]:
                array[pivot_index], array[current_index], array[pivot_index - 1] = (
                    array[current_index], array[pivot_index - 1], array[pivot_index])
                pivot_index -= 1
            else:
                current_index += 1
        quicksort(array, start, pivot_index - 1)
        quicksort(array, pivot_index + 1, end)
        return array

test = [21, 4, 1, 3, 9, 20, 25, 6, 21, 14]
print('Array to be quicksorted', test)
print quicksort(test)