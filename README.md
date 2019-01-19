# GettingandCleaningData-CourseProject

This project contins the analysis steps performed as part of the Coursera Getting and Cleaning Data Course. This is the output for the Course Project assignment.


The run_analysis.R file contains the analysis performed ont the Human Activity Recognition Data study, which is described here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The files usd for the analysis were sourced from here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run_analysis.R script performs the following analysis steps:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The files included in the analysis were as follows:

activity_labels.txt - A file containing the activity_id and Decription for the activities performen by the study subjects
features.txt  - a list of measures (described in features_info.txt) captured as a result of the study
subject_train.txt - Each row identifies the subject, from 1 to 30, who performed the activity for each train sample. 
X_train.txt - dataset for the data from the train subjects
y_train.tx - train lables
subject_test.txt - Each row identifies the subject, from 1 to 30, who performed the activity for each test sample
X_test.txt - dataset for the data from the test subjects
y_testn.tx - test lables


The run_analysis_output.txt contains the resulting output from mergeing the files and aggregating the mean variables and the Standard Deviation Variables for each subject and for each activity. 

The run_analysis_codebook contains the details of the variables used in the analysis. 