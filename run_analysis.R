############################################
# Getting and Cleaning Data Course Project #
############################################

# Goals :
# 1 - Merges the training and the test sets to create one data set.
# 2 - Extracts only the measurements on the mean and standard deviation for 
#     each measurement. 
# 3 - Uses descriptive activity names to name the activities in the data set
# 4 - Appropriately labels the data set with descriptive variable names. 
# 5 - From the data set in step 4, creates a second, independent tidy data set 
#     with the average of each variable for each activity and each subject.

library(tibble)
library(dplyr)

# Download and unzip the files
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./UCI_HAR_dataset.zip"))
  download.file(file_url, "./UCI_HAR_dataset.zip", method = "curl")
  unzip("UCI_HAR_dataset.zip")

# Store needed files into data objects :
# Store - Test Batch
subjects_test <- as_tibble(read.table("UCI HAR Dataset/test/subject_test.txt"))
activity_test <- as_tibble(read.table("UCI HAR Dataset/test/y_test.txt"))
variable_test <- as_tibble(read.table("UCI HAR Dataset/test/X_test.txt"))

# Store - Training Batch
subjects_train <- as_tibble(read.table("UCI HAR Dataset/train/subject_train.txt"))
activity_train <- as_tibble(read.table("UCI HAR Dataset/train/y_train.txt"))
variable_train <- as_tibble(read.table("UCI HAR Dataset/train/X_train.txt"))

# Store - Metadata 
# "features.txt" has what will be used for experiments variables names (516 col)
features_tbl <- as_tibble(read.table("UCI HAR Dataset/features.txt"))
namesforcol <- as.character(select(features_tbl, 2)[[1]])

# Merge training and test set together
subjects_all <- bind_rows(subjects_train, subjects_test)
activity_all <- bind_rows(activity_train, activity_test)
variable_all <- bind_rows(variable_train, variable_test)

# Prepare the data
# Prepare - the subject column
subjects_all <- subjects_all %>% rename(subject_id = V1)

# Prepare - the activity column
# A dictionary-like list (used for step3 : activity numbers into words)
activity_dic <- c("1" = "WALKING",
                  "2" = "WALKING_UPSTAIRS",
                  "3" = "WALKING_DOWNSTAIRS",
                  "4" = "SITTING",
                  "5" = "STANDING",
                  "6" = "LAYING")
# Rename the column and convert numers to descriptive word
activity_all <- activity_all %>%
                rename(activity = V1) %>% 
                mutate(activity = activity_dic[activity])


# Prepare - the variable columns
# Rename columns (step 4 requirement) 
colnames(variable_all) <- namesforcol
# select only those with mean and stdev
variable_all <- variable_all %>% select(matches("\\-mean\\(\\)|\\-std\\(\\)"))


# Merge
# Merge subject, label and experiment results together
merged_all <- bind_cols(subjects_all, activity_all, variable_all)

# Analyse
# average of the 66 experiments variables (mean and stdv only) split across the
# subject and the activity. 30 subjects x 6 activities resulting into 180 obs.
result <- merged_all %>%
          group_by(subject_id, activity, .add = TRUE) %>%
          summarise(across(1:66, mean))

# Save the results in a file
write.csv(result, file="UCI_HAR_tidy_dataset.csv", row.names=FALSE)
          





