Getting and Cleaning Data Course Project
========================================================

...

Project Instruction
-------------------------
You should create one R script called run_analysis.R that does the following. 

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

R and OS
-------------------------
 The code is written in RStudio 0.98.507 (powered by R version 3.1.1 (2014-07-10)).  
 OS: Microsoft Win 7 (x86)  
 
Data
-------------------------
The data, represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Transformations on the data set
-------------------------
1. Importing variable names from 'features.txt'
2. Importing elements of "TEST" data set from 'test' folder (ignore content of 'Inertial Signals' folder)
 and naming the columns (this naming is a part of STEP 4 of the project).    
3. Creating "Test" Data Set  
4. Importing elements of "TRAIN" data set from 'train' folder (ignore content of 'Inertial Signals' folder) and naming the columns (this naming is a part of STEP 4 of the project).
5. Creating "TRAIN" Data Set  
6. Merging the "Test" and the "TRAIN" data sets to create one data set (STEP 1 of the project).  
7. Extracting only the measurements on the mean and standard deviation for each measurement by using 'grep' function (STEP 2 of the project).
8. Useing descriptive activity names (available in 'activity_labels.txt' file) to name the activities in the data set (STEP 3 of the project). 
9. Createing a second,independent tidy data set with the average of each variable for each activity and each subject by using 'melt' and 'dcast' functions (STEP 5 of the project).  




Variables / Names of Columns / Feature Selection 
-----------------

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  


-------------------------
License:
-------------------------

Original dataset and text of 'Feature Selection':  
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  

Project Instruction:  
Getting and Cleaning Data Course, www.coursera.org, 2014  

R Script:  
Davood Qorbani (www.qorbani.info), SEP 2014
