# </exercise>
#   
#   <exercise id="13" title="Classification model metrics">
#     
#     The `conf_mat()` function is helpful but often you also want to store specific performance estimates
#     for later, perhaps in a dataframe-friendly form. The yardstick package is built to handle such needs.
#     For this kind of classification model, you might look at the
#     [positive or negative predictive value](https://tidymodels.github.io/yardstick/reference/ppv.html) or
#     perhaps overall [accuracy](https://tidymodels.github.io/yardstick/reference/accuracy.html).
#   
#   The models available in your environment, `stack_glm` and `stack_rf` were trained on all the training data, 
#   not only 1%.
#   
#   **Instructions**
#     
#   - Load the yardstick package. 
#   - Predict values for logistic regression (`stack_glm`) and random forest (`stack_rf`).  
#   - Calculate both accuracy and positive predictive value for these two models.
#   
#   <codeblock id="02_13">
#     
#     The function for accuracy is `accuracy()` and the function for positive predictive value is `ppv()`.
#   
#   </codeblock>
#     
#     </exercise>



library(tidyverse)
library(caret)

stack_test <- readRDS("data/c2_testing_full.rds")
stack_glm <- readRDS("data/stack_glm.rds")
stack_rf <- readRDS("data/stack_rf.rds")

# Load yardstick
library(yardstick)

# Predict values
testing_results <- stack_test %>%
    mutate(`Logistic regression` = predict(stack_glm, stack_test),
           `Random forest` = predict(stack_rf, stack_test))

## Calculate accuracy
accuracy(testing_results, truth = Remote, estimate = `Logistic regression`)
accuracy(testing_results, truth = Remote, estimate = `Random forest`)

## Calculate positive predict value
ppv(testing_results, truth = Remote, estimate = `Logistic regression`)
ppv(testing_results, truth = Remote, estimate = `Random forest`)

