# number to find the factorial of
number = 6   

# start with our product equal to number
product = number

# write your while loop here
while (number > 1):
    number = number - 1
    product = product * number
    
    print(number, product)

    # decrement number with each iteration until it reaches 1

    # multiply the product so far by the current number


# print the factorial of number
print(product)

# number to find the factorial of
number = 6   

# start with our product equal to number
product = number

# write your for loop here
for number in range(1,number):
    product = product * number



# print the factorial of number
print(product)

start_num = 1 #provide some start number
end_num = 5  #provide some end number that you stop when you hit
count_by = 1 #provide some number to count by 

# write a while loop that uses break_num as the ongoing number to 
#   check against end_num
break_num = start_num

while( break_num < end_num ):
    break_num += count_by

print(break_num)

start_num = 1 #provide some start number
end_num = 5  #provide some end number that you stop when you hit
count_by = 1 #provide some number to count by 

# write a while loop that uses break_num as the ongoing number to 
#   check against end_num
break_num = start_num

if (start_num > end_num):
    result = "Oops! Looks like your start value is greater than the end value. Please try again."
else:
    while( break_num < end_num ):
        break_num += count_by
    result = break_num

print(break_num)

limit = 40

# write your while loop here
i = 1
while(i * i < 40):
    i += 1
nearest_square = (i - 1) ** 2

print(nearest_square)

