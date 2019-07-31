"""Implement a function recursivly to get the desired
Fibonacci sequence value.
Your code should have the same input/output as the
iterative code in the instructions."""

def get_fib(position):
    if position == 0 or position == 1:
        return 1
    return get_fib(position -1) + get_fib(position -2)

# Test cases
print get_fib(9)   # should return 34
print get_fib(11)
print get_fib(0)



# You may have noticed that this solution will compute the values of some inputs more than once.
# For example get_fib(4) calls get_fib(3) and get_fib(2), get_fib(3) calls get_fib(2) and get_fib(1) etc.
# The number of recursive calls grows exponentially with n.

# In practice if we were to use recursion to solve this problem we should use a hash table to store and fetch previously calculated results.
# This will increase the space needed but will drastically improve the runtime efficiency.