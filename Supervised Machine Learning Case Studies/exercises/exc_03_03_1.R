# <exercise id="1" title="Predicting voter turnout from survey data" type="slides">
#   
#   <slides source="chapter3_01">
#     </slides>
#     
#     </exercise>
#     
#   <exercise id="2" title="Choosing an appropriate model">
#       
#       In this case study, you will predict whether a person voted or not in the
#       United States 2016 presidential election from responses that person gave on a survey. 
#       The survey focuses on opinions about political and economic topics. 
#       What kind of model will you build?
#       
#       <choice>
#       <opt text="Summarization">
#         
#         Summarization is not a type of supervised machine learning model we will cover in this course.
#       
#       </opt>
#         
#       <opt text="Clustering">
#           
#       Clustering is an example of unsupervised machine learning, which we will not cover in this 
#       course.
#         
#       </opt>
#           
#       <opt text="Classification" correct="true">
#             
#       Correct! To predict group membership or discrete class labels, use classification models.
#           
#       </opt>
#             
#       <opt text="Regression">
#               
#       A regression model predicts a numeric/continuous value or response, not a group membership 
#       or discrete class label.
#             
#       </opt>
#       </choice>
#               
#   </exercise>
#               
#   <exercise id="3" title="Exploring the VOTER data">
#                 
#   To do a good job with predictive modeling, you need to explore your dataset to understand it first. Start off this modeling analysis by checking out how many people voted or did not vote, and the answers to a few questions. The answers to the questions on this survey have been coded as integers, and the corresponding text has been provided for you here.
#               
#   **Instructions**
#                 
#       - Load [tidyverse](https://tidyverse.tidyverse.org/).
#       - Print `voters` to check out the data.
#       - In the call to `count()`, use the appropriate variable (`turnout16_2016`) to see how 
#         many examples you have of those who voted and did not vote.
#               
#     <codeblock id="03_03_1">
#                 
#     To see how many people did and did not vote, use `count(turnout16_2016)`.
#               
#     </codeblock>

# Load tidyverse
library(tidyverse)

voters <- read_csv("data/voters.csv")

# Print voters
glimpse(voters)

# How many people voted?
voters %>%
    count(turnout16_2016)

