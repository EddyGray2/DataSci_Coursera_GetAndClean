# Script to perform operations of getting and cleaning data.

#1. Merges the training and the test sets to create one data set.

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

#3. Uses descriptive activity names to name the activities in the data set.

#4. Appropriately labels the data set with descriptive variable names.

#5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

datasetSubDir <- "./UCI HAR Dataset/"

setwd("D:/user/eddy")
featuresHead <- read.table( paste(datasetSubDir , "features.txt", sep="/"), sep ="", header=FALSE, quote="")

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep ="", header=FALSE, quote="")

# Test data
testSubject <- read.table( paste(datasetSubDir, "test", "subject_test.txt", sep="/"), sep ="", header=FALSE, quote="")
testY <- read.table("./UCI HAR Dataset/test/y_test.txt", sep ="", header=FALSE, quote="")
testX <- read.table("./UCI HAR Dataset/test/x_test.txt", sep ="", header=FALSE, quote="")

# Train data
trainSubject <- read.table( paste(datasetSubDir, "train", "subject_train.txt", sep="/"), sep ="", header=FALSE, quote="")
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt", sep ="", header=FALSE, quote="")
trainX <- read.table("./UCI HAR Dataset/train/x_train.txt", sep ="", header=FALSE, quote="")

# Join
allX <- rbind(trainX, testX)
allY <- rbind(trainY, testY)
allSubject <- rbind(trainSubject, testSubject)

# Rename the column to be the candidate number
allSubjectRename <- allSubject 
colnames(allSubjectRename) <- "candidateNum"

# Rename the column to be the activity
allYRename <- allY
colnames(allYRename) <- "activity"

logicalMatches <- apply(featuresHead, 2, function (x) { grepl('mean',x)  | grepl('std',x)})

columnIndexesToKeep <- subset(featuresHead, logicalMatches[,2], 1 )
allNeededData <- allX[,columnIndexesToKeep[,1]]

for (i in 1:nrow(columnIndexesToKeep) ) {
  names(allNeededData)[i] <- as.character(featuresHead[i,2])
}

# Combine the datasets
allBoundData <- cbind(allSubjectRename, allYRename, allNeededData)

# Summarize the averages
install.packages("plyr")
require("plyr")
summarizedData <- ddply(allBoundData, .(activity,candidateNum), colMeans)

# Write the data out
write.table(summarizedData, file= "summarizedDataFile.txt", row.names = FALSE)