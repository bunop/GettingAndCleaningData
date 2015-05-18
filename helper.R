
# An helper file to do some stuff

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

