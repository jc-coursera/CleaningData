The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later 
analysis. 

The script file run_analysis.R will process the source data( from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
based on the project requirements. 

It will first load the data from both test and training sections, then create a data frame with required features only. 
And then process decriptive values for both activities and data set columns before merge everything together. After that,
it will use dcast to calculate the final result and create it as a separate data set. At the end, it will export the data set 
into a text file. 

For more detailed information, check out the attached run_analysis.R and code book(CodeBook.md).  

