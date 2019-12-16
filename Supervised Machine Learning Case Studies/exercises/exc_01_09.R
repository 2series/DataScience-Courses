# <exercise id="9" title="Using the testing data">
#   
#   "But wait!" you say, because you have been paying attention. 🤔 "That is how these models perform on
#    the *training* data, the data that we used to build these models in the first place." Let's evaluate 
#    how these simple models perform on the testing data.
# 
# **Instructions**
# 
# What do you need to change to evaluate how the models perform on the testing data, instead of 
# the training data?
# 
# <codeblock id="01_09">
# 
# Where you had `car_train` before, switch out to `car_test`.
# 
# </codeblock>
# 
# </exercise>



library(caret)
library(tidyverse)
library(yardstick)

car_test <- readRDS("data/c1_testing_full.rds")
fit_lm <- readRDS("data/c1_fit_lm.rds")
fit_rf <- readRDS("data/c1_fit_rf.rds")

# Create the new columns
results <- car_test %>%
    mutate(MPG = log(MPG),
           `Linear regression` = predict(fit_lm, car_test),
           `Random forest` = predict(fit_rf, car_test))

# Evaluate the performance
metrics(results, truth = MPG, estimate = `Linear regression`)
metrics(results, truth = MPG, estimate = `Random forest`)

