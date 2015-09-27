## STEP 1: First individually merge the training and the test datasets and then combine them to create one single data set
library(reshape2)

# read the individual subject data, measurement & labels data into data frames for training data sets
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# add column name for subject files
names(subject_train) <- "subject_ID"

# add column names for measurement files
featureNames <- read.table("./UCI HAR Dataset/features.txt")
names(X_train) <- featureNames$V2

# add column name for label files
names(Y_train) <- "activity"

# combine files of training details into one dataset
trainData <- cbind(subject_train, Y_train, X_train)


# read the individual subject data, measurement & labels data into data frames for test data sets 
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")


X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# add column name for subject files

names(subject_test) <- "subject_ID"


# add column names for measurement files
names(X_test) <- featureNames$V2


# add column name for label files

names(Y_test) <- "activity"

# combine Test data files into one dataset

testData <- cbind(subject_test, Y_test, X_test)

# Combine the Training and Test Datasets
combined <- rbind(trainData, testData)



## STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement
# determine which columns contain "mean()" or "std()"
meanstdcols <- grepl("mean\\(\\)", names(combined)) |grepl("std\\(\\)", names(combined))


# ensure that we also keep the subjectID and activity columns
meanstdcols[1:2] <- TRUE


# remove unnecessary columns
combined <- combined[, meanstdcols]

## STEP 3: Uses descriptive activity names to name the activities in the data set

## STEP 4: Appropriately label the data set with descriptive activity names


# convert the activity column from integer to factor
combined$activity <- factor(combined$activity, labels=c("Walking",
                                                        "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))



## STEP 5: Creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.


# create the tidy data set
melted <- melt(combined, id = c("subject_ID","activity"))
tidy <- dcast(melted, subject_ID+activity ~ variable, mean)


# write the tidy data set to a file 
# this file is then uploaded as .txt
write.csv(tidy, "tidy.csv", row.names=FALSE)
