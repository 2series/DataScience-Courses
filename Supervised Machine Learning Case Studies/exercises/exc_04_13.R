# <exercise id="13" title="Choosing between models">
#   
#   Now that you have created a dataframe that contains all three models' predictions, 
#   let's compare their performance.
# 
# **Instructions**
#   
#   - Load `yardstick`. 
#   - Use the [`metrics()`](https://tidymodels.github.io/yardstick/reference/metrics.html)
#     function from the yardstick package to see how each model performed. There are two important 
#     arguments that you need to supply to `metrics()`, `truth` (the true age of each nun) and
#     `estimate` (the predicted age of each nun). Which column in the dataframe you created
#     corresponds to each?
#   
#   <codeblock id="04_13">
#     
#     The `truth` argument should always be `age`, while the `estimate` column changes with each model.
#   
#   </codeblock>
#     
#   </exercise>
    


library(tidyverse)
library(caret)

modeling_results <- readRDS("data/c4_modeling_results.rds")

# Load yardstick
library(yardstick)

# Compare performance for...

# ...CART model
metrics(modeling_results, truth = age, estimate = CART)
# ...gbm model
metrics(modeling_results, truth = age, estimate = GBM)
# ...xgboost model
metrics(modeling_results, truth = age, estimate = XGB)
