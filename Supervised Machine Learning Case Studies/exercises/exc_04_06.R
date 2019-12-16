# <exercise id="5" title="Exploratory data analysis with tidy data" type="slides">
#     
#     <slides source="chapter4_05">
#     </slides>
#         
#     </exercise>
#         
# <exercise id="6" title="Visualizing agreement with age">
#             
# The tidied version of the survey data that you constructed is available
# in your environment. You have many options at your fingertips with this 
# tidy data now. Make a plot that shows how agreement on a subset of the
# questions changes with age.
#         📉
# In this exercise, we are using 
# [`filter()`](https://dplyr.tidyverse.org/reference/filter.html) to 
# subset the data to just a subset of the questions on the survey to look at.
#         
# **Instructions**
#             
#   - Group by two variables, `key` and `value`, so you can calculate an 
#     average age for each answer to each question.
#   - Summarize for each grouping to find an average age.
#   - Choose the correct `geom` to make a line plot.
#         
# <codeblock id="04_06">
#             
#   - You want to `group_by(key, value)` and `summarize(age)` to find the average age
#     for each ansewr to each question.
#   - You can build a line plot using 
#     [`geom_line()`](https://ggplot2.tidyverse.org/reference/geom_path.html).
#         
# </codeblock>
#             
# </exercise>


library(tidyverse)
tidy_sisters <- readRDS("data/c4_tidy_sisters.rds")

# Visualize agreement with age
tidy_sisters %>%
    filter(key %in% paste0("v", 153:170)) %>%
    group_by(key, value) %>%
    summarise(age = mean(age, na.rm = TRUE)) %>%
    ggplot(aes(value, age, color = key)) +
    geom_line(show.legend = FALSE) +
    facet_wrap(~key, nrow = 3)
