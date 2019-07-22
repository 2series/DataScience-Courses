names = ["Rick Sanchez", "Morty Smith", "Summer Smith", "Jerry Smith", "Beth Smith"]

first_names = [name.split(" ")[0].lower() for name in names]
print(first_names)

multiples_3 = [3 * num for num in range(1,21)]# write your list comprehension here
print(multiples_3)

scores = {
             "Rick Sanchez": 70,
             "Morty Smith": 35,
             "Summer Smith": 82,
             "Jerry Smith": 23,
             "Beth Smith": 98
          }

passed = [name for name,num in scores.items() if num >= 65]# write your list comprehension here
print(passed)

