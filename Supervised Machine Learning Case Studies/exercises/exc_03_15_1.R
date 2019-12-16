# <exercise id="15" title="Confusion matrix for your testing data">
#   
#   Now, let's evaluate how the models perform on the testing data. This is what you use to estimate
#   how your model will perform on new data.
# 
# **Instructions**
# 
# Print the confusion matrix for the logistic regression model on the training data.
# 
# - Generate a confusion matrix for the logistic regression model (`vote_glm`). 
# - Instead of the `vote_train` data, now use the `vote_test` data.
# 
# <codeblock id="03_15_1">
# 
# - Find the predictions using `predict(vote_glm, vote_test)`.
# - Choose the real voting status for the `truth` argument to `conf_mat()`, and the predicted voting
#   status for `estimate`. 
# 
# </codeblock>



library(tidyverse)
library(caret)
library(yardstick)

vote_train <- readRDS("data/c3_training_full.rds")
vote_test <- readRDS("data/c3_testing_full.rds")
vote_glm <- readRDS("data/vote_glm.rds")
vote_rf <- readRDS("data/vote_rf.rds")

# Confusion matrix for logistic regression model on testing data
vote_test %>%
    mutate(`Logistic regression` = predict(vote_glm, vote_test)) %>%
    conf_mat(truth = turnout16_2016, estimate = "Logistic regression")
