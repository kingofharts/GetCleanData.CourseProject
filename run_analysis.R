# NPH/KingofHarts Submission for 'Getting and Cleaning Data' Course
# Project due end of the third week of the course.
#
# Please see the README.md at
# 
# https://github.com/kingofharts/GetCleanData.CourseProject/
# 
# for more information.



# 1) Download, unzip the data, dump the zip file.

download.file(
           "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ",
           "data.zip",
           mode="wb"
             )

unzip(
            zipfile = "data.zip",
            overwrite = TRUE,
      )

file.remove(
            "data.zip"
      )


# 2) Move files into environment as data frames, name columns

variables <- data.frame(read.table("UCI HAR Dataset/features.txt"))

activities <- data.frame(read.table("UCI HAR Dataset/activity_labels.txt"))

names(activities)[1] <- "activity code"

names(activities)[2] <- "activity"

X_test <- data.frame(read.table("UCI HAR Dataset/test/X_test.txt"))

names(X_test) <- variables[,2]

y_test <- data.frame(read.table("UCI HAR Dataset/test/y_test.txt"))

names(y_test) <- "activity code"

X_train <- data.frame(read.table("UCI HAR Dataset/train/X_train.txt"))

names(X_train) <- variables[,2]

y_train <- data.frame(read.table("UCI HAR Dataset/train/y_train.txt"))

names(y_train) <- "activity code"

subject_test <- data.frame(read.table("UCI HAR Dataset/test/subject_test.txt"))

names(subject_test) <- "subject"

subject_train <- data.frame(read.table("UCI HAR Dataset/train/subject_train.txt"))

names(subject_train) <- "subject"


# 3) Swap numeric activity codes for character activity descriptions

require(plyr)

train.activities <- join(y_train, activities, by = "activity code")

y_train[,1] <- train.activities[,2]

names(y_train)[1] <- "activity"

test.activities <- join(y_test, activities, by = "activity code")

y_test[,1] <- test.activities[,2]

names(y_test)[1] <- "activity"


# 4) Condense the data frames into 1 test and 1 train

total.test <- cbind(subject_test,y_test,X_test)

total.train <- cbind(subject_train,y_train,X_train)


# 5) Merger test and train into final pooled, labeled, and named set

flat_data <- rbind(total.test, total.train)

flat_data <- flat_data[with(flat_data,order(flat_data$subject)),]

row.names(flat_data) <- 1:nrow(flat_data)


# 6) Clear out the cluttered environment

remove(X_test,X_train,activities,subject_test,subject_train,
       test.activities,total.test,total.train,train.activities,
       variables,y_test,y_train)


# 7) Get list of columns to use for Mean & Standard Deviation Only data frame

columns <- sort(
            c(
                  1,
                  2,
                  grep(
                        pattern="mean()",
                        names(flat_data),
                        fixed=TRUE),
                  grep(
                        pattern="std()",
                        names(flat_data),
                        fixed=TRUE)),
            decreasing = FALSE)


# 8) Create Mean & Standard Deviation Only data frame

data_mean_stddev_only <- subset(
                              flat_data,
                              select = columns)

remove(columns,flat_data)


# 9) Reduce Mean & Standard Deviation Only data frame to final, tidy
# frame with means of each variable by subject & activity

tidy_frame <- aggregate(
                        x=data_mean_stddev_only,
                        by=list(data_mean_stddev_only$subject,data_mean_stddev_only$activity),
                        FUN="mean")

tidy_frame <- tidy_frame[,
                        !(names(tidy_frame)
                        %in% c("subject","activity"))]

names(tidy_frame)[1] <- "subject"

names(tidy_frame)[2] <- "activity"

remove(data_mean_stddev_only)


# 10) Generate .txt file of tiday data frame

write.table(
      x = tidy_frame,
      file = "tidy_data.txt",
      append = FALSE,
      quote = FALSE,
      row.names = FALSE,
      col.names = TRUE,
      )