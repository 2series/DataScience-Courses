# </exercise>
#   
#   <exercise id="8" title="Training, validation, and testing data">
#     
#     It's time to split your data into different sets now. You've done this
#     three times already in this course, but in this last case study we are also 
#     going to create a validation set. Using a validation set is important anytime
#     you will compare multiple models and choose between them, or adjust hyperparameters 
#     in a model. 
#   
#   We are going to split the data into 60% training, 20% validation, 20% testing.
#   
#   **Instructions**
#     
#   - Create two data partitions: 
#   - Specify one to split between training (60%) and validation/testing (40%).
#   - Specify another one to split between validation and testing (50% each).
#   
#   <codeblock id="04_08">
#     
#     The [`initial_split()`](https://tidymodels.github.io/rsample/reference/initial_split.html)
#     function creates a vector that specifies which examples belong in the training set, 
#     or the test set.
#   
#   </codeblock>
#     
#     </exercise>


library(tidyverse)
library(rsample)
sisters_select <- read_csv("data/sisters.csv") %>%
    select(-sister)

# Split the data into training and validation/test sets
train_split <- sisters_select %>%
    initial_split(prop = 0.6,
                  strata = "age")

sisters_train <- training(train_split)
validate_test <- testing(train_split)

# Split the validation and test sets
set.seed(1234)
validation_split <- validate_test %>%
    initial_split(prop = 0.5,
                  strata = "age")

sisters_validate <- training(validation_split)
sisters_test <- testing(validation_split)
