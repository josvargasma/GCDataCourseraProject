# Getting and Cleaning Data - Final Project
## C O D E  B O O K

Description of variables, data and transformations on work performed to clean up the data.

### DATA

Data sets were downloaded from [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
You can obtain the data of the project here: [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### VARIABLES AND TRANSFORMATIONS

#### 1. Assign downloaded data to variables

* features <- features.txt
_2 columns, 561 rows_
Information obtained from the accelerometer and gyroscope. 3 axial raw signals to each one. 

* activities <- activities.txt
_2 columns, 6 rows_
List of the activities performed during each measurement. 

* subject_test <- test/subject_test.txt
_1 column, 2947 rows_
Test data od 9/30 volunteer test subject

* x_test <- test/X_test.txt
_561 columns, 2947 rows_
Recorded features test data

* y_test <- test/y_test.txt
_1 column, 2947 rows_
test data of activities code labels

* subject_train <- test/subject_train.txt
_1 column, 7352 rows_
Test data od 21/30 volunteer test subject

* x_train <- test/X_train.txt
_561 columns, 7352 rows_
Recorded features train data

* y_train <- test/y_train.txt
_1 column, 7352 rows_
Train data of activities code labels

#### 2. Merges the different sets to create one data set

* X
_561 columns, 10299 rows_
Obtained by merging X_train and X_test using rbind()

* Y
_1 column, 10299 rows_
Obtained by merging y_train and y_test using rbind()

* Subject
_1 column, 10299 rows_
Obtained by merging subject_train and subject_test using rbind()

* TotalData
_563 columns, 10299 rows_
Obtained by merging X, Y and Subject using cind()

#### 3. Extract only means and standart deviations for measurements

* FinalData
_88 columns, 10299 rows_
Obtained from TotalData. Using the function *select* to conserve only columns subject, code, 
+ and different measurements on the mean and stardart deviation. 

#### 4. Uses descriptive activity names to name activities

In FinalData, replace numbers in column "code" with corresponding activity taken
+ from activities variable. 

#### 5. Appropriately labels the data set with descriptive names

In FinalData:
*"code" column renamed into "activities"
*All "Acc" in columns name replaced by "Accelerometer" using gsub()
*All "Gyro" in columns name replaced by "Accelerometer" using gsub()
*All "BodyBody" in columns name replaced by "Body" using gsub()
*All "Mag" in columns name replaced by "Magnitude" using gsub()
*All start with character"f" in columns name replaced by "Frequency" using gsub()
*All start with character"t" in columns name replaced by "Time" using gsub()
*All "TBody" in columns name replaced by "TimeBody" using gsub()
*All "freq" in columns name replaced by "Frequency" using gsub()
*All "angle" in columns name replaced by "Angle" using gsub()
*All "gravity" in columns name replaced by "Gravity" using gsub()

#### 6. From FinalData created a second tidy data set

* SummaryData
_88 columns, 180 rows_
Obtained by summarizing FinalData taking the means of each activity and each
+ subject, after grouped by suject and activity. 

* Export SummaryData into "FinalData.txt" file