# <exercise id="10" title="Cross-validation" type="slides">
#   
#   <slides source="chapter3_10">
#     </slides>
#     
#     </exercise>
#     
#     <exercise id="11" title="Understanding cross-validation">
#       
#       When you implement 10-fold cross-validation repeated 5 times, you...
#     
#     <choice>
#       <opt text="randomly divide your training data into 50 subsets and train on 49 at a time
#                 (validating on the other subset), iterating through all 50 subsets for validation.">
#         
#         If you divide your data into 50 subsets, that would be called 50-fold cross-validation. 
#         For most practical situations, 50 folds is overkill.
#       
#     </opt>
#         
#     <opt text="randomly divide your training data into 10 subsets and train on 9 at a time
#               (validating on the other subset), iterating through all 10 subsets for validation. 
#                Then you repeat that process 5 times." correct="true">
#           
#   Correct! ⚡️ Simulations and practical experience show that 10-fold cross-validation 
#   repeated 5 times is a great resampling approach for many situations. 
#   This approach involves randomly dividing your training data into 10 folds, or subsets or groups, 
#   and training on only 9 while using the other fold for validation. 
#   You iterate through all 10 folds being used for validation; this is one round of cross-validation. 
#   You can then repeat the whole process multiple, perhaps 5, times.
#         
#   </opt>
#           
#   <opt text="randomly divide your training data into 5 subsets and train on 4 at a time 
#             (validating on the other subset), iterating through all 5 subsets. Then you repeat 
#              that process 10 times.">
#             
#   If you divide your data into 5 subsets, that would be called 5-fold cross-validation. 
#   In many practical situations, 5 folds is not enough to get the maximum performance improvement
#   possible.
#           
#     </opt>
#       </choice>
#             
#   </exercise>
#             
#   <exercise id="12" title="Training models with cross-validation">
#               
#   You can build models both with the upsampling you implemented before, *and* the cross-validation
#   we just discussed. Here, try 10-fold cross-validation repeated 2 times.
#             
#   To allow the code in this exercise to evaluate in a short time, the training set in your
#   environment is 2% of the real training set. Expect to see some warnings because of this.
#             
# **Instructions**
#               
#   - Use `method = "repeatedcv"` to implement 10-fold cross-validation 
#     (10 folds or subsets is the default, but this can be changed) for the logistic regression model.
#   - Specify `repeats = 2` to repeat the 10-fold cross-validation 2 times.
#             
# <codeblock id="03_12_1">
#               
#     Your call to `trainControl()` should look like 
#     `trainControl(method = "repeatedcv", repeats = 2, sampling = "up")`.
#             
# </codeblock>


library(tidyverse)
library(caret)

vote_train <- readRDS("data/c3_training_two_percent.rds")

# Logistic regression
vote_glm <- train(turnout16_2016 ~ ., 
                  method = "glm", family = "binomial",
                  data = vote_train,
                  trControl = trainControl(method = "repeatedcv",
                                           repeats = 2,
                                           sampling = "up"))

# Print vote_glm
vote_glm
