# **Instructions**
#   
#   Check out how three responses on the survey vary with voting behavior by using
#   [`group_by()`](https://dplyr.tidyverse.org/reference/group_by.html) and 
#   [`summarise()`](https://dplyr.tidyverse.org/reference/summarise.html).
# 
# <codeblock id="03_03_2">
#   
#   First call `group_by()`, and then `summarise()`.
# 
# </codeblock>
#   
#   </exercise>


library(tidyverse)
voters <- read_csv("data/voters.csv")

# How do the reponses on the survey vary with voting behavior?
voters %>%
    group_by(turnout16_2016) %>%
    summarise(`Elections don't matter` = mean(RIGGED_SYSTEM_1_2016 <= 2),
              `Economy is getting better` = mean(econtrend_2016 == 1),
              `Crime is very important` = mean(imiss_a_2016 == 2))


