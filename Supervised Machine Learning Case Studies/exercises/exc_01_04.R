# <exercise id="4" title="Building a simple linear model">
#   
#   Before embarking on more complex machine learning models, it's a good idea to 
#   build the simplest possible model to get an idea of what is going on. 
#   In this case, that means fitting a simple linear model using base R's `lm()` function.
# 
# **Instructions**
#   
#   - Use [`select()`](https://dplyr.tidyverse.org/reference/select.html) to deselect 
#     the two columns `Model` and `Model Index` from the model; these columns tell us the 
#     individual identifiers for each car and it would *not* make sense to include them in 
#     modeling. 
#   - Fit `MPG` as the predicted quantity, explained by all the predictors, 
#     i.e., `.` in the R formula input to `lm()`. (You may have noticed the log distribution
#     of MPG in the last exercise, but don't worry about fitting the logarithm of fuel 
#     efficiency yet.) 
#   - Print the summary of the model.


library(tidyverse)
cars2018 <- read_csv("data/cars2018.csv")

# Deselect the 2 columns to create cars_vars
car_vars <- cars2018 %>%
    select(-Model, -`Model Index`)

# Fit a linear model
fit_all <- lm(MPG ~ ., data = car_vars)

# Print the summary of the model
summary(fit_all)


