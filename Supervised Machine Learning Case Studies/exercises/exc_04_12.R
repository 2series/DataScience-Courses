# </exercise>
#   
#   <exercise id="12" title="Making predictions">
#     
#     Three models are available in your environment (trained on the data set in its entirety),
#     the CART model you just trained along with two kinds of gradient boosting models.
#     Your next task is to decide which of these models to use for prediction on new data. 
#     If you use the training data to evaluate the models, you will underestimate your error 
#     for new data and might make the wrong choice altogether. That leaves the validation data 
#     and the testing data.
#   
#   **Instructions**
#     
#     - Which dataset should you use to choose between these three models, `sisters_validate` or
#       `sisters_test`? Use that option to create a dataframe for comparing the models.
#   
#   <codeblock id="04_12">
#     
#     The validation dataset is the appropriate option for choosing between models.
#   
#   </codeblock>
#     
#  </exercise>
    

library(tidyverse)
library(caret)

sisters_validate <- readRDS("data/c4_validation_full.rds")
sisters_test <- readRDS("data/c4_testing_full.rds")
sisters_cart <- readRDS("data/sisters_cart.rds")
sisters_gbm <- readRDS("data/sisters_gbm.rds")
sisters_xgb <- readRDS("data/sisters_xg.rds")

# Make predictions on the three models
modeling_results <- sisters_validate %>%
    mutate(CART = predict(sisters_cart, sisters_validate),
           GBM = predict(sisters_gbm, sisters_validate),
           XGB = predict(sisters_xgb, sisters_validate))

# View the predictions
modeling_results %>% 
    select(CART, GBM, XGB)
