# <exercise id="6" title="Training and testing data">
#   
#   Training models based on all of your data at once is typically not the best choice. 🚫 
#   Instead, you can create subsets of your data that you use for different purposes, 
#   such as *training* your model and then *testing* your model. 
# 
# Creating training/testing splits reduces overfitting. 
# When you evaluate your model on data that it was not trained on, 
# you get a better estimate of how it will perform on new data.
# 
# **Instructions**
#   
#   - Load the `rsample` package. 
#   - Create a data split that divides the original data into 80%/20% sections and
#     (roughly) evenly divides the partitions between the different types of `Transmission`.
#   - Assign the 80% partition to `car_train` and the 20% partition to `car_test`.
#   - To load a package in R, use `library(package_name)`.
#   - `initial_split()` takes as its arguments, after the data that you pipe in: `prop`, 
#     the proportion of data to include in the training set, and then `strata`, the variable 
#     to partition evenly across.
#   - Once you create the `car_split` object, you can use it to determine your training set 
#     and testing set.


library(tidyverse)
car_vars <- readRDS("data/c1_cars_vars_full.rds")

# Load rsample
library(rsample)

# Split the data into training and test sets
set.seed(1234)
car_split <- car_vars %>%
    initial_split(prop = 0.8, strata = "Transmission")

car_train <- training(car_split)
car_test <- testing(car_split)
