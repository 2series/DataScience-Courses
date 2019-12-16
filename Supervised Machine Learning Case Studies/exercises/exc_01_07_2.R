# <exercise id="7" title="Training models with caret">
#   
#   Now that your `car_train` data is ready, you can fit a set of models with caret. 
#   The [`train()`](https://topepo.github.io/caret/model-training-and-tuning.html#model-training-and-parameter-tuning)
#   function from caret is flexible and powerful. It allows you to try out many different kinds of models and 
#   fitting procedures. To start off, train one linear regression model and one random forest model, without 
#   any resampling. (This is what `trainControl(method = "none")` does; it turns off all resampling.)
#                                                                                                    
# **Instructions**
#                                                                                                      
#   - Load the caret package. 
#   - Train a basic linear regression model on your `car_train` data. 
#                                                                                                    
# (Notice that we are fitting to `log(MPG)` since the fuel efficiency (mpg) had a log normal distribution.)
#                                                                                                    
# <codeblock id="01_07_1">
#                                                                                                      
# For linear regression, use `method = "lm"`.
#                                                                                                    
# </codeblock>
#                                                                                                      
# **Instructions**
#                                                                                                      
#   - Train a random forest model on your `car_train` data.
___________________________________________________________

# <codeblock id="01_07_2">
#   
#   For random forest, use `method = "rf"`.
# 
# </codeblock>
#   
#   </exercise>
  



library(tidyverse)
library(caret)
library(randomForest)

car_train <- readRDS("data/c1_training_full.rds")
car_test <- readRDS("data/c1_testing_full.rds")

# Train a random forest model
fit_rf <- train(log(MPG) ~ ., 
                method = "rf", 
                data = car_train,
                trControl = trainControl(method = "none"))

# Print the model object
fit_rf
