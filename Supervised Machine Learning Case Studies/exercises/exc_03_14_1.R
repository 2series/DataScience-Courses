# <exercise id="14" title="Confusion matrix for your training data">
#   
#   Let's start by seeing how these two models perform on your training data by looking at some
#   confusion matrices. A confusion matrix tabulates how many examples in each class were correctly classified
#   by a model. In this case study, it will show you how many voters were classified as voters and how
#   many non-voters were classified as non-voters; the confusion matrix also shows you how many
#   were classified into the wrong categories. 
# 
# Here we want to see how your model performed on the **training** data, the data the model used
# when it was trained. The models available in your environment were trained on all the training data,
# not just a subset, with 10-fold cross-validation repeated 5 times.
# 
# **Instructions**
# 
# Print the confusion matrix for the logistic regression model on the training data.
# 
# <codeblock id="03_14_1">
# 
# - Use the `conf_mat()` function to build a confusion matrix. 
# - We aren't evaluating your models on the testing data yet, so use the `vote_train` data for
#   all the arguments here.
# 
# </codeblock>
  


library(tidyverse)
library(caret)
library(yardstick)

vote_train <- readRDS("data/c3_training_full.rds")
vote_test <- readRDS("data/c3_testing_full.rds")
vote_glm <- readRDS("data/vote_glm.rds")
vote_rf <- readRDS("data/vote_rf.rds")

# Confusion matrix for logistic regression model on training data
vote_train %>%
    mutate(`Logistic regression` = predict(vote_glm, vote_train)) %>%
    conf_mat(truth = turnout16_2016, estimate = "Logistic regression")

