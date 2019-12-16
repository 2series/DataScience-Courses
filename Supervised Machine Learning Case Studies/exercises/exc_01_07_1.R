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
                                                                                                   

library(tidyverse)

car_train <- readRDS("data/c1_training_full.rds")
car_test <- readRDS("data/c1_testing_full.rds")

# Load caret
library(caret)

# Train a linear regression model
fit_lm <- train(log(MPG) ~ ., 
                method = "lm", 
                data = car_train,
                trControl = trainControl(method = "none"))

# Print the model object
fit_lm

