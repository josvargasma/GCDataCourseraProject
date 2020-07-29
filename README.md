# Getting and Cleaning Data - Final Project

It is a final submission to optain the corresponding grade from coursera course. 
It involves the steps to run analysis and obtain a tidy data set. 

## DATASET

Data sets were downloaded from [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
You can obtain the data of the project here: [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## FILES

* CodeBook.md : Describes all the variables and transformations done to obtain the final tidy data. 
* run_analysis.R : Performs the data preparation and follow the steps required by the task

+ Merges the training and the test sets to create one data set.
+ Extracts only the measurements on the mean and standard deviation for each measurement.
+ Uses descriptive activity names to name the activities in the data set
+ Appropriately labels the data set with descriptive variable names.
+ From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* FinalData.txt is the exported final data after all transformations
