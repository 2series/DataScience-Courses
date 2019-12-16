# **Instructions**
#   
#   - Group by `age` and summarize the `value` column to see how the overall agreement
#     with all questions varied by age.
#   - Count the `value` column to check out how many respondents agreed or disagreed overall.
# 
# <codeblock id="04_04_2">
#   
#   - Call the `group_by()` function first, and then `summarize()`. 
#   - To count the `value` column, use `count(value)`.
# 
# </codeblock>
#   
#   </exercise>
  


library(tidyverse)
tidy_sisters <- readRDS("data/c4_tidy_sisters.rds")

# Overall agreement with all questions by age
tidy_sisters %>%
    group_by(age) %>%
    summarise(value = mean(value, na.rm = TRUE))

# Number of respondents agreed or disagreed overall
tidy_sisters %>%
    count(value)
