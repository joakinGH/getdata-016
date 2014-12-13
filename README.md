---
Getting and Cleaning Data Course Project
---

The purpose of this project is to clean a data set. The goal is to prepare tidy data that can be used for later analysis.
In the following, it describes the codebook of the project.

## Overall setps

This R script called run_analysis.R that does the following. 
*	Merges the training and the test sets to create one data set.
*	Appropriately labels the data set with descriptive variable names. 
*	Extracts only the measurements on the mean and standard deviation for each measurement. 
*	Uses descriptive activity names to name the activities in the data set
*	From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Setps of R script
The first step is loads data and merges the training and the test sets to create one data set. Thereafter,  descriptive variable names. In this way; `X.ds1` output is generated.
The second step extracts the measurements on the mean and standard deviation for each measurement. Looking for the measurements on the mean and standard deviation and added the items ["Y", "Subject"].

`extract <- grepl("mean|std",names(DataSet))`

In the third step, it is created a new attribute ´”activity_labels.txt”´, and the data are assigned as factors. Subsequently, it is leveled with the characters loaded.
Finally, it creates a independent tidy data set with the average of each variable for each activity and each subject. And it writes the output file ´"Tidy_UCI_HAR_Dataset.txt"´.

`DataSet.tidy <- aggregate( . ~ Activity + Subject, DataSet, mean)`

## List of variables selected selected for the output file
```{r}
Activity					    Subject
tBodyAcc-mean()-X				tBodyAcc-mean()-Y
tBodyAcc-mean()-Z				tBodyAcc-std()-X
tBodyAcc-std()-Y				tBodyAcc-std()-Z
tGravityAcc-mean()-X			tGravityAcc-mean()-Y
tGravityAcc-mean()-Z			tGravityAcc-std()-X
tGravityAcc-std()-Y				tGravityAcc-std()-Z
tBodyAccJerk-mean()-X			tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z			tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y			tBodyAccJerk-std()-Z
tBodyGyro-mean()-X				tBodyGyro-mean()-Y
tBodyGyro-mean()-Z				tBodyGyro-std()-X
tBodyGyro-std()-Y				tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X		    tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z		    tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y			tBodyGyroJerk-std()-Z
tBodyAccMag-mean()				tBodyAccMag-std()
tGravityAccMag-mean()			tGravityAccMag-std()
tBodyAccJerkMag-mean()			tBodyAccJerkMag-std()
tBodyGyroMag-mean()				tBodyGyroMag-std()
tBodyGyroJerkMag-mean()			tBodyGyroJerkMag-std()
fBodyAcc-mean()-X				fBodyAcc-mean()-Y
fBodyAcc-mean()-Z				fBodyAcc-std()-X
fBodyAcc-std()-Y				fBodyAcc-std()-Z
fBodyAcc-meanFreq()-X			fBodyAcc-meanFreq()-Y
fBodyAcc-meanFreq()-Z			fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y			fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X			fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z			fBodyAccJerk-meanFreq()-X
fBodyAccJerk-meanFreq()-Y		fBodyAccJerk-meanFreq()-Z
fBodyGyro-mean()-X				fBodyGyro-mean()-Y
fBodyGyro-mean()-Z		        fBodyGyro-std()-X
fBodyGyro-std()-Y				fBodyGyro-std()-Z
fBodyGyro-meanFreq()-X			fBodyGyro-meanFreq()-Y
fBodyGyro-meanFreq()-Z			fBodyAccMag-mean()
fBodyAccMag-std()				fBodyAccMag-meanFreq()
fBodyBodyAccJerkMag-mean()		fBodyBodyAccJerkMag-std()
fBodyBodyAccJerkMag-meanFreq()	fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()			fBodyBodyGyroMag-meanFreq()
fBodyBodyGyroJerkMag-mean()		fBodyBodyGyroJerkMag-std()
fBodyBodyGyroJerkMag-meanFreq()		
```
The description of each of the features are available in the file "features_info.txt" of initial dataset "UCI HAR Dataset".		


