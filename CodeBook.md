
Study design
============

The data present in the Human Activity Recognition Using Smartphones Data Set come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

More information can be found [here](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names)

By sourcing `run_analysis.R` inside R evironment, data are downloaded from [UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) dataset in a `.zip` file in a temporary directory. Then files are unpacked and *train* and *test* dataset are reconstructed by loading the `X_train.txt` and `X_test.txt` file; Columns were labeled with `features.txt` file for each of the dataset. Activities are merged to *train* and *test* set dataset by adding `y_train.txt` and `y_test.txt` as a new column. Subject are added in the same way by adding `subject_train.txt`  and `subject_test.txt` as a new column on *train* and *test* dataset respectiveley. Then `activity_labels.txt` was used to replace the *activity id* with its appropriate label. Then *train* and *test* dataset were merged by rows and only the measurements which column name contain *mean* or *std* where extracted. Finally a *tidy dataset* was created with the average of each variable for each activity and each subject. This *tidy dataset* was dumped in the `tidy_dataset.txt` file.

Code book
=========

Here I describe each column and its value

N.  | Name  | Value/units
--------- | ----- | -----------
1 | Subject   | identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
2 | Activity | the performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) 
3 | tBodyAcc.mean...X | average of timed body linear acceleration signal on vector X
4 | tBodyAcc.mean...Y | average of timed body linear acceleration signal on vector Y
5 | tBodyAcc.mean...Z | average of timed body linear acceleration signal on vector Z
6 | tGravityAcc.mean...X | average of timed gravity acceleration signal on vector X
7 | tGravityAcc.mean...Y | average of timed gravity acceleration signal on vector Y
8 | tGravityAcc.mean...Z | average of timed gravity acceleration signal on vector Z
9 | tBodyAccJerk.mean...X | average of timed body linear acceleration Jerk signal on vector X
10 | tBodyAccJerk.mean...Y | average of timed body linear acceleration Jerk signal on vector Y
11 | tBodyAccJerk.mean...Z | average of timed body linear acceleration Jerk signal on vector Z
12 | tBodyGyro.mean...X | average of timed body gyroscope signal on vector X
13 | tBodyGyro.mean...Y | average of timed body gyroscope signal on vector Y
14 | tBodyGyro.mean...Z | average of timed body gyroscope signal on vector Z
15 | tBodyGyroJerk.mean...X | average of timed body gyroscope Jerk signal on vector X
16 | tBodyGyroJerk.mean...Y | average of timed body gyroscope Jerk signal on vector Y
17 | tBodyGyroJerk.mean...Z | average of timed body gyroscope Jerk signal on vector Z
18 | tBodyAccMag.mean.. | average of timed body acceleration signal magitude
19 | tGravityAccMag.mean.. | average of timed gravity acceleration signal magitude
20 | tBodyAccJerkMag.mean.. | average of timed body acceleration Jerk signal magitude
21 | tBodyGyroMag.mean.. | average of timed body gyroscope signal magitude
22 | tBodyGyroJerkMag.mean.. | average of timed body gyroscope Jerk signal magitude
23 | fBodyAcc.mean...X | average of timed body linear acceleration frequency signal on vector X
24 | fBodyAcc.mean...Y | average of timed body linear acceleration frequency signal on vector Y
25 | fBodyAcc.mean...Z | average of timed body linear acceleration frequency signal on vector Z
26 | fBodyAcc.meanFreq...X | 
27 | fBodyAcc.meanFreq...Y | 
28 | fBodyAcc.meanFreq...Z | 
29 | fBodyAccJerk.mean...X | 
30 | fBodyAccJerk.mean...Y | 
31 | fBodyAccJerk.mean...Z | 
32 | fBodyAccJerk.meanFreq...X | 
33 | fBodyAccJerk.meanFreq...Y | 
34 | fBodyAccJerk.meanFreq...Z | 
35 | fBodyGyro.mean...X | 
36 | fBodyGyro.mean...Y | 
37 | fBodyGyro.mean...Z | 
38 | fBodyGyro.meanFreq...X | 
39 | fBodyGyro.meanFreq...Y | 
40 | fBodyGyro.meanFreq...Z | 
41 | fBodyAccMag.mean.. | 
42 | fBodyAccMag.meanFreq.. | 
43 | fBodyBodyAccJerkMag.mean.. | 
44 | fBodyBodyAccJerkMag.meanFreq.. | 
45 | fBodyBodyGyroMag.mean.. | 
46 | fBodyBodyGyroMag.meanFreq.. | 
47 | fBodyBodyGyroJerkMag.mean.. | 
48 | fBodyBodyGyroJerkMag.meanFreq.. | 
49 | angle.tBodyAccMean.gravity. | 
50 | angle.tBodyAccJerkMean..gravityMean. | 
51 | angle.tBodyGyroMean.gravityMean. | 
52 | angle.tBodyGyroJerkMean.gravityMean. | 
53 | angle.X.gravityMean. | 
54 | angle.Y.gravityMean. | 
55 | angle.Z.gravityMean. | 
56 | tBodyAcc.std...X | 
57 | tBodyAcc.std...Y | 
58 | tBodyAcc.std...Z | 
59 | tGravityAcc.std...X | 
60 | tGravityAcc.std...Y | 
61 | tGravityAcc.std...Z | 
62 | tBodyAccJerk.std...X | 
63 | tBodyAccJerk.std...Y | 
64 | tBodyAccJerk.std...Z | 
65 | tBodyGyro.std...X | 
66 | tBodyGyro.std...Y | 
67 | tBodyGyro.std...Z | 
68 | tBodyGyroJerk.std...X | 
69 | tBodyGyroJerk.std...Y | 
70 | tBodyGyroJerk.std...Z | 
71 | tBodyAccMag.std.. | 
72 | tGravityAccMag.std.. | 
73 | tBodyAccJerkMag.std.. | 
74 | tBodyGyroMag.std.. | 
75 | tBodyGyroJerkMag.std.. | 
76 | fBodyAcc.std...X | 
77 | fBodyAcc.std...Y | 
78 | fBodyAcc.std...Z | 
79 | fBodyAccJerk.std...X | 
80 | fBodyAccJerk.std...Y | 
81 | fBodyAccJerk.std...Z | 
82 | fBodyGyro.std...X | 
83 | fBodyGyro.std...Y | 
84 | fBodyGyro.std...Z | 
85 | fBodyAccMag.std.. | 
86 | fBodyBodyAccJerkMag.std.. | 
87 | fBodyBodyGyroMag.std.. | 
88 | fBodyBodyGyroJerkMag.std.. | 
