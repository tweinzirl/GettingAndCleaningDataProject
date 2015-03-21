#!/usr/bin/Rscript

#activity labels
activityLabels <- read.table('UCI HAR Dataset/activity_labels.txt')

#columns to extract
columnsToKeep <- c(1,2,3,4,5,6,41,42,43,44,45,46,  81,82,83,84,85,86,  121,122,123,124,125,126,  161,162,163,164,165,166,  201,202, 214,215, 227,228, 240,241, 253,254, 266,267,268,269,270,271,  345,346,347,348,349,350,  424,425,426,427,428,429,  503,504,  516,517,  529,530,  542,543)

#column names of intermediate data frame
colNames <- c('tBodyAcc-mean-X','tBodyAcc-mean-Y','tBodyAcc-mean-Z','tBodyAcc-std-X','tBodyAcc-std-Y','tBodyAcc-std-Z', 'tGravityAcc-mean-X','tGravityAcc-mean-Y','tGravityAcc-mean-Z','tGravityAcc-std-X','tGravityAcc-std-Y','tGravityAcc-std-Z','tBodyAccJerk-mean-X','tBodyAccJerk-mean-Y','tBodyAccJerk-mean-Z','tBodyAccJerk-std-X','tBodyAccJerk-std-Y','tBodyAccJerk-std-Z','tBodyGyro-mean-X','tBodyGyro-mean-Y','tBodyGyro-mean-Z','tBodyGyro-std-X','tBodyGyro-std-Y','tBodyGyro-std-Z','tBodyGyroJerk-mean-X','tBodyGyroJerk-mean-Y','tBodyGyroJerk-mean-Z','tBodyGyroJerk-std-X','tBodyGyroJerk-std-Y','tBodyGyroJerk-std-Z','tBodyAccMag-mean','tBodyAccMag-std','tGravityAccMag-mean','tGravityAccMag-std','tBodyAccJerkMag-mean','tBodyAccJerkMag-std','tBodyGyroMag-mean','tBodyGyroMag-std','tBodyGyroJerkMag-mean','tBodyGyroJerkMag-std','fBodyAcc-mean-X','fBodyAcc-mean-Y','fBodyAcc-mean-Z','fBodyAcc-std-X','fBodyAcc-std-Y','fBodyAcc-std-Z','fBodyAccJerk-mean-X','fBodyAccJerk-mean-Y','fBodyAccJerk-mean-Z','fBodyAccJerk-std-X','fBodyAccJerk-std-Y','fBodyAccJerk-std-Z','fBodyGyro-mean-X','fBodyGyro-mean-Y','fBodyGyro-mean-Z','fBodyGyro-std-X','fBodyGyro-std-Y','fBodyGyro-std-Z','fBodyAccMag-mean','fBodyAccMag-std','fBodyBodyAccJerkMag-mean','fBodyBodyAccJerkMag-std','fBodyBodyGyroMag-mean','fBodyBodyGyroMag-std','fBodyBodyGyroJerkMag-mean','fBodyBodyGyroJerkMag-std','Activity','Subject')


#column names of final data frame
colNamesF <- c('Subject','Activity','tBodyAcc-mean-X','tBodyAcc-mean-Y','tBodyAcc-mean-Z','tBodyAcc-std-X','tBodyAcc-std-Y','tBodyAcc-std-Z', 'tGravityAcc-mean-X','tGravityAcc-mean-Y','tGravityAcc-mean-Z','tGravityAcc-std-X','tGravityAcc-std-Y','tGravityAcc-std-Z','tBodyAccJerk-mean-X','tBodyAccJerk-mean-Y','tBodyAccJerk-mean-Z','tBodyAccJerk-std-X','tBodyAccJerk-std-Y','tBodyAccJerk-std-Z','tBodyGyro-mean-X','tBodyGyro-mean-Y','tBodyGyro-mean-Z','tBodyGyro-std-X','tBodyGyro-std-Y','tBodyGyro-std-Z','tBodyGyroJerk-mean-X','tBodyGyroJerk-mean-Y','tBodyGyroJerk-mean-Z','tBodyGyroJerk-std-X','tBodyGyroJerk-std-Y','tBodyGyroJerk-std-Z','tBodyAccMag-mean','tBodyAccMag-std','tGravityAccMag-mean','tGravityAccMag-std','tBodyAccJerkMag-mean','tBodyAccJerkMag-std','tBodyGyroMag-mean','tBodyGyroMag-std','tBodyGyroJerkMag-mean','tBodyGyroJerkMag-std','fBodyAcc-mean-X','fBodyAcc-mean-Y','fBodyAcc-mean-Z','fBodyAcc-std-X','fBodyAcc-std-Y','fBodyAcc-std-Z','fBodyAccJerk-mean-X','fBodyAccJerk-mean-Y','fBodyAccJerk-mean-Z','fBodyAccJerk-std-X','fBodyAccJerk-std-Y','fBodyAccJerk-std-Z','fBodyGyro-mean-X','fBodyGyro-mean-Y','fBodyGyro-mean-Z','fBodyGyro-std-X','fBodyGyro-std-Y','fBodyGyro-std-Z','fBodyAccMag-mean','fBodyAccMag-std','fBodyBodyAccJerkMag-mean','fBodyBodyAccJerkMag-std','fBodyBodyGyroMag-mean','fBodyBodyGyroMag-std','fBodyBodyGyroJerkMag-mean','fBodyBodyGyroJerkMag-std')

