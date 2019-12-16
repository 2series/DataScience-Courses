# <exercise id="8" title="Evaluating your models">
#   
#   The `fit_lm` and `fit_rf` models you just trained are in your environment. It's time to evaluate them!
#   🤩 For regression models, we will focus on evaluating using the **root mean squared error**. This quantity
#   is measured in the same units as the original data (log of miles per gallon, in our case). Lower values 
#   indicate a better fit to the data. It's not too hard to calculate root mean squared error manually, but 
#   the [yardstick](https://tidymodels.github.io/yardstick/) package offers convenient functions for 
#   this and other model performance metrics.
# 
# **Instructions**
#   
#   - Load the yardstick package. 
#   - Create new columns for model predictions from each of the models you have trained, first linear regression
#     and then random forest.
#   - Evaluate the performance of these models using 
#     [`metrics()`](https://tidymodels.github.io/yardstick/reference/metrics.html) by specifying the column 
#     in the original data that contains the real fuel efficiency.
# 
# <codeblock id="01_08">
#   
#   - Use `fit_lm` to predict the values for linear regression and `fit_rf` to predict values for random forest.
#   - The "truth" column in the original data is the column that holds fuel efficiency, `MPG`.
# 
# </codeblock>
#   
#   </exercise>



library(caret)
library(tidyverse)

car_train <- readRDS("data/c1_training_full.rds")
fit_lm <- readRDS("data/c1_fit_lm.rds")
fit_rf <- readRDS("data/c1_fit_rf.rds")

# Load yardstick
library(yardstick)

# Create the new columns
results <- car_train %>%
    mutate(MPG = log(MPG),
           `Linear regression` = predict(fit_lm, car_train),
           `Random forest` = predict(fit_rf, car_train))

# Evaluate the performance
metrics(results, truth = MPG, estimate = `Linear regression`)
metrics(results, truth = MPG, estimate = `Random forest`)
