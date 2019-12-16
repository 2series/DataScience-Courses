# <exercise id="8" title="Understanding upsampling">
#   
#   Consider the original data set `stackoverflow`, the training set that you created `stack_train`, and 
#   the upsampled set you created `up_train`. Both `stackoverflow` and `stack_train` have almost 10 times as 
#   many non-remote developers as remote developers. 
# 
# How do the remote and non-remote developers in `up_train` compare?
#   
#   <choice>
#   <opt text="There are more remote developers.">
#   
#   Upsampling changes the proportion of remote and non-remote developers, but *not* so that there are more
#   non-remote developers.
# 
# </opt>
#   
#   <opt text="There are more non-remote developers.">
#   
#   Although there were more non-remote developers in the original dataset, upsampling changes this ratio 
#   so that the classes are balanced.
# 
# </opt>
#   
#   <opt text="There are the same number of remote and non-remote developers." correct="true">
#   
#   Correct! Upsampling samples with replacement until the class distributions are equal, so there are the
#   same number of remote and non-remote developers after upsampling.
# 
# </opt>
#   
#   </choice>
#   
#   </exercise>
#   
#   <exercise id="9" title="Upsampling in your workflow">
#   
#   We are starting to add more steps into the machine learning workflow. Think about when we implemented
#   upsampling to deal with class imbalance. Which dataset did we upsample?
#   
#   <choice>
#   <opt text="The original data.">
#   
#   We used upsampling only on a subset of the data, because its purpose is only applicable for part of the
#   predictive modeling workflow. Does upsampling help you do a better job of training your model or testing your model?
#   
#   </opt>
#   
#   <opt text="The training data." correct="true">
#   
#   Correct! ⭐️ Adjusting class imbalance helps you train a model that performs better.
# 
# </opt>
#   
#   <opt text="The testing data.">
#   
#   We do not want to artificially balance the test set; the test set needs to be close to what we will 
#   see when applying our model on new data.
# 
# <opt text="It doesn't matter! We'll upsample it all eventually anyway.">
#   
#   We do not upsample all subsets of our data, because we do not want to artificially balance the test set.
# 
# </opt>
#   
#   </choice>
#   
#   </exercise>
#   
#   <exercise id="10" title="Predicting remote status" type="slides">
#   
#   <slides source="chapter2_10">
#   </slides>
#   
#   </exercise>
#   
#   <exercise id="11" title="Training models">
#   
#   Finally! 😁 It's time to train predictive models for this data et of Stack Overflow Developer Survey responses. W
#   e will continue to use the powerful, flexible [
#   `train()`](https://topepo.github.io/caret/model-training-and-tuning.html#model-training-and-parameter-tuning) function f
#   rom caret to specify our machine learning models.
# 
# To keep the code in this exercise evaluating quickly, the data ets in your environment are 1% of their original size. 
# This means you may see some warnings due to the subsampling.)
# 
# **Instructions**
# 
# Build a logistic regression model using `method = "glm"` and `family = "binomial"` while implementing 
# upsampling to address class imbalance.
# 
# <codeblock id="02_11_1">
# 
# To upsample the training set within the call to `train()`, use `sampling = "up"` inside of `trainControl()`.
# 
# </codeblock>




library(tidyverse)
library(caret)

stack_train <- readRDS("data/c2_training_one_percent.rds")

# Build a logistic regression model
stack_glm <- train(Remote ~ ., method = "glm", family = "binomial",
                   data = stack_train,
                   trControl = trainControl(method = "boot",
                                            sampling = "up"))

# Print the model object
stack_glm
