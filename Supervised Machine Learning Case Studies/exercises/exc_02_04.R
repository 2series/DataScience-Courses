# </exercise>
#   
#   <exercise id="4" title="Start with a simple model">
#     
#     Before starting the process of building machine learning models, let's start by building an 
#     extremely simple model to get our bearings. This is not a model you would probably want to use to
#     make predictions on new data, but it can give you an idea about how successful you may eventually be
#     and which predictors are most important.
# 
# Recall that when you use the pipe operator `%>%` with a function like 
# [`glm()`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/glm.html) (whose first argument is not `data`), 
# you must specify `data = .` to indicate that you are piping in the modeling dataset.
# 
# **Instructions**
# 
# Build a simple logistic regression model predicting remote status.
# 
# - Use `select()` to deselect the column `Respondent` from the dataset before using it in modeling.
# - Fit `Remote` as the predicted quantity, explained by all the predictors, i.e., `.` in the R formula input
#   to `glm()`. Don't get confused with the two instances of `.`!
#     
#     <codeblock id="02_04">
#       
#       To fit a logistic regression model using the pipe operator `%>%`, specify your model as 
#       `glm(Remote ~ ., family = "binomial", data = .)`. The first `.` here means that we want to predict
#       `Remote` based on *all* the other columns in the dataset, while the second `.` means that we have 
#        piped in the dataset to the call to `glm()`.
#     
#     </codeblock>


library(tidyverse)
stackoverflow <- read_csv("data/stackoverflow.csv") %>%
    mutate(Remote = factor(Remote, levels = c("Remote", "Not remote")))

# Build a simple logistic regression model
simple_glm <- stackoverflow %>%
        select(-Respondent) %>%
        glm(Remote ~ .,
            family = "binomial",
            data = .)


# Print the summary of the model
summary(simple_glm)
