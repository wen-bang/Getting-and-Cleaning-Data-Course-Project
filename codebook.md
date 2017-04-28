# Below is the table for all files used in the project.


| Files Names (.txt) | Data Sets in R |  Dimension  |
|     :---:      | :---:      | :---:      |
| features      | feature | 561*2 |
| activity_labels      | activity      |   6*1 |
| X_train |      train |  7352*561   |
| X_test |  test | 2947*561|
| subject_train| train_subject |  7352*1|
|subject_test| test_subject| 2947*1 |
|y_train| train_activity| 7352*1 |
|y_test| test_activity| 2947*1 |


# Below is the table for the new data sets created after cleaning and analysing the raw data.
| Data Sets in R |  Dimension  | Description
|     :---:      | :---:      | :---:      |
| DATA      |   10299*563 | Merge from the last 6 data sets from above table (Qestion 1) |
| DATA_left |   10299*81| Extracts only the measurements on the mean and standard deviation for each measurement (Q2) |
| clean_data      | 180*81      |  Group by Activity and Subject, then summarize all features by mean (Question 5)  |

## Notice that if you read "clean_data.txt" into R, then dimension would be 181*81 rather than 180*81 since it automatically add V1 to V81 to this.