# <exercise id="5" title="Imbalanced data">
#   
#   This is real data from the real world, so you need to think through important modeling concerns, 
#   including how imbalanced the class is that you want to predict. You have been exploring this dataset
#   in the past few exercises. What is your assessment?
#   
#   <choice>
#   <opt text="This data set is imbalanced." correct="true">
#     
#   Correct! There are over 20 times more people in this survey who said they did vote than who 
#   said they did not.
#   
#   </opt>
#     
#     <opt text="This data set does not have a significant amount of imbalance.">
#       
#   Look at the dataset and notice how many people did vote and did not vote. 
#   Are the two categories about even or is one category much larger?
#       
#   </opt>
#       
#   <opt text="We can't tell from the information we have now whether the dataset is imbalanced.">
#         
#   We can tell whether our data is imbalanced by examining the dataset and noticing how many
#   people did vote and did not vote.
#       
#   </opt>
#     </choice>
#         
# </exercise>

# <exercise id="6" title="Fit a simple model">
#   
#   Start off a predictive modeling project by building the simplest possible model, to learn about the data and questions you are dealing with. Here, you will fit a simple logistic regression model on the whole data set to get an idea of what is going on.
# 
# **Instructions**
#   
#   - Use [`select()`](https://dplyr.tidyverse.org/reference/select.html) to remove the column
#     `case_identifier` from `voters` and assign it to `voters_select`. 
#   - Fit a logistic regression model to predict `turnout16_2016` explained by all the other 
#     variables in `voters_select`.
# 
# <codeblock id="03_06">
#   
#   - The formula for your model should be `turnout16_2016 ~ .` . 
#   - To fit a logistic regression model, use `family = "binomial"`.
# 
# </codeblock>
#   
#   </exercise>


library(tidyverse)
voters <- read_csv("data/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016))

# Remove the case_indetifier column
voters_select <- voters %>%
        select(-case_identifier)

# Build a simple logistic regression model
simple_glm <- glm(turnout16_2016 ~ .,  family = "binomial", 
                  data = voters_select)

# Print the summary                  
summary(simple_glm)

