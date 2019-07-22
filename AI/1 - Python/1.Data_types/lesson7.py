# Define a Dictionary, population,
# that provides information
# on the world's largest cities.
# The key is the name of a city
# (a string), and the associated
# value is its population in
# millions of people.

#   Key     |   Value
# Shanghai  |   17.8
# Istanbul  |   13.3
# Karachi   |   13.0
# Mumbai    |   12.5

population = { 'Shanghai' : 17.8, 'Istanbul' : 13.3, 'Karachi': 13.0, 'Mumbai':12.5}

# Test the code here if you'd like
a = [1, 2, 3]
b = a
c = [1, 2, 3]

animals = {'dogs': [20, 10, 15, 8, 32, 15], 
 'cats': [3,4,2,8,2,4], 
 'rabbits': [2, 3, 3], 
 'fish': [0.3, 0.5, 0.8, 0.3, 1]}

 elements = {'hydrogen': {'number': 1, 'weight': 1.00794, 'symbol': 'H'},
            'helium': {'number': 2, 'weight': 4.002602, 'symbol': 'He'}}

# todo: Add an 'is_noble_gas' entry to the hydrogen and helium dictionaries
# hint: helium is a noble gas, hydrogen isn't

for ele in elements:
    elements[ele]['is_noble_gas'] = (ele == 'helium') * 1
    
print(elements)