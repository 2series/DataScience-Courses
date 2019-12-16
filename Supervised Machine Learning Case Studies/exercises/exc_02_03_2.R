# **Instructions**
#   
#   Use the appropriate column from the dataset so you can plot a boxplot with remote status on the 
#   x-axis and professional experience on the y-axis.
# 
# <codeblock id="02_03_2">
#   
#   The column `Remote` contains the remote status of each developer while the `YearsCodedJob` column 
#   contains how many years of experience each developer has.
# 
# </codeblock>
  


library(tidyverse)
stackoverflow <- read_csv("data/stackoverflow.csv")

ggplot(stackoverflow, aes(Remote, YearsCodedJob)) +
    geom_boxplot() +
    labs(x = NULL,
         y = "Years of professional coding experience") 

