==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

Objective- Create a script that combines two different data sets- training and test data, extract relevant measurements on the mean and standard deviation for each measurement and prepare a tidy dataset that can be used.

==================================================================
 
How and What the script does?

==================================================================
1) The run_analysis script first combines the data in text files for each of these datasets to prepare a consolidated single dataset for each of test and training data. 
2) It provdies relevant column names to the datasets before combining them so that the final data is usable and standardized.
3) Then the two individual datasets are rbinded together 
4) From this consolidated data, measurements on the mean and standard deviation are extracted.
5) Unnecessary columns are then removed as part of tidying the data further
6)Descriptive activity names are provdied to the dataset
7) Activity column is converted to factors to indicate the different levels of activity- walking, walking upstirs etc.
8) Then create a second, independent tidy data set with the average of each variable for each activity and each subject.
9) To use melt function we added library for reshape2
10) The final tidy dataet is written out in .csv format by the script