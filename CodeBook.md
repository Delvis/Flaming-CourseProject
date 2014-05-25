## Before anything accesse these files:

* [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
* [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


In this repo you will find the `run_analysis.R` script. This R script performs the following transformations on the original data:

#### Merges the training and the test sets to create one data set.

The script here merges date from some files:

* `train/subject_train.txt` + `test/subject_test.txt`
  - a 10299x1 data frame with subject IDs
* `train/X_train.txt` + `test/X_test.txt`
  - the main 10299x561 data frame
* `train/y_train.txt` + `test/y_test.txt`
  - a 10299x1 data frame with activity IDs

#### Extracts only the measurements on the mean and standard deviation for each measurement.

From the 561 attributes only 66 were evaluated as being mean and standard deviations. Therefore we obtain from here a 10299x66 data frame.

#### Uses descriptive activity names to name the activities in the data set

Here we attribute the activity names, from the `activitylabels.txt` to our data set:
* laying
* sitting
* standing
* walking
* walkingdownstairs
* walkingupstairs

#### Appropriately labels the data set with descriptive activity names. 

As it is convenient in tidy data, we remove all the illegal characters of the labels.

#### Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Finally we create the final tidy 180*68 data frame, `super_tidy_data.txt`.

## Sources used:

Anguita D., Ghio A., Oneto L., Parra X., Reyes-Ortiz J. 2012. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
