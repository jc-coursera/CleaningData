#----------------------------------------------------------------------------------
# run_analysis.R :
#----------------------------------------------------------------------------------
# 	. Merges the training and the test sets to create one data set.
# 	. Extracts only the measurements on the mean and standard deviation for each measurement.
# 	. Uses descriptive activity names to name the activities in the data set
# 	. Appropriately labels the data set with descriptive feature names.
# 	. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#----------------------------------------------------------------------------------
if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

# Get activity labels
activity_labels <- read.table("./Cleandata_assignment/activity_labels.txt")[,2]

# Get features
features <- read.table("./Cleandata_assignment/features.txt")[,2]

# Get the measurements on the mean and standard deviation for each measurement.
required_feature <- grepl("mean|std", features)

# Process X_test & y_test data.
X_test <- read.table("./Cleandata_assignment/test/X_test.txt")
y_test <- read.table("./Cleandata_assignment/test/y_test.txt")
subject_test <- read.table("./Cleandata_assignment/test/subject_test.txt")

#Label the data set with descriptive feature names
names(X_test) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
X_test = X_test[,required_feature]

# Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("ActivityID", "Activity")
names(subject_test) = "Subject"

# Bind test data
test_set <- cbind(y_test, as.data.table(subject_test),  X_test)

# Load and process X_train & y_train data.
X_train <- read.table("./Cleandata_assignment/train/X_train.txt")
y_train <- read.table("./Cleandata_assignment/train/y_train.txt")

subject_train <- read.table("./Cleandata_assignment/train/subject_train.txt")

#Label the data set with descriptive feature names
names(X_train) = features

# Extract only the measurements on the mean and standard deviation for each measurement.
X_train = X_train[,required_feature]

# Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("ActivityID", "Activity")
names(subject_train) = "Subject"

# Bind train data
train_set <- cbind(y_train, as.data.table(subject_train), X_train)

# Merge test and train data
all_data = rbind(test_set, train_set)

# Get melt data
id_labels   = c("ActivityID", "Activity", "Subject")
data_labels = setdiff(colnames(all_data), id_labels)
melt_data      = melt(all_data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, Activity + Subject ~ variable, mean)

# Create uploading file
write.csv(tidy_data, file = "./Cleandata_assignment/tidy_data.csv", row.names=F)
