# Getting and Cleaning Data Project - John Hopkins Coursera

# Author: Payal

# Project Goals:
# 1. Merge the training and test sets to create one dataset.
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# 3. Use descriptive activity names to name the activities in the dataset.
# 4. Appropriately label the dataset with descriptive variable names.
# 5. Create a second, independent tidy dataset with the average of each variable 
#    for each activity and each subject.

# Load required packages and get the data
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only = TRUE, quietly = TRUE)

# Set working path and download the data
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")

# Load activity labels and features
activityLabels <- fread(file.path(path, "UCI HAR Dataset/activity_labels.txt"),
                        col.names = c("classLabels", "activityName"))
features <- fread(file.path(path, "UCI HAR Dataset/features.txt"),
                  col.names = c("index", "featureNames"))

# Extract measurements on mean and standard deviation
featuresWanted <- grep("(mean|std)\\(\\)", features[, featureNames])
measurements <- features[featuresWanted, featureNames]
measurements <- gsub('[()]', '', measurements)

# Load training datasets
train <- fread(file.path(path, "UCI HAR Dataset/train/X_train.txt"))[, featuresWanted, with = FALSE]
data.table::setnames(train, colnames(train), measurements)
trainActivities <- fread(file.path(path, "UCI HAR Dataset/train/Y_train.txt"),
                         col.names = c("Activity"))
trainSubjects <- fread(file.path(path, "UCI HAR Dataset/train/subject_train.txt"),
                       col.names = c("SubjectNum"))
train <- cbind(trainSubjects, trainActivities, train)

# Load testing datasets
test <- fread(file.path(path, "UCI HAR Dataset/test/X_test.txt"))[, featuresWanted, with = FALSE]
data.table::setnames(test, colnames(test), measurements)
testActivities <- fread(file.path(path, "UCI HAR Dataset/test/Y_test.txt"),
                        col.names = c("Activity"))
testSubjects <- fread(file.path(path, "UCI HAR Dataset/test/subject_test.txt"),
                      col.names = c("SubjectNum"))
test <- cbind(testSubjects, testActivities, test)

# Merge training and testing datasets
combined <- rbind(train, test)

# Convert class labels to descriptive activity names
combined[["Activity"]] <- factor(combined[, Activity],
                                 levels = activityLabels[["classLabels"]],
                                 labels = activityLabels[["activityName"]])

# Set SubjectNum as a factor
combined[["SubjectNum"]] <- as.factor(combined[, SubjectNum])

# Reshape the dataset for tidiness
combined <- reshape2::melt(data = combined, id = c("SubjectNum", "Activity"))
combined <- reshape2::dcast(data = combined, SubjectNum + Activity ~ variable, fun.aggregate = mean)

# Write the tidy dataset to a file
data.table::fwrite(x = combined, file = "tidyData.txt", quote = FALSE)
