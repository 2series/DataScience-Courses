# <exercise id="9" title="Upsampling for imbalanced data">
#   
#   It's time to start training your predictive models using caret's 
#   [train()]
#   (https://topepo.github.io/caret/model-training-and-tuning.html#model-training-and-parameter-tuning) 
#   function. This survey dataset is imbalanced, with many more examples of people who said 
#   they voted than people who did not. To build a model that performs better, you should deal with
#   this class imbalance. In this exercise, use upsampling, the same approach we used in the last 
#   case study.
#                                                                              
#  **Instructions**
#                                                                                
# - Build a logistic regression model with no resampling of data, but add the specification for
# - upsampling. If you can't remember, learn more about 
#   [`trainControl()`](https://topepo.github.io/caret/model-training-and-tuning.html#control).
# 
# <codeblock id="03_09">
# 
# To upsample the training set within the call to `train()`, use `sampling = "up"` inside
# `trainControl()`.
# 
# </codeblock>
# 
# </exercise>


library(tidyverse)
library(caret)

vote_train <- readRDS("data/c3_training_full.rds")

# Perform logistic regression with upsampling and no resampling
vote_glm <- train(turnout16_2016 ~ ., 
                  method = "glm", family = "binomial",
                  data = vote_train,
                  trControl = trainControl(method = "none",
                                           sampling = "up"))

