# <exercise id="14" title="Estimating uncertainty for new data">
#   
#   You just compared the three models you trained, and the XGBoost model performed best
#   on the validation dataset. Gradient boosting models are very effective and are a powerful tool
#   in your machine learning arsenal. Before you take a trained model like this and use it to make 
#   predictions on new data, you must estimate how your final chosen model will perform. 
#   Specifically, let's estimate the 
#   [`rmse()`](https://tidymodels.github.io/yardstick/reference/rmse.html) for this model.
# 
# **Instructions**
# 
#  - Which dataset would you use to estimate how your model will perform on new data? 
#    You have `sisters_train`, `sisters_validate`, and `sisters_test` datasets available 
#    in your environment. Use the correct one *both* at the beginning of the pipe and 
#    within the call to `predict()`.
#  - Calculate the RMSE (root mean squared error) using the appropriate function from
#    [yardstick](https://tidymodels.github.io/yardstick/).
# 
# <codeblock id="04_14">
# 
# You want to use the `sisters_test` data along with the `rmse()` function.
# 
# </codeblock>
# 
# </exercise>



library(tidyverse)
library(caret)
library(yardstick)

sisters_train <- readRDS("data/c4_training_500.rds")
sisters_validate <- readRDS("data/c4_validation_full.rds")
sisters_test <- readRDS("data/c4_testing_full.rds")
sisters_xgb <- readRDS("data/sisters_xg.rds")

# Calculate RMSE
sisters_test %>%
    mutate(prediction = predict(sisters_xgb, sisters_test)) %>%
    rmse(truth = age, estimate = prediction)





# <exercise id="15" title="Wrapping up" type="slides">
#   
#   <slides source="chapter4_15">
#   </slides>
#   
#   </exercise>
#   