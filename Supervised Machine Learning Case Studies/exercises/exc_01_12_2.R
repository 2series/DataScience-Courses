# <exercise id="12" title="Plotting modeling results">
#   
#   You just trained models using bootstrap resampling, `cars_lm_bt` and `cars_rf_bt`. 
#   These models are available in your environment, trained on the entire training set 
#   instead of 10% only. Now let's evaluate how those models performed and compare them. 
#   We will again use `metrics()` from the yardstick package, but also we will plot the 
#   model predictions to inspect them visually.
# 
# Notice in this code how we use 
# [`gather()`](https://tidyr.tidyverse.org/reference/gather.html) from tidyr 
# (another tidyverse package) to tidy the dataframe and prepare it for plotting with ggplot2.
# 
# **Instructions**
# 
# - Use [`mutate()`](https://dplyr.tidyverse.org/reference/mutate.html) to create the new columns
#   with the predictions from the two models you trained.
# - Choose which columns should be specified as `truth` and which should be `estimate` when calling
#   `metrics()`.
# 
# <codeblock id="01_12_1">
# 
# Specify the `MPG` column as `truth` and the column created from the prediction (either `Linear regression` or `Random forest`) as `estimate`.
# 
# </codeblock>


# **Instructions**
#     
# Wonderful! Sit back and run the given code to visualize the results!
#     
# <codeblock id="01_12_2">
#         
#   You just need to run the code given to you.
#     
# </codeblock>
#         
#  </exercise>
        

library(caret)
library(tidyverse)
library(yardstick)

car_test <- readRDS("data/c1_testing_full.rds")
cars_lm_bt <- readRDS("data/cars_lm_bt.rds")
cars_rf_bt <- readRDS("data/cars_rf_bt.rds")

results <- car_test %>%
    mutate(MPG = log(MPG),
           `Linear regression` = predict(cars_lm_bt, car_test),
           `Random forest` = predict(cars_rf_bt, car_test))

results %>%
    gather(Method, Result, `Linear regression`:`Random forest`) %>%
    ggplot(aes(MPG, Result, color = Method)) +
    geom_point(size = 1.5, alpha = 0.5) +
    facet_wrap(~Method) +
    geom_abline(lty = 2, color = "gray50") +
    geom_smooth(method = "lm")

