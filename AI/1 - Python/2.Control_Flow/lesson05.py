sentence = ["the", "quick", "brown", "fox", "jumped", "over", "the", "lazy", "dog"]

# Write a for loop to print out each word in the sentence list, one word per line
for word in sentence:
    print(word)

 # Write a for loop using range() to print out multiples of 5 up to 30 inclusive
for x in range(5,31,5):
    print(x)

names = ["Joey Tribbiani", "Monica Geller", "Chandler Bing", "Phoebe Buffay"]
usernames = [n.replace(" ","_").lower() for n in names]
print(usernames)

# write your for loop here

usernames = ["Joey Tribbiani", "Monica Geller", "Chandler Bing", "Phoebe Buffay"]

# write your for loop here
for username in range(0,len(usernames)):
    usernames[username] = usernames[username].replace(' ','_').lower()

print(usernames)

tokens = ['<greeting>', 'Hello World!', '</greeting>']
count = 0

# write your for loop here
for n in tokens:
    if (n[0] == '<'):
        count += 1

print(count)

items = ['first string', 'second string']
html_str = "<ul>\n"  # "\ n" is the character that marks the end of the line, it does
                     # the characters that are after it in html_str are on the next line

# write your code here
for i in items:
    html_str = html_str + "<li>" + i + "</li>\n"
    
html_str = html_str + "</ul>"


print(html_str)