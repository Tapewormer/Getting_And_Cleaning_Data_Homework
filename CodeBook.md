### CODEBOOK FOR THE "GETTING AND CLEANING DATA" HOMEWORK ###

This file describes the detail of the data used and the transformation applied to the data. See README.txt for more general information.

The data set is taken from :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

###
FILES used by the script are :
# Metadata
- 'features.txt'       : List of all features meaning the type of observations. There are 561 types of observations.
- 'activity_labels.txt': Links the class labels with their activity name. There are 6 physical activities ("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"). The script uses directly a user-created list instead of the actual file.

# Training group
- 'train/X_train.txt'  : Training set with the observations for the training group subjects.The training group consist of 21 subject resulting in 7352 observations.
- 'train/y_train.txt'  : Training labels with the activity for the the training group subjects. The training group consist of 21 subjects resulting in 7352 observations. 
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

# Testing group
- 'test/X_test.txt'    : Test set with the observations for the test group subjects. The test group consist of 9 subjects resulting in 2947 observations.
- 'test/y_test.txt'    : Test labels with the activity for the the test group subjects. The test group consist of 9 subjects resulting in 2947 observations.
- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

(For more details on the files & experimental observations see README.txt file located within the original data folder)
###

###
# SCRIPT - DATA TRANSFORMATION
The script is named "run_analysis.R"

1. After download, each of the 3 files from the training group (X_train, y_train, subject_train) are merged horizontally with its testing group counterpart and stored into 3 tibble objects : subjects_all, activity_all, variable_all
2. subjects_all's only column is renamed "subject_id"
3. activity_all's only column is renamed "activity"
4. activity_all values are transformed from their numeric label to descriptive word (e.g. "1" becomes "WALKING") 
5. variable_all's 561 columns are renamed according to the type of observations they contains as provided by the file "features.txt"
6. variable_all is then reduced to an object containing only the observations related to means and standard deviations resulting into a 66 columns dataframe.
7. Each of the 3 curated objects subjects_all, activity_all, variable_all are merged vertically into a dataframe named
merged_all of dimension (7352+2947) = 10299 rows and (1+1+66) = 68 columns. The first two columns being the subject_id and the type of activity.
8. merged_all is grouped by two factors "subject_id" and "activity". The average of each variable for each activity and each subject is computed. 
9. The result of the computation is stored in a comma separated file named "UCI_HAR_tidy_dataset.csv".  
###





