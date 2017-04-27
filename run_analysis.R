# Include the packages
library(plyr)    
library(dplyr)



# Now suppose all text files are in the working directory 
# read them into R and give them new names
featureNames <- read.table("features.txt")
activityNames <- read.table("activity_labels.txt")
trainData <- read.table("X_train.txt")
testData <- read.table("X_test.txt")
trainPeople <- read.table("subject_train.txt")
library(plyr)
library(dplyr)
testPeople <- read.table("subject_test.txt")
trainActivity<-read.table("y_train.txt")
testActivity<-read.table("y_test.txt")



# Rename the column names 
colnames(trainPeople) <- "People"
colnames(testPeople) <- "People"
colnames(trainActivity) <- "Activity"
colnames(testActivity) <- "Activity"



# Now merge the data sets with other infomation data
Train <- cbind(trainPeople,trainActivity,trainData)
Test <- cbind(testPeople,testActivity,testData)


# Now merge training and testing to get a whole data as Q1 asks
DATA <- rbind(Train,Test)



# Extract the measurements on the mean and standard deviation for each measurements as Q2 asks
Measure <- data.frame(meanV=sapply(DATA[,3:563],mean),sdV=sapply(DATA[,3:563],sd))


# Use descriptive activity names to name the activities in DATA as Q3 asks
# Compare the number in DATA$Activity column to the number in the first column of activityNames file
# Then pass the descriptive activity name in the second column of activityNames file to DATA
for (i in 1:nrow(DATA)) 
{
   for (j in 1:6) {
        if (DATA$Activity[i]==activityNames[[1]][j])
        { DATA$Activity[i]<-as.character(activityNames[[2]][j])}
}
}


# Labels the data set with descriptive variable names as Q4 asks
# Use names in featureNames file to rename the column (from 3 to 562) names in DATA
colnames(DATA)[3:563]<-as.character(featureNames[[2]])


# Q5: creates a second, independent tidy data set with the average of each variable for each activity and each person.
# Notice: group by two variables (in class we only see group by one variable)
# Notice: summarize more than one (561) variables (in class we only see summarize one variable)
# So I use summarise_each function to handle summary more than one variable, but it gives me error if I use colnames in DATA
# But if I rename the columns by V1 to V561, it works. That's why I rename them
# After collecting the means we want (stored in DATA2 file), I give new descriptive column names to DATA2. (using "paste") 
colName <-colnames(DATA)[3:563]
colNameData2 <- sapply("Mean",paste,colName,sep="_")
colnames(DATA)[3:563] <- colnames(Test)[3:563]
byPeopleActivity <- group_by( DATA, People, Activity)
DATA2 <- summarise_each(byPeopleActivity,funs(mean))
colnames(DATA2)[3:563] <- colNameData2
write.table(DATA2,"DATA2.txt",row.names=F)
