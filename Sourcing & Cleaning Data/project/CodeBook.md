Author: RIHAD VARIAWA, Data Scientist - Who has fun LEARNING, EXPLORING & GROWING

## CodeBook.md

Describes the variables, the data, and any transformations performed to clean-up the data.

### Data Location and Files
The data is scattered across multiple files and only a subset of all the files from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are used.

The following is a code snippet showing the different files used from the 'run_analysis.R' file:
```
train_path<- "./UCI HAR Dataset/train/X_train.txt"
test_path <- "./UCI HAR Dataset/test/X_test.txt"
features_path <- "./UCI HAR Dataset/features.txt"
label_train_path <- "./UCI HAR Dataset/train/y_train.txt"
label_test_path <- "./UCI HAR Dataset/test/y_test.txt"
subjects_train_path <- "./UCI HAR Dataset/train/subject_train.txt"
subjects_test_path <- "./UCI HAR Dataset/test/subject_test.txt"
activities_path <- "./UCI HAR Dataset/activity_labels.txt"
```

### Cleaning the Data
The idea here was to combine all of the information from the following files into a descriptive clean dataset. Firstly, all of the files are loaded into Tibbles, which are a special form of dataframes from the 'Tibble' package. The features.txt file is used for naming all of the variables in the training and test sets. The features came with numbers in the front which were removed so that just the name of each variable could be used.

Then, training set and test set are merged together placing one on top of the other. Following the merge the subject id as well as the activity that describes the observations were added as new variable columns at the beginning of our new dataset.

### Extraction of Mean and Standard Deviation
The grep command is used to filter out all of the commands that are not the variables relating to the mean or standard deviation of the feature.

### Replace Activity Numbers With Descriptive Names
The activity data is given as a numbers. The final tidy dataset takes the numbers and converts them to the descriptive activity name given by 'activity_labels.txt'

### Create a Sub Table of All the Averages for Each activity and Each Subject
A smaller table is created using the average of all of the observations using the group_by function from the `dplyr` package.

### Variables/Features
(The below paragraphs are taken straight from the features_info.txt)

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

#### Actual Variables Found in the Tidy Dataset

- subject
  - The subject's unique IDs
    - Range: (1-30)
- activity.name
  - The action the subject is taking
    - possible values:
      - LAYING
      - SITTING
      - STANDING
      - WALKING
      - WALKING_DOWNSTAIRS
      - WALKING_UPSTAIRS
- timeBodyAcceleration.mean.X
- timeBodyAcceleration.mean.Y
- timeBodyAcceleration.mean.Z
- timeBodyAcceleration.standardDeviation.X
- timeBodyAcceleration.standardDeviation.Y
- timeBodyAcceleration.standardDeviation.Z
- timegravityAcceleration.mean.X
- timegravityAcceleration.mean.Y
- timegravityAcceleration.mean.Z
- timegravityAcceleration.standardDeviation.X
- timegravityAcceleration.standardDeviation.Y
- timegravityAcceleration.standardDeviation.Z
- timeBodyAccelerationJerk.mean.X
- timeBodyAccelerationJerk.mean.Y
- timeBodyAccelerationJerk.mean.Z
- timeBodyAccelerationJerk.standardDeviation.X
- timeBodyAccelerationJerk.standardDeviation.Y
- timeBodyAccelerationJerk.standardDeviation.Z
- timeBodyGyroscope.mean.X
- timeBodyGyroscope.mean.Y
- timeBodyGyroscope.mean.Z
- timeBodyGyroscope.standardDeviation.X
- timeBodyGyroscope.standardDeviation.Y
- timeBodyGyroscope.standardDeviation.Z
- timeBodyGyroscopeJerk.mean.X
- timeBodyGyroscopeJerk.mean.Y
- timeBodyGyroscopeJerk.mean.Z
- timeBodyGyroscopeJerk.standardDeviation.X
- timeBodyGyroscopeJerk.standardDeviation.Y
- timeBodyGyroscopeJerk.standardDeviation.Z
- timeBodyAccelerationMagnitude.mean
- timeBodyAccelerationMagnitude.standardDeviation
- timegravityAccelerationMagnitude.mean
- timegravityAccelerationMagnitude.standardDeviation
- timeBodyAccelerationJerkMagnitude.mean
- timeBodyAccelerationJerkMagnitude.standardDeviation
- timeBodyGyroscopeMagnitude.mean
- timeBodyGyroscopeMagnitude.standardDeviation
- timeBodyGyroscopeJerkMagnitude.mean
- timeBodyGyroscopeJerkMagnitude.standardDeviation
- frequencyBodyAcceleration.mean.X
- frequencyBodyAcceleration.mean.Y
- frequencyBodyAcceleration.mean.Z
- frequencyBodyAcceleration.standardDeviation.X
- frequencyBodyAcceleration.standardDeviation.Y
- frequencyBodyAcceleration.standardDeviation.Z
- frequencyBodyAccelerationJerk.mean.X
- frequencyBodyAccelerationJerk.mean.Y
- frequencyBodyAccelerationJerk.mean.Z
- frequencyBodyAccelerationJerk.standardDeviation.X
- frequencyBodyAccelerationJerk.standardDeviation.Y
- frequencyBodyAccelerationJerk.standardDeviation.Z
- frequencyBodyGyroscope.mean.X
- frequencyBodyGyroscope.mean.Y
- frequencyBodyGyroscope.mean.Z
- frequencyBodyGyroscope.standardDeviation.X
- frequencyBodyGyroscope.standardDeviation.Y
- frequencyBodyGyroscope.standardDeviation.Z
- frequencyBodyAccelerationMagnitude.mean
- frequencyBodyAccelerationMagnitude.standardDeviation
- frequencyBodybodyAccelerationJerkMagnitude.mean
- frequencyBodybodyAccelerationJerkMagnitude.standardDeviation
- frequencyBodybodyGyroscopeMagnitude.mean
- frequencyBodybodyGyroscopeMagnitude.standardDeviation
- frequencyBodybodyGyroscopeJerkMagnitude.mean
- frequencyBodybodyGyroscopeJerkMagnitude.standardDeviation
