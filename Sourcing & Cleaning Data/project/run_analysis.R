# Getting and Cleaning Data Project John Hopkins Coursera
# Author: RIHAD VARIAWA, Data Scientist - Who has fun LEARNING, EXPLORING & GROWING

# 1. Merges the training and the test sets to create one dataset.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Dataset from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

if(!dir.exists("./UCI HAR Dataset/")){
    
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./motion.zip", mode='wb')
    unzip("./motion.zip")
    unlink("./motion.zip")
}

# Set the paths of relevant files
train_path<- "./UCI HAR Dataset/train/X_train.txt"
test_path <- "./UCI HAR Dataset/test/X_test.txt"
features_path <- "./UCI HAR Dataset/features.txt"
label_train_path <- "./UCI HAR Dataset/train/y_train.txt"
label_test_path <- "./UCI HAR Dataset/test/y_test.txt"
subjects_train_path <- "./UCI HAR Dataset/train/subject_train.txt"
subjects_test_path <- "./UCI HAR Dataset/test/subject_test.txt"
activities_path <- "./UCI HAR Dataset/activity_labels.txt"

# Read in the various tables
feature_names <- read_table(features_path, col_names = FALSE)
feature_names <- feature_names[[1]]

# Remove the numbers from the names
feature_names <- sub(pattern = "\\d+ ", replacement = "", x = feature_names)
subject_train_table <- read_table(subjects_train_path, col_names = "subject")
subject_test_table <- read_table(subjects_test_path, col_names="subject")
train_data <- read_table(train_path, col_names = feature_names)
train_labels <- read_table(label_train_path, col_names = "activity.name")
test_data <- read_table(test_path, col_names = feature_names)
test_labels <- read_table(label_test_path, col_names = "activity.name")
activities <- read_table(activities_path, col_names = FALSE)
activities <- select(activities, X2)

## 1.Merge the training and the test sets to create a single dataset
# Merge both the training and test set and call it merged_dataset
train_data <- bind_cols(train_data, train_labels)
train_data_and_subjects <- bind_cols(train_data, subject_train_table)
test_data <- bind_cols(test_data, test_labels)
test_data_and_subjects <- bind_cols(test_data, subject_test_table)
merged_dataset <- bind_rows(train_data_and_subjects, test_data_and_subjects)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement
names_of_mean_and_std <- names(select(merged_dataset, grep(pattern = "mean\\(\\)|std", x = names(merged_dataset))))
merged_cut_dataset <- select(merged_dataset, names_of_mean_and_std)
merged_cut_dataset_with_sub_act <- bind_cols(merged_dataset["subject"], merged_dataset["activity.name"], merged_cut_dataset)

## 3.Uses descriptive activity names to name the activities in the dataset
# Change the labels to describtive activities
merged_cut_dataset_with_sub_act["activity.name"] <- sapply(select(merged_cut_dataset_with_sub_act, activity.name), function(x){activities[x,]})
var_names <- names(merged_cut_dataset_with_sub_act)

## 4. Appropriately labels the dataset with descriptive variable names
var_names <- sapply(var_names, tolower)
var_names <- unname(obj = var_names)
var_names <- sub(pattern = "\\.", replacement = "", x = var_names)
var_names <- sub(pattern = "^t", replacement = "time", x = var_names)
var_names <- sub(pattern = "acc", replacement = "Acceleration", x = var_names)
var_names <- sub(pattern = "f", replacement = "frequency", x = var_names)
var_names <- gsub(pattern = "-", replacement = "", x = var_names)
var_names <- sub(pattern = "gyro", replacement = "Gyroscope", x = var_names)
var_names <- sub(pattern = "std", replacement =  ".standardDeviation", x = var_names)
var_names <- sub(pattern = "\\(\\)", replacement = "", x = var_names)
var_names <- sub(pattern = "mag", replacement = "Magnitude", x = var_names)
var_names <- sub(pattern = "mean", replacement = ".mean", x = var_names)
var_names <- sub(pattern = "y$", replacement = ".Y", x = var_names)
var_names <- sub(pattern = "x$", replacement = ".X", x = var_names)
var_names <- sub(pattern = "z$", replacement = ".Z", x = var_names)
var_names <- sub(pattern = "^activity", replacement = "activity.", x = var_names)
var_names <- sub(pattern = "body", replacement = "Body", x = var_names)
var_names <- sub(pattern = "jerk", replacement = "Jerk", x = var_names)

names(merged_cut_dataset_with_sub_act) <- var_names

## 5. From the data set in step 4, creates a second, independent tidy dataset with the
## average of each variable for each activity and each subject
by_activity_sub <- merged_cut_dataset_with_sub_act %>% group_by(subject, activity.name)
summ <- by_activity_sub %>% summarise_all(.funs = mean)
write.table(x = summ, file = "table.txt", row.names = FALSE)
summ
    
