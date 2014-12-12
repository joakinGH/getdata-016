################################################################################
## 1.- Merges the training and the test sets to create one data set.
## 4.- Appropriately labels the data set with descriptive variable names.

# Read features and delete row names
features <- read.table("UCI HAR Dataset/features.txt", header = F, sep = " " ,
                    stringsAsFactors =F)
features <- features[,-1]

# Test data
X.test <- read.table("UCI HAR Dataset/test/X_test.txt", header = F)
names(X.test) <- features
X.test$Y <- read.table("UCI HAR Dataset/test/y_test.txt", header = F)[,1]
X.test$Subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = F)[,1]

# Train data
X.train <- read.table("UCI HAR Dataset/train/X_train.txt", header = F)
names(X.train) <- features
X.train$Y <- read.table("UCI HAR Dataset/train/y_train.txt", header = F)[,1]
X.train$Subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = F)[,1]

X.ds1 <- rbind.data.frame(X.train, X.test)

################################################################################
##  2.- Extracts only the measurements on the mean and standard deviation 
##      for each measurement.

# Finds the measurements on the mean and standard deviation and added 
# the last items ["Y", "Subject"]
extract <- grepl("mean|std",names(X.ds1))
extract[562] <- TRUE
extract[563] <- TRUE

X.ds2 <- X.ds1[, extract]


################################################################################
##  3.- Uses descriptive activity names to name the activities in the data set 

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = F)

X.ds3<- X.ds2
X.ds3$Activity <- as.factor(X.ds3$Y)
X.ds3$Y <- NULL
levels(X.ds3$Activity) <- activity_labels[,2]


################################################################################
##  5.- Creates a independent tidy data set with the average 
##      of each variable for each activity and each subject.

X.tidy <- aggregate( . ~ Activity + Subject, X.ds3, mean)
write.table(X.tidy,"Tidy_UCI_HAR_Dataset.txt", row.name = F)
