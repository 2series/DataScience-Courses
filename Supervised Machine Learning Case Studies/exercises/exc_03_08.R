# <exercise id="7" title="VOTE 2016" type="slides">
#   
#   <slides source="chapter3_07">
#     </slides>
#     
#     </exercise>
#     
#     <exercise id="8" title="Training and testing data">
#       
#   It's time to split your data into training and testing sets, in the same way that you created
#   these subsets in the previous case studies. You want to split your data about evenly on the class
#   `turnout16_2016`.
# 
# **Instructions**
# 
#   - Load the rsample package, for using the functions to split your data.
#   - Use the correct function to create a data split that divides `voters_select` into 80%/20% sections.
#   - Assign the 80% partition to `vote_train` and the 20% partition to `vote_test`.
# 
# <codeblock id="03_08">
# 
# The `initial_split()` function sets up the data partitioning, and then you can use that as
# input to call `training()` and `testing()`.
# 
# </codeblock>
# 
# </exercise>


library(tidyverse)
voters_select <- read_csv("data/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016)) %>% 
    select(-case_identifier)

# Load rsample
library(rsample)

# Split data into training and testing sets
set.seed(1234)
vote_split <- voters_select %>%
    initial_split(p = 0.8,
                  strata = "turnout16_2016")
vote_train <- training(vote_split)
vote_test <- testing(vote_split)
