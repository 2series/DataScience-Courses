mon_sales = "121"
tues_sales = "105"
wed_sales = "110"
thurs_sales = "98"
fri_sales = "95"

#TODO: Print a string with this format: This week's total sales: xxx
# You will probably need to write some lines of code before the print statement.
print("This week's total sales: %s" % (sum([int(x) for x in [mon_sales,tues_sales,wed_sales,thurs_sales,fri_sales]])))