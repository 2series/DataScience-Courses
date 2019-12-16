# <exercise id="1" title="Essential copying and pasting from Stack Overflow" type="slides">
#   
# <slides source="chapter2_01">
#     </slides>
#     
#     </exercise>
#     
#     <exercise id="2" title="Choosing an appropriate model">
#       
# In this case study, you will predict whether a developer works remotely or not (i.e., in their company offices)
# from characteristics of these developers, like experience and size of the company. In this analysis, we will assume 
# that a software developer can either work remotely, or not. What kind of model will you build?
#       
#     <choice>
#     <opt text="Summarization">
#         
# Summarization is not a type of supervised machine learning model we will cover in this course.
#       
#     </opt>
#         
#     <opt text="Clustering">
#           
# Clustering is an example of unsupervised machine learning, which we will not cover in this course.
#         
#     </opt>
#           
#     <opt text="Classification" correct="true">
#             
# Correct! To predict group membership or discrete class labels, use classification models.
#           
#     </opt>
#             
#     <opt text="Regression">
#               
# A regression model predicts a numeric/continuous value or response, not a group membership or discrete class label.
#             
#     </opt>
#     </choice>
#               
#     </exercise>
#               
#     <exercise id="3" title="Exploring the Stack Overflow survey">
#                 
# Anytime you are planning to implement modeling, it is always a good idea to explore your dataset. 
# Start off this modeling analysis by checking out how many remote and non-remote developers have to work with, 
# where they live, and how much experience they have.
#               
# **Instructions**
#                 
#   - Print the `stackoverflow` object.
#   - In the calls to [`count()`](https://dplyr.tidyverse.org/reference/tally.html), check out the 
#     distributions for remote status first, and then country.
#               
# <codeblock id="02_03_1">
#                 
# To see how many developers work remotely and do *not* work remotely, use `count(Remote, sort = TRUE)`.
#               
#      </codeblock>


library(tidyverse)
stackoverflow <- read_csv("data/stackoverflow.csv")

# Print stackoverflow
glimpse(stackoverflow)

# First count for Remote
stackoverflow %>% 
    count(Remote, sort = TRUE)

# then count for Country
stackoverflow %>% 
    count(Country, sort = TRUE)
