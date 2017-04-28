# Clean Data From Several Raw Data Sets
In this project, we are given by a bunch of data sets describing activity features of human from Sumsung.
The sets are connected by some variables. To get some summary from the raw data, we need to clean the data first.

## Getting Started
* Include useful packages from R
* Check if the raw data is in the working directory
* Read useful files into R and rename them the way easy to understand 

## Question 1: Merges the training and the test sets to create one data set.
* Rename column names before merging. 
* Merge train data sets with other train information sets by combining their columns.
* Merge test data sets with other test information sets by combining their columns.
* Merge Train and Test by combining their rows to get the whole data set named "DATA".

## Question 2: Extracts only the measurements on the mean and standard deviation for each measurement.
* Use "grep" to collect indices of required measurement (features).
* Extract required columns from "DATA" and name it "DATA_left".

## Question3: Uses descriptive activity names to name the activities in the data set.
loop i through the Activity column in DATA_left and loop j through the first column (number 1 through 6)
in the activity file and rename the DATA_left with specific activity names (second column in activity).

## Question4: Appropriately labels the data set with descriptive variable names.
Rename colnames in DATA_left by feature names in feature file.

## Question5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each person.

Notice in this question, it is asked to group by two variables (in class we only see group by one variable).
Also notice that it is asked to summarize more than one (79) variables (in class we only see summarize one variable).
I use summarise_each function to handle summary more than one variable. After collecting the means (stored in clean_data file), I give new descriptive column 
names to it (using "paste") and write it into "clean_data.txt" file.








