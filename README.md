
Getting and Cleaning Data Course Project
========================================

This repository is my Solution to Coursera Getting And Cleaning data Course project. The goal is to prepare tidy data set from the [HAR data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This repository contains this `README.md` file, `run_analysis.R` script which download the HAR dataset and peforms all the operation to create the tidy dataset, a `helper.r` in which there are some functions needed by `run_analysis.R` in order to work correctly and the `CodeBook.md` that describes the variables, the data, and any transformations or work that you performed to clean up the data. The `tidy_dataset.txt` file is the same upload in Coursera assignment.

## Motivation (from the Coursera Course Project)

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How code works

This code relies on R `dplyr` package, so please install it in order to execute R scripts without errors. Then, to get a tidy dataset from HAR dataset, simply clone this repository:

```sh
$ git clone https://github.com/bunop/GettingAndCleaningData.git
```

You don't need to download HAR dataset, the script will download it for you and will do all the operations on data to get a tidy dataset. In your R session change the current working directory into the directory in which you clone this project with `setwd()`. Simply you have to source `run_analysis.R` with:

```R
source("run_analysis.R")
```

Then the script will download the HAR dataset in a temporary dataset, it will unpack the archive file, it will read file and it will do all the necessary operations to get a `tidy_dataset` data frame and a `tidy_dataset.txt` text file. The `tidy_dataset.txt` is the same uploaded in Coursera Project.

