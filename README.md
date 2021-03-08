# GETTING AND CLEANING DATA HOMEWORK
Homework for the "Getting and Cleaning Data" course on Coursera

## PURPOSE
The purpose of this project is to collect, work with, and clean a data set.
Specifically the student must :
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## DATA SET
The data set used is result from an experiment of human activity recognition 
using smartphones's gyrometer and accelerometers.

The data is taken from :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The details of the data contained in the dataset are located within the "README.txt", "features.txt", "features_info.txt" and "activity_labels.txt" files located in the original dataset folder

The details of the experiment are described in this paper :

*Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.*

## REPOSITORY
Apart from this README, this repository contains :
- "UCI_HAR_tidy_dataset.csv" : a tidy data set as described above. 
- "run_analysis.R"           : the script used to get, clean the data and perform the analysis. 
- "CodeBook.md"              : a code book that describes the variables, the data, and transformations performed to clean up the data. Also explains how the script work.
