points = 174  # use this as input for your submission

# establish the default prize value to None
prize = None


# use the points value to assign prizes to the correct prize names
if points <= 50:
    prize = "wooden rabbit"
elif points <= 150:
    pass
elif points <= 180:
    prize = "wafer-thin mint"
else:
    prize = "penguin"


# use the truth value of prize to assign result to the correct prize
if prize:
    result = "Congratulations! You won a {}!".format(prize)
else:
    result = "Oh dear, no prize this time."

print(result)