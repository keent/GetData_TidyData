# This script does the following:
# 1 Merges the training and the test sets to create one data set 
# to object "dataMergedSet"

# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# to object "dataMeanStd"

# 3 Uses descriptive activity names to name the activities in the data set

# 4 Appropriately labels the data set with descriptive variable names. 

# 5 From the data set in step 4, creates a second, independent tidy data set with the
# average of each variable for each activity and each subject.
# named "dataSummary"

# 6 Finally, it writes the dataSummary from step 5, to a file named tidy_data.txt

library(plyr)

# 1 
# MERGE the TRAINING and TEST sets
setwd("./UCI HAR Dataset")
featuresUrl <- "./features.txt"
dfFeatures <- read.table(featuresUrl)

# read the test files and merge into 1 DF
testSubjUrl <- "./test/subject_test.txt"
testLabelsUrl <- "./test/y_test.txt"
testSetUrl <- "./test/X_test.txt"
dfTestSubj <- read.table(testSubjUrl, col.names=c("Subject"))
dfTestLabels <- read.table(testLabelsUrl, col.names=c("Activity"))
dfTestSet <- read.table(testSetUrl, col.names=dfFeatures$V2)
dfTestSubjLabels <- cbind(dfTestSubj, dfTestLabels)
dfTestSet <- cbind(dfTestSubjLabels, dfTestSet)

# read the training files and merge into 1 DF
trainSubjUrl <- "./train/subject_train.txt"
trainLabelsUrl <- "./train/y_train.txt"
trainSetUrl <- "./train/X_train.txt"
dfTrainSubj <- read.table(trainSubjUrl, col.names=c("Subject"))
dfTrainLabels <- read.table(trainLabelsUrl, col.names=c("Activity"))
dfTrainSet <- read.table(trainSetUrl, col.names=dfFeatures$V2)
dfTrainSubjLabels <- cbind(dfTrainSubj, dfTrainLabels)
dfTrainSet <- cbind(dfTrainSubjLabels, dfTrainSet)

# finally merge both test and training DFs into 1 DF
dataMergedSet <- rbind(dfTrainSet, dfTestSet)

# 2 
# EXTRACT only MEAN and STD deviations from the variables
dataMergedSet <- tbl_df(dataMergedSet)
dataMeanStd <- select(dataMergedSet, Subject, Activity, 
                        contains("mean"), contains("std"))

# 3 
# Use WORDS instead of numbers in the Activity variable
facActivities <- as.factor(dataMeanStd$Activity)
activities <- read.table("./activity_labels.txt")
levels(facActivities) <- activities$V2 # change the levels from ints to words
dataMeanStd$Activity <- facActivities

# 4
# Already done in step 1
# data is in dataMeanStd

# 5
# Get the mean for all variables by Activity and Subject
dataSummary <- group_by(dataMeanStd, Activity, Subject)
dataSummary <- summarise_each(dataSummary, funs(mean))
dataSummary <- arrange(dataSummary, Subject)

# Save it to a file
setwd("../")
write.table(dataSummary, file="tidy_data.txt", row.names=FALSE)

