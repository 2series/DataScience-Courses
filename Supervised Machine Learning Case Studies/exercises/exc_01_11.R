# <exercise id="11" title="Bootstrap resampling">
#   
#   In the last set of exercises, you trained linear regression and random forest models without
#   any resampling. Resampling can improve the accuracy of machine learning models, and reduce overfitting.
# 
# Let's try bootstrap resampling, which means creating datasets the same size as the original one by
# randomly drawing with replacement from the original. In caret, the default behavior for bootstrapping
# is 25 resamplings, but you can change this using 
# [`trainControl()`](https://topepo.github.io/caret/model-training-and-tuning.html#tune) if desired.
# 
# **Instructions**
# 
# The datasets available in your environment are 10% of their original size, to allow the code
# in this exercise to evaluate quickly. (This means you may see some warnings, such as about 
# rank-deficient fits.)
# 
# - Which dataset should you train these models with, `car_train` or `car_test`?
# - Train these models using bootstrap resampling. The method for this is `"boot"`.
# 
# <codeblock id="01_11">
# 
# You should still use the training data, `car_train`, for training these models.
# 
# </codeblock>
# 
# </exercise>



library(caret)
library(tidyverse)

car_train <- readRDS("data/c1_training_one_percent.rds")

# Fit the models with bootstrap resampling
cars_lm_bt <- train(log(MPG) ~ ., 
                    method = "lm", 
                    data = car_train,
                    trControl = trainControl(method = "boot"))

cars_rf_bt <- train(log(MPG) ~ ., 
                    method = "rf", 
                    data = car_train,
                    trControl = trainControl(method = "boot"))
                   
# Quick look at the models
cars_lm_bt
cars_rf_bt
