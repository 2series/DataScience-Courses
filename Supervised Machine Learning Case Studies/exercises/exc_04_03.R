# <exercise id="1" title="Surveying Catholic sisters in 1967" type="slides">
#   
#   <slides source="chapter4_01">
#     </slides>
#     
#     </exercise>
#     
#     <exercise id="2" title="Choosing an appropriate model">
#       
#     In this case study, you will predict the age of Catholic nuns from their answers on a survey
#     fielded in 1967 focusing on questions about social and religious issues. 
#     What kind of model will you build?
#       
#     <choice>
#     <opt text="Summarization">
#         
#     Summarization is not a type of supervised machine learning model we will cover in this course.
#       
#     </opt>
#         
#     <opt text="Clustering">
#           
#     Clustering is an example of unsupervised machine learning, which we will not cover in this course.
#         
#     </opt>
#           
#     <opt text="Classification">
#             
#     A classification model predicts a group membership or discrete class label, not a 
#     numeric/continuous value or response.
#           
#     </opt>
#             
#     <opt text="Regression" correct="true">
#               
#     Correct! To predict a continuous, numeric quantity like age, use regression models.
#             
#     </opt>
#     </choice>
#               
#  </exercise>

# <exercise id="3" title="Visualizing the age distribution">
#   
#   The first step before you start modeling is to explore your data, and we are going to
#   spend a little more time on this step in this last case study. To start with, check out 
#   the distribution of ages for the respondents in this survey. 📊 (Keep in mind throughout 
#   this case study that the data you have in your environment is one quarter of the real survey data.)
# 
# **Instructions**
#   
#   - Call `glimpse()` on `sisters67` to take a look at the structure of the data. 
#     Notice how many columns there are, and what their characteristics are.
#   - Plot a histogram of `age`.
# 
# <codeblock id="04_03">
#   
#   You can build a histogram using 
#   [`geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html).
# 
# </codeblock>
  

library(tidyverse)
sisters67 <- read_csv("data/sisters.csv")

# View sisters67
glimpse(sisters67)

# Plot the histogram
ggplot(sisters67, aes(x = age)) +
    geom_histogram(binwidth = 10)
