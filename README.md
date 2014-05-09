GetCleanData.CourseProject
==========================

Course Project for Getting and Cleaning Data Coursera Course
Kingofharts/NPH

Hereafter 'The Data' refers to the set available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Enumerated Objectives

1) Create and post run_analysis.R, an R script that:

* Merges the 'training' and 'test' sets in The Data into one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement (figure out what this means...)
* Uses descriptive activity names to name the activities in the data set (labeling exercise?  use what's there?)
* Appropriately labels the data set with descriptive activity names (alright, wtf?)
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

2) Submit link to this Github repo, which will include run_analysis.R

3) CodeBook.md, a fun-filled narrative of the raw data, what I did with it, and what it looks like now

## Observations so far

* The UCI HAR Dataset ('The Data') root folder has the label key for the 6 physical states, 'activity labels.txt'
* Root also has the key for the 561 variables of each of the data points in the 'X_test.txt' and 'X_train.txt' files, 'features.txt' (raw) and 'features_info.txt' (narrative).
* '\Inertial Signals', subfolders of both '\train' and '\test' appear to be irrelevant to this assignment.  See comments:

    https://class.coursera.org/getdata-003/forum/thread?thread_id=30
    
* The 'y_test.txt' and 'y_train.txt' files, to my eyes, could have just been one additional column/variable in each of 'X_test.txt' and 'X_train.txt' respectively.
* Same for the 'subject_' files.  Train has 21 unique values, the other 9 are in test, combined making the list 1:30.

## Gameplan

* 1st things first, I want to get the X_ and y_ files merged in each of the \test and \train folders.
* Next, I want to get the subject column merged in as well, at which point I should have 1 data set for each folder
* Then combine the two (duh.)
* Whittle down the variables (columns) to the ones asked for
* Figure out the labeling whatever that's part of the instructions.
* Review what I've got, get mark down and file committing taken care of.


More to come!
