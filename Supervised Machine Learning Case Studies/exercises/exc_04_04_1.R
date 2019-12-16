# </exercise>
#   
#   <exercise id="4" title="Tidying the survey data">
#     
#     Embracing [tidy data principles](https://tidyverse.tidyverse.org/articles/manifesto.html) 
#     is a powerful option for exploratory data analysis. When your data is tidy, you can quickly
#     iterate in getting to know your data better and making exploratory plots. Let's transform this 
#     wide dataset into a tidy dataframe with one observation per row, and then check out some
#     characteristics of this subset of the original survey.
# 
# Note: There is a column called `sister` in this dataset that is an identifier for each
# survey respondent. We are removing this column in the exercise using 
# [`select()`](https://dplyr.tidyverse.org/reference/select.html).
# 
# **Instructions**
# 
# - Use the [`gather()`](https://tidyr.tidyverse.org/reference/gather.html) 
#   function to transform the wide dataset with each survey question in a separate
#   column to a narrow, tidy dataset with each survey question in a separate row.
# - View the structure of this tidy data set using `glimpse()`.
# 
# <codeblock id="04_04_1">
# 
# When you implement `... %>% gather(key, value, -age)`, you transform the dataset
# from wide (non-tidy) to narrow (tidy). The argument `-age` specifies that we want
# to keep the `age` column for each row.
# 
# </codeblock>
# 
# Next look at question agreement overall.


library(tidyverse)
sisters67 <- read_csv("data/sisters.csv")

# Print the structure of sisters67
glimpse(sisters67)

# Tidy the dataset
tidy_sisters <- sisters67 %>%
    select(-sister) %>%
    gather(key, value, -age)

# Print the structure of tidy_sisters
structure(tidy_sisters)
