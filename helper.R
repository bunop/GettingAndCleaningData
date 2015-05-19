
# An helper file to do some stuff

# Donwload uci har dataset if needed
downloadDataset <- function(directory=tempdir()) {
    # This is the data url of an archive zip
    data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

    # This is the name of the downloaded file
    data_file <- file.path(directory, "uci_har_dataset.zip")

    # Download data in a temporary directory if needed
    if (! file.exists(data_file)) {
        cat(data_file, "doesn't exists. Downloading it into", tempdir(), "...")
        download.file(data_url, data_file, method = "curl")
        cat("Done!")
    }

    #return data_file path
    return(data_file)
}

# Unpack data if needed
unpackDataset <- function(data_file, directory=tempdir()) {
    file_list <- unzip(data_file, list = T)

    # Try to determine if data_file is already unpacked
    # (check if the first element in file list exists in temporay directory)
    if (! file.exists(file.path(directory, file_list[1,1]))) {
        cat("Unzipping", data_file, "into", directory, "...")
        unzip(data_file, exdir=directory)
    }

    #return the file lista dataframe
    return(file_list)
}

# A function to get file path by givin' file name
getFilePath <- function(name, file_list, directory=tempdir()) {
    idx <- grep(name, file_list$Name)
    file_name <- file_list$Name[idx]
    file_path <- file.path(directory, file_name)
}


#define a function to get a label from a number. Use activity label to get labels
Activity <- function(x = data.frame()) {
    init <- function(activity_file) {
        x <<- read.table(activity_file)
    }

    getLabel <- function(number) {
        x[which(x$V1==number),2]
    }

    # return the two methods
    list(init = init, getLabel = getLabel)
}

# Read csv and return a data frame
read_handy <-function(inputfile, header_file, label_file, activity_file) {
    # Try to handle memory in efficient way. Probe inputfile
    probe <- read.table(inputfile, nrows=100);

    # probe column classes
    classes <- sapply(probe, class);

    # Now load efficiently all data. comment.char is empty cause there are no comments
    data <- read.table(inputfile, colClasses = classes, comment.char = "");

    # Non set column names from header_file (eg. features.txt)
    colNames <- read.table(header_file, colClasses = c("NULL", "character"));

    # Transpose names
    colNames <- t(colNames);

    # Set header to table
    colnames(data) <- colNames;

    # Now set row activities label
    rowNames <- read.table(label_file)

    # label this column
    colnames(rowNames) <- c("Activity")

    # Add this column on the left
    data <- cbind(rowNames, data)

    # Get a kind of activity class. This is a function that I declared upper in this file
    activity <- Activity()
    activity$init(activity_file)

    # Now trasform activity levels in activity names
    data$Activity <- sapply(data$Activity, activity$getLabel)

    # Explicit return data
    return (data);

}

