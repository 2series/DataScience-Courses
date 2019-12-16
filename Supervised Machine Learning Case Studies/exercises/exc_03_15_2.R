# **Instructions**
#   
#   - Generate a confusion matrix for the random forest model (`vote_rf`). 
# - Instead of the `vote_train` data, now use the `vote_test` data.
# 
# <codeblock id="03_15_2">
#   
#   - Use `mutate()` to make the new column with predicted values.
# - Remember that `conf_mat()` is the function to find a confusion matrix.
# 
# </codeblock>
#   
#   </exercise>
  


library(tidyverse)
library(caret)
library(yardstick)

vote_train <- readRDS("data/c3_training_full.rds")
vote_test <- readRDS("data/c3_testing_full.rds")
vote_glm <- readRDS("data/vote_glm.rds")
vote_rf <- readRDS("data/vote_rf.rds")

# Confusion matrix for random forest model on testing data
vote_test %>%
    mutate(`Random forest` = predict(vote_rf, vote_test)) %>%
    conf_mat(truth = turnout16_2016, estimate = "Random forest")


# <exercise id="16" title="Which model is best?">
#   
#   You have just spent a whole chapter of this course exploring how to predict voter turnout based 
#   on survey responses. Of the two types of models you tried, which is the better choice? Which do you 
#   expect to perform better on new data?
#   
#   Which model performed better on the **testing** data?
#   
#   <choice>
#   <opt text="Random forest">
#   
#   Random forest models are very powerful and the random forest model had higher accuracy than the 
#   logistic regression model on the training data, but on the testing data, the random forest model 
#   could not identify any of the people who voted.
# 
# </opt>
#   
#   <opt text="Logistic regression" correct="true">
#   
#   Correct! Logistic regression is a simpler model, but in this case, it performed better on 
#   the testing data and you can expect it to do a better job predicting on new data.
# 
# </opt>
#   </choice>
#   
#   </exercise>
#   
