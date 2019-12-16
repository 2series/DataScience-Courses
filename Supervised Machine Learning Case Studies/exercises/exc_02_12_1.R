# <exercise id="12" title="Confusion matrix">
#   
#   A confusion matrix describes how well a classification model (like the ones you just trained!) performs.
#   A confusion matrix tabulates how many examples in each class were correctly classified by a model. In your case, 
#   it will show you how many remote developers were classified as remote and how many non-remote developers were
#   classified as non-remote; the confusion matrix also shows you how many were classified into the **wrong** categories.
# 
# Here you will use the [`conf_mat()`](https://tidymodels.github.io/yardstick/reference/conf_mat.html) function
# from yardstick to evaluate the performance of the two models you trained, `stack_glm` and `stack_rf`. 
# The models available in your environment were trained on all the training data, not only 1%.
# 
# **Instructions**
#   
#   Print the confusion matrix for the `stack_glm` model on the `stack_test` data. Note that the first argument
#   to `conf_mat()` is `truth` and the second is `estimate`.
# 
# <codeblock id="02_12_1">
#   
#   You are evaluating your models, so you should use the testing data set for all the possible arguments here.
# 
# </codeblock>



library(caret)
library(tidyverse)
library(yardstick)

stack_train <- readRDS("data/c2_training_full.rds")
stack_test <- readRDS("data/c2_testing_full.rds")
stack_glm <- readRDS("data/stack_glm.rds")
stack_rf <- readRDS("data/stack_rf.rds")

# Confusion matrix for logistic regression model
stack_test %>%
    mutate(`Logistic regression` = predict(stack_glm, stack_test)) %>%
    conf_mat(truth = Remote, estimate = "Logistic regression")


