# <exercise id="3" title="Visualizing the fuel efficiency distribution">
#   
#   The first step before you start modeling is to explore your data. In this course we'll
#   practice using tidyverse functions for exploratory data analysis. Start off this case study 
#   by examing your dataset and visualizing the distribution of fuel efficiency. 
#   The ggplot2 package, with functions like 
#   [`ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html) and 
#   [`geom_histogram()`](https://ggplot2.tidyverse.org/reference/geom_histogram.html) 
#   are included in the tidyverse.
# 
# 
# **Instructions**
#   
#   The first time you run a code exercise, it may take a little while for your 
#   Docker container on [mybinder.org](https://mybinder.org/v2/gh/juliasilge/supervised-ML-case-studies-course/binder)
#   to load. ⏳ Try to be patient!
#   
#   **Wherever you see `___` in a code exercise, replace it with the correct code as instructed.
#     Run the code (via the button) to see if it will run, and submit it (via the other button)
#     to check if it's correct.**
# 
# `tidyverse` is loaded for you. 
# 
# - Print the `cars2018` object. Notice that some of the column names have spaces in them and
#   are surrounded by backticks, like `` `Recommended Fuel` ``.
# - Use the appropriate column from the dataset in the call to `aes()` so you can plot 
#   a histogram of fuel efficiency (MPG).
# - Set the correct `x` and `y` labels.
# 
# <codeblock id="01_03">
# 
# - The column `MPG` contains the fuel efficiency measurements so to make the plot, 
#   call `aes(x = MPG)`.
# - The number of cars goes on the y-axis and the fuel efficiency goes on the x-axis.
# 
# </codeblock>
# 
# </exercise>



library(tidyverse)
cars2018 <- read_csv("data/cars2018.csv")

# Print the cars2018 object
glimpse(cars2018)

# Plot the histogram
ggplot(cars2018, aes(x = MPG)) +
    geom_histogram(bins = 25) +
    labs(x = "Fuel efficiency (mpg)",
         y = "Number of cars")

