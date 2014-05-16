GetCleanData.CourseProject
==========================

Course Project for Getting and Cleaning Data Coursera Course
Kingofharts/NPH

Hereafter 'The Data' refers to the set available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Enumerated Objectives

As indicated on the course site, the objectives are:

1) Create and post run_analysis.R, an R script that:

* Merges the 'training' and 'test' sets in The Data into one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set (forum clarification: numeric codes to character labels)
* Appropriately labels the data set with descriptive activity names (forum clarification: get proper names() on the columns)
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

2) Submit link to this Github repo, which will include run_analysis.R

3) CodeBook.md, a fun-filled narrative of the raw data, what I did with it, and what it looks like now

## Observations pre-scripting

* The UCI HAR Dataset ('The Data') root folder has the label key for the 6 physical states (activities), 'activity labels.txt'
* Root also has the key for the 561 variables of each of the data points in the 'X_test.txt' and 'X_train.txt' files, 'features.txt' (raw) and 'features_info.txt' (narrative).
* '\Inertial Signals', subfolders of both '\train' and '\test' appear to be irrelevant to this assignment.  See comments:

    https://class.coursera.org/getdata-003/forum/thread?thread_id=30
    
* The 'y_test.txt' and 'y_train.txt' files, to my eyes, could have just been one additional column/variable in each of 'X_test.txt' and 'X_train.txt' respectively (the activity code for each measurement).
* Same for the 'subject_' files (which subject generated that row in "X_...").  Train has 21 unique values, the other 9 are in test, combined comprising the 1:30 subjects.

## Post Mortem

* Figured proper script would fetch and unzip the data into the working directory, so did that.
* Figured the environment would get cluttered while wheeling and dealing data frames, so included language to remove objects as they became no longer needed.
* After reviewing The Data, narrowed down the actual .txt files needed for the assignment, pulled them all in as data frames.
* Got all the column names sorted out with labels as provided, then replaced the activity codes with the activity labels
* Combined/boiled down the data frames to just the rows & columns needed.  Used grep to narrow down variable columns to just those that included mean() or std().  Dropped meanFreq() columns as not perfectly matching project instructions.
* Used aggregate() to further simmer the data frame down to just the final product, then coded for export to tidy_data.txt

## CodeBook.md

* 1st Draft up.  Gauging how much detail to include without just reprinting the R script.
* Reused original readme.txt for description of source data.  Figured not broke, don't fix it.
