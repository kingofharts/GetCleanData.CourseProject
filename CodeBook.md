CodeBook for tidy_data.txt
Coursera Class:
Getting and Cleaning Data (getdata-003)
NPH/KingofHarts

This document is broken into three sections:

* A description of the final product, "tidy_data.txt"
* A description of the actions taken to generate "tidy_data.txt" using "run_analysis.R"
* A direct reprint of the "readme.txt" file included with the source (raw) data set describing those data's format and configuration.  This section begins with "Human Activity Recognition..."

## Final Product, "tidy_data.txt"

"tidy_data.txt" is a text export of an R data frame composed of 180 rows of 68 variables.

The first column in the data frame, 'subject', indicates which of the 30 experiment participants/subjects.
The second column in the data frame, 'activity', indicates which of the 6 activities.

30 members of first grouping x 6 possible activities = 180 rows/pairings.

Each column thereafter houses the mean of all recorded measurements of that row's subject performing that row's activity for that column name's variable.

These 66 variables are each variable in the original 561 variable set where either "mean()" or "std()" are included in the variable name.

The column names for these 66 variables are taken directly from the source data.  Aside from boiling the data down to the variable mean based on the groupings mentioned above, no other changes were made to these variables.

## Modifications to source data

The original data were consolidated and reduced as follows:

* The variable names housed in "UCI HAR Dataset/features.txt" were pulled into the environment as a one column data frame, which was subsequently used to insert names() into each of the data frames sourced from the "X_...txt" files.
* The activity labels housed in "UCI HAR Dataset/activity_labels.txt" were pulled into the environment as a one column data frame.  The activity codes in each of the "y_...txt" files were pulled in as one column data frames.  The activity label data frame was then joined (using plyr) to each of the "y_" data frames as new data frames, which were then sourced to replace the codes in the original "y_..." data frames.  More simply, the activity labels were indexed to the activity codes, and then using this index the codes in each of the y_ data frames were replaced with the labels.
* Each of the "subject_...txt" files were pulled in as one column data frames with the column names "subject".
* Now, with data frames with column names for each of the X_, y_, and subject_ files for both test and train, one merged data frame for each of test and train was created using cbind.
* The two test and train merged data frames were then rbinded together into one flat file.  The rows were sorted by subject and then renumbered.
* A list of column names for keeping was grep'ed from the flat file.  Sought patterns were "mean()" and "std()".
* A new, mean & std only data frame was subsetted out of the flat file using the list of columns generated in the previous step (adding in the subject & activity columns).
* A final tidy data frame was aggregated out of the subsetted data frame, grouping by subject and activity, returning the mean for each group.
* This final tidy data frame was written to the "tidy_data.txt" file.

## Reprint of original data set readme.txt

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
