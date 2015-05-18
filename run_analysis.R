
# Load my helper function
source('~/Dropbox/Coursera/GettingAndCleaningData/helper.R')

# Record this working directory
working_dir <- getwd()

# This is the data url of an archive zip
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# This is the name of the downloaded file
data_file <- file.path(tempdir(), "uci_har_dataset.zip")

# Download data in a temporary directory if needed
if (! file.exists(data_file)) {
    cat(data_file, "doesn't exists. Downloading it into", tempdir(), "...")
    download.file(data_url, data_file, method = "curl")
    cat("Done!")
}

# getting the file list
file_list <- unzip(data_file, list = T)

# Try to determine if data_file is already unpacked
# (check if the first element in file list exists in temporay directory)
if (! file.exists(file.path(tempdir(), file_list[1,1]))) {
    cat("Unzipping", data_file, "into", tempdir(), "...")
    unzip(data_file, exdir=tempdir())
}

# get the relative X_train path in archive
idx <- grep("X_train", file_list$Name)
train_file <- file_list$Name[idx]
train_path <- file.path(tempdir(), train_file)

# get the relative y_train path in archive
idx <- grep("/y_train.txt", file_list$Name)
train_file_labels <- file_list$Name[idx]
train_path_labels <- file.path(tempdir(), train_file_labels)

# get the relative X_test path in archive
idx <- grep("X_test", file_list$Name)
test_file <- file_list$Name[idx]
test_path <- file.path(tempdir(), test_file)

# get the relative y_test path in archive
idx <- grep("/y_test.txt", file_list$Name)
test_file_labels <- file_list$Name[idx]
test_path_labels <- file.path(tempdir(), test_file_labels)

# get features list (data headers)
idx <- grep("features.txt", file_list$Name)
features_file <- file_list$Name[idx]
features_path <- file.path(tempdir(), features_file)

# get activity labels
idx <- grep("activity_labels.txt", file_list$Name)
activity_labels <- file_list$Name[idx]
activity_labels_path <- file.path(tempdir(), activity_labels)

# read the training set
training_set <- read_handy(train_path, features_path, train_path_labels, activity_labels_path)

# read the test set
test_set <- read_handy(test_path, features_path, test_path_labels, activity_labels_path)
