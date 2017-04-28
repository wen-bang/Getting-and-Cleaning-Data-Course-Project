# Include the packages
library(plyr)    
library(dplyr)



# Get the raw data from the website if no data in the working directory.
filename <- "getdata_dataset.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip(filename) 
}


# Read data into R and rename them the way easy to understand
feature <- read.table("UCI HAR Dataset/features.txt")
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
train <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")




# Rename the column names 
colnames(train_subject) <- "Subject"
colnames(test_subject) <- "Subject"
colnames(train_activity) <- "Activity"
colnames(test_activity) <- "Activity"





# Now merge the data sets with other infomation data
Train <- cbind(train_subject,train_activity,train)
Test <- cbind(test_subject,test_activity,test)



# Now merge training and testing to get a whole data as Q1 asks
DATA <- rbind(Train,Test)



# Extracts only the measurements on the mean and standard deviation for each measurement (Q2)
# First get the index number of the required measurements in feature file
# Then notice that all the index number of features in DATA are 2 more than their index in feature
# Combine index of measurement required and index for subject and activity (1 and 2)
# Select those columns, that's the data we want 
features_left <- grep(".*mean.*|.*std.*", feature[,2])
index_features_left <- features_left + 2
index_left <- c(1,2,index_features_left)
DATA_left <- select(DATA,index_left)



# Use descriptive activity names to name the activities in DATA_left as Q3 asks
# Compare the number in DATA_left$Activity column to the number in the first column of activity file
# Then pass the descriptive activity name in the second column of activity file to DATA_left
for (i in 1:nrow(DATA_left)) 
{
   for (j in 1:6) {
        if (DATA_left$Activity[i]==activity[[1]][j])
        { DATA_left$Activity[i]<-as.character(activity[[2]][j])}
}
}



# Labels the data set with descriptive variable names as Q4 asks
# Use names in feature file to rename the measurement columns in DATA_left
# Recall that features_left are indices of required measurement in feature file
names(DATA_left)[3:ncol(DATA_left)]<-as.character(feature[[2]][features_left])



# Q5: creates a second, independent tidy data set with the average of each variable for each activity and each person.
# Notice: group by two variables (in class we only see group by one variable)
# Notice: summarize more than one (79) variables (in class we only see summarize one variable)
# So I use summarise_each function to handle summary more than one variable
# I give new descriptive column names to clean_data. (using "paste") 
# At last write clean_data to a text file named "clean_data"
colName <- colnames(DATA_left)[3:ncol(DATA_left)]
name_clean <- sapply("Mean",paste,colName,sep="_")
by_subject_activity <- group_by( DATA_left, Subject, Activity)
clean_data <- summarise_each(by_subject_activity,funs(mean))
colnames(clean_data)[3:ncol(DATA_left)] <- name_clean
write.table(clean_data,"clean_data.txt",row.names=F)
