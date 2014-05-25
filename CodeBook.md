## Before anything accesse these files:

* [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
* [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


In this repo you will find the `run_analysis.R` script. This R script performs the following transformations on the original data:

## Merges the training and the test sets to create one data set.

The script here merges date from some files:

* `train/subject_train.txt` + `test/subject_test.txt`
  - a 10299x1 data frame with subject IDs
* `train/X_train.txt` + `test/X_test.txt`
  - the main 10299x561 data frame
* `train/y_train.txt` + `test/y_test.txt`
  - a 10299x1 data frame with activity IDs

## Extracts only the measurements on the mean and standard deviation for each measurement.

## Uses descriptive activity names to name the activities in the data set

## Appropriately labels the data set with descriptive activity names. 

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
