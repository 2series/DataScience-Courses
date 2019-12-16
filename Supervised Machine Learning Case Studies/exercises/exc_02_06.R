# </exercise>
#   
#   <exercise id="5" title="Dealing with imbalanced data" type="slides">
#     
#     <slides source="chapter2_05">
#       </slides>
#       
#       </exercise>
#       
#       <exercise id="6" title="Training and testing data">
#         
#         Before you deal with the imbalance in the remote/not remote classes, first split your data 
#         into training and testing sets. You create subsets of your data for *training* and *testing* your
#         model for the same reasons you did before: to reduce overfitting and obtain a more accurate estimate 
#         for how your model will perform on new data.
#       
# **Instructions**
#         
#     Create a data split that divides the original data into 80%/20% sections and about evenly divides 
#     the sections between the different classes of `Remote`.
#       
#       - Load the `rsample` package.
#       - Create `stack_split`:
#       - For the first argument to [`initial_split()`](https://tidymodels.github.io/rsample/reference/initial_split.html), 
#         use a value for `p` of 0.8.
#       - For the second argument to `initial_split()`, pass the name of the variable that contains remote status as
#         a string.
#       - Assign the 80% partition to `stack_train` and the 20% partition to `stack_test`.
#       
#   <codeblock id="02_06">
#         
#     Use the output of `initial_split()` as the input of `training()` and `testing()`.
#       
#   </codeblock>



library(tidyverse)
stackoverflow <- read_csv("data/stackoverflow.csv") %>%
    mutate(Remote = factor(Remote, levels = c("Remote", "Not remote")))

# Load rsample
library(rsample)

# Create stack_select dataset
stack_select <- stackoverflow %>%
    select(-Respondent)

# Split the data into training and testing sets
set.seed(1234)
stack_split <- stack_select %>%
    initial_split(0.8,
                  strata = "Remote")

stack_train <- training(stack_split)
stack_test <- testing(stack_split)


