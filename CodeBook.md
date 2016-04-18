#----------------------------------------------------------------------------------
# CodeBook.md
#
# Date: April 17, 2016
# Author: Jack Chen
# Project: Getting and Cleaning Data Course Project 
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
# Sections: 
#	. Source Data and variables
#	. Process
#	. Transformations and related variables
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#	  Source Data and variables
#----------------------------------------------------------------------------------
	. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	. The source data is from experiments that have been carried out with a group of 30 volunteers 
	  within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
	  WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
	  And they are collected through two sets: training and test
	. The data sets are: 

		. features_info.txt: Shows information about the variables used on the feature vector.
		. features.txt: List of all features.
			In this project, we will use only mean/std features
		. activity_labels.txt: Links the class labels with their activity name.
			(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)				
		
		. train/X_train.txt: Training set.
		. train/y_train.txt: Training labels(numeric value only).
		. train/subject_train.txt: Each row identifies the subject who performed the activity. 
		
		. test/X_test.txt: Test set.
		. test/y_test.txt: Test labels(numeric value only).
		. test/subject_test.txt: Each row identifies the subject who performed the activity.


#----------------------------------------------------------------------------------
#	  Process
# 		. Merges the training and the test sets to create one data set.
# 		. Extracts only the measurements on the mean and standard deviation for each measurement.
# 		. Uses descriptive activity names to name the activities in the data set
# 		. Appropriately labels the data set with descriptive activity names.
# 		. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#----------------------------------------------------------------------------------

#----------------------------------------------------------------------------------
#	  Transformations and related variables
#----------------------------------------------------------------------------------
	activity_labels : All activities Labels
	features        : All features names in sequence
	required_feature: boolean vector for project required features
	
	X_test          : Test set data
	y_test          : Test set activity number
	subject_test    : Test set subjects
	test_set        : Test set all with proper descriptive names
	
	X_train         : Training set data
	y_train         : Training set activity number
	subject_train   : Training set subjects
	train_set       : Training set all with proper descriptive names
	
	all_data        : Test and Training set together
	
	melt_data       : Melt data for dcast
	tidy_data       : Final result
	
	tidy_data.csv   : File for uploading


