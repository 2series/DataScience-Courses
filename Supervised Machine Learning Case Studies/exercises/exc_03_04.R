# <exercise id="4" title="Visualization for exploratory data analysis">
#   
#   Visualization is a powerful tool for exploratory data analysis. Plotting your data 
#   before you start modeling gives you the opportunity to understand its characteristics. 📈
# 
# **Instructions**
#   
#   - Call [`ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html) to initialize a new plot.
#   - Use the correct ggplot2 `geom` to make a histogram of survey responses for one question
#     (`econtrend_2016`) and examine the difference by voting behavior. 
# 
# On this question about how the economy is doing, an answer of 1 indicates "getting better", 
# 2 indicates "about the same", 3 indicates "getting worse", and 4 indicates "don't know".
# 
# <codeblock id="03_04">
#   
#   To make a histogram, use 
#   [`geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html).
# 
# </codeblock>
#   
#   </exercise>


library(tidyverse)
voters <- read_csv("data/voters.csv") %>%
    mutate(turnout16_2016 = factor(turnout16_2016))

## Visualize difference by voter turnout
voters %>%
    ggplot(aes(econtrend_2016, ..density.., fill = turnout16_2016)) +
    geom_histogram(alpha = 0.5, position = "identity", binwidth = 1) +
    labs(title = "Overall, is the economy getting better or worse?")