#read test set
#subject_test.txt the date, the first 6 col are the mean and std
testData <- read.table('UCI HAR Dataset/test/X_test.txt')
#y_test.txt the subjects
testActivity <- read.table('UCI HAR Dataset/test/y_test.txt')
#subject_test.txt subject number
testSubject <- read.table('UCI HAR Dataset/test/subject_test.txt')
#these are in parallel, simply read separately and combin into one df

#replace activity labels
testActivity[testActivity==1] = as.character(activityLabels[1,2])
testActivity[testActivity==2] = as.character(activityLabels[2,2])
testActivity[testActivity==3] = as.character(activityLabels[3,2])
testActivity[testActivity==4] = as.character(activityLabels[4,2])
testActivity[testActivity==5] = as.character(activityLabels[5,2])
testActivity[testActivity==6] = as.character(activityLabels[6,2])

#data frame for test/ directory, keep columns that are mean/std/training activity/test subject
testdf <- data.frame(testData[,columnsToKeep],testActivity,testSubject)
cat(sprintf("test df dim %s\n",dim(testdf)))

#repeat for train set
trainData <- read.table('UCI HAR Dataset/train/X_train.txt')
#y_train.txt the subjects
trainActivity <- read.table('UCI HAR Dataset/train/y_train.txt')
#subject_train.txt subject number
trainSubject <- read.table('UCI HAR Dataset/train/subject_train.txt')
#these are in parallel, simply read separately and combin into one df

#replace activity labels
trainActivity[trainActivity==1] = as.character(activityLabels[1,2])
trainActivity[trainActivity==2] = as.character(activityLabels[2,2])
trainActivity[trainActivity==3] = as.character(activityLabels[3,2])
trainActivity[trainActivity==4] = as.character(activityLabels[4,2])
trainActivity[trainActivity==5] = as.character(activityLabels[5,2])
trainActivity[trainActivity==6] = as.character(activityLabels[6,2])

#data frame for train/ directory, keep columns that are mean/std/training activity/test subject
traindf <- data.frame(trainData[,columnsToKeep],trainActivity,trainSubject)
cat(sprintf("train df dim %s\n",dim(traindf)))

#merge the datasets and set the column names
masterdf <- merge(testdf,traindf,all.x=1,all.y=1)
cat(sprintf("master df dim %s\n",dim(masterdf)))
names(masterdf) <- colNames
print(names(masterdf))

#isolate average of each variable (including std) for all subject, ectivity combinations
uniqueSubject <- unique(masterdf$Subject)
uniqueActivity <- unique(masterdf$Activity)
NRows = length(uniqueSubject) * length(uniqueActivity)
NCols = 68

finaldf<-as.data.frame(matrix(seq(NCols*NRows), nrow=NRows, ncol=NCols))
count<-1

for (i in uniqueSubject) {
    for (j in uniqueActivity) {

        cat(sprintf("%s  %s\n", i,j))
        arg <- which(masterdf$Subject==i & masterdf$Activity==j)
        print(length(arg))
        row <- c(i,j,colMeans(masterdf[arg,1:66]))
        finaldf[count,] <- row
        count= count+1
    }
}

dim(finaldf)
names(finaldf) <- colNamesF

write.table(finaldf,file='output.txt',row.name=F,quote=F)
#gyro accelartion in radians/sec

#other accelerations in standard gravity units 'g'
