
# An helper file to do some stuff

# Read csv and return a data frame
read_handy <-function(inputfile, header_file) {
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

    # Explicit return data
    return (data);

}
