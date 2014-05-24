## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for
## each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each
## variable for each activity and each subject.

## 0. Load the data into R

S_train = read.table("train/subject_train.txt")
S_test = read.table("test/subject_test.txt")

X_train = read.table("train/X_train.txt")
X_test = read.table("test/X_test.txt")

Y_train = read.table("train/y_train.txt")
Y_test = read.table("test/y_test.txt")

## 1. Merges the training and the test sets to create one data set.

S = rbind(S_train, S_test)
X = rbind(X_train, X_test)
Y = rbind(Y_train, Y_test)

## 2. Extracts only the measurements on the mean and standard deviation for
## each measurement.

feat = read.table("features.txt")
## grep searches for matches to argument pattern within each element of a character vector
indices = grep("-mean\\(\\)|-std\\(\\)", feat[, 2])
X = X[, indices]
names(X) = feat[indices, 2]
## gsub perform replacement of all matches.
names(X) = gsub("\\(|\\)", "", names(X))
## tolower convert upper-case characters in a character vector to lower-case.
names(X) = tolower(names(X))

## 3. Uses descriptive activity names to name the activities in the data set

A = read.table("activity_labels.txt")
A[, 2] = gsub("_", "", tolower(as.character(A[, 2])))
Y[,1] = A[Y[,1], 2]
names(Y) = "activity"

## 4. Appropriately labels the data set with descriptive activity names.

names(S) = "subject"
tidy = cbind(S, Y, X)
write.table(tidy, "tidy_data.txt")

## 5. Creates a second, independent tidy data set with the average of each
## variable for each activity and each subject.

uniqueS = unique(S)[,1]
numS = length(unique(S)[,1])
numA = length(A[,1])
numCols = dim(tidy)[2]
result = tidy[1:(numS*numA), ]

final = 1
for (s in 1:numS) {
        for (a in 1:numA) {
                result[final, 1] = uniqueS[s]
                result[final, 2] = A[a, 2]
                tmp = tidy[tidy$subject==s & tidy$activity==A[a, 2], ]
                result[final, 3:numCols] = colMeans(tmp[, 3:numCols])
                final = final+1
        }
}

## Finally, create the new .text with 180 observations of 68 variables

write.table(result, "super_tidy_data.txt")
