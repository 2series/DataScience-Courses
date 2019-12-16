# <exercise id="7" title="Upsampling">
#   
#   There are multiple possible approaches to dealing with class imbalance. ⚖️ Here, you will implement
#   upsampling using caret's 
#   [`upSample()`](https://topepo.github.io/caret/subsampling-for-class-imbalances.html#subsampling-techniques) function.
# 
# **Instructions**
# 
#     - Use the `stack_train` dataset for upsampling: 
#     - `x` should use `select()` to grab only the predictors from the data.
#     - `y` should be the class memberships in `stack_train` as a vector (use `$` notation).
#     - The label for the class column goes in `yname`; remember that it is `"Remote"`.
# 	
# <codeblock id="02_07">
# 
# - The class memberships that must be assigned to `y` are `train$Remote`.
# - This function needs to also know the label for the class column, as `yname = "Remote"`.
# 
# </codeblock>
# 
# </exercise>



library(tidyverse)
library(caret)

stack_train <- readRDS("data/c2_training_full.rds")
stack_test <- readRDS("data/c2_testing_full.rds")

# Create the upsampled training set
up_train <- upSample(x = select(stack_train, -Remote),
                     y = stack_train$Remote,
                     yname = "Remote") %>%
    as_tibble()

# Count the number of each type of Remote employee
up_train %>%
    count(Remote)

