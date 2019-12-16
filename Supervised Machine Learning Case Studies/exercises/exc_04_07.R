# <exercise id="7" title="Building a simple linear model">
#   
#   You have gotten to know this data a bit through exploratory data analysis, 
#   and now it's time to build the simplest possible model, in preparation for more 
#   complex predictive modeling. For this dataset where we want to predict age from 
#   the survey responses (coded as integers), we can build a simple linear model 
#   for all our data using only the 
#   [`lm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html) function.
# 
# **Instructions**
# 
#   - Remove the identifier column `sister` from the dataset to create `sisters_select`. 
#   - Use the correct variable on the left-hand side of the equation so that you build 
#     a model predicting age as a function of all other columns. 
#   - Call `summary()` for the simple model you've built to see the results.
# 
# <codeblock id="04_07">
#   
#   - We want to predict age using all other variables, so the first argument to `lm()` 
#     should be `age ~ .`.
#   - Remove the `sister` identifier from the dataset with `select(sisters67, -sister)`.
#   - You can examine the results of this simple modeling with `summary(simple_lm)`.
# 
# </codeblock>
  
  


library(tidyverse)
sisters67 <- read_csv("data/sisters.csv")

# Remove the sister column
sisters_select <- sisters67 %>% 
    select(-sister)

# Build a simple linear regression model
simple_lm <- lm(age ~ ., 
                data = sisters_select)

# Print the summary of the model
summary(simple_lm)
