library(dplyr)

## Assing all data frames

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

## Merging the sets

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
TotalData <- cbind(Subject, Y, X)

## Extracting only measurements on the mean and std for each measurement

FinalData <- select(TotalData, subject, code, contains("mean"), contains("std"))

## Uses descriptive activity names to name the activities

FinalData$code <- activities[FinalData$code, 2]

names(FinalData)[2] <- "activity"
names(FinalData) <- gsub("Acc", "Accelerometer", names(FinalData))
names(FinalData) <- gsub("Gyro", "Gyroscope", names(FinalData))
names(FinalData) <- gsub("BodyBody", "Body", names(FinalData))
names(FinalData) <- gsub("Mag", "Magnitude", names(FinalData))
names(FinalData) <- gsub("^t", "Time", names(FinalData))
names(FinalData) <- gsub("^f", "Frequency", names(FinalData))
names(FinalData) <- gsub("tBody", "TimeBody", names(FinalData))
names(FinalData) <- gsub(".mean()", "Mean", names(FinalData), ignore.case = TRUE)
names(FinalData) <- gsub(".std()", "STD", names(FinalData), ignore.case = TRUE)
names(FinalData) <- gsub("freq", "Frequency", names(FinalData))
names(FinalData) <- gsub("angle", "Angle", names(FinalData))
names(FinalData) <- gsub("gravit", "Gravit", names(FinalData))

## Creates a second independient tidy data set with the average of each activity
## and each subject

SummaryData <- FinalData %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))


write.table(SummaryData, "FinalData.txt", row.name = FALSE)