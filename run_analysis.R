
# Load my helper function
source('~/Dropbox/Coursera/GettingAndCleaningData/helper.R')

# Record this working directory
working_dir <- getwd()

# get UCI HAR dataset (from helper.R)
data_file <- downloadDataset()

# getting the file list (from helper.R)
file_list <- unpackDataset(data_file)

# get the relative X_train path in archive. getFilePath is defined in helper.r
train_path <- getFilePath("X_train", file_list)

# get the relative y_train path in archive
train_path_labels <- getFilePath("/y_train.txt", file_list)

# get the relative train subject list in archive
train_path_subjects <- getFilePath("subject_train.txt", file_list)

# get the relative X_test path in archive
test_path <- getFilePath("X_test", file_list)

# get the relative y_test path in archive
test_path_labels <- getFilePath("/y_test.txt", file_list)

# get the relative test subject list in archive
test_path_subjects <- getFilePath("subject_test.txt", file_list)

# get features list (data headers)
features_path <- getFilePath("features.txt", file_list)

# get activity labels
activity_labels_path <- getFilePath("activity_labels.txt", file_list)

# read the training set (function defined in helper.R)
training_set <- read_handy(train_path, features_path, train_path_labels, activity_labels_path, train_path_subjects)

# read the test set
test_set <- read_handy(test_path, features_path, test_path_labels, activity_labels_path, test_path_subjects)

# Put the two test together (since names are the same)
merged_set <- rbind(training_set, test_set)

# remove un used data frames
rm(training_set)
rm(test_set)

# Extract only mean and stddev columns from data frame
columns_idx <- grep("-mean\\(|-std\\(", names(merged_set), perl=T)
selected_set <- merged_set[, c(1,2,columns_idx)]
rm(merged_set)

