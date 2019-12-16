# <exercise id="11" title="Training, validation, and testing data">
#   
#   In this chapter, you will explore a few new kinds of models. Fun! 💃The `"gbm"` gradient boosting 
#   and `"xbgLinear"` extreme gradient boosting models take a very long time to train, so we'll
#   upload trained models for you to evaluate in the next exercises. In this exercise, train a CART model
#   with `"rpart"` to predict age with all the other columns.
# 
# To allow the code in this exercise to evaluate quickly, the training set in your environment 
# only contains 500 rows. (You'll see a warning because the training set here is so small.)
# 
# **Instructions**
#   
#   - Using caret, train a CART model to predict `age` based on all other variables on
#     `sisters_train` data. 
# 
# When you don't give any specific 
# [`trainControl()`](https://topepo.github.io/caret/model-training-and-tuning.html#basic-parameter-tuning) 
# argument to `train()`, the model training is implemented with a default resampling strategy,
# 25 bootstrap resamplings.
# 
# <codeblock id="04_11">
# 
# - To train a model use the `train()` function. 
# - The `method` argument to `train()` should be `"rpart"`.
# 
# </codeblock>



library(tidyverse)
sisters_train <- readRDS("data/c4_training_500.rds")

# Load caret
library(caret)

# Fit a CART model
sisters_cart <- train(age ~ ., method = r"part," data = sisters_train)

# Print the CART model
sisters_cart
