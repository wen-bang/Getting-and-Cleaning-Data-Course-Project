# Below is the table for all files used in the project.


| Files Names (.txt) | Data Sets in R |  Dimension  |
|     :---:      | :---:      | :---:      |
| features      | featureNames | 561*2 |
| activity_labels      | activityNames      |   6*1 |
| X_train |      trainData |  7352*561   |
| X_test |  testData | 2947*561|
| subject_train| trainPeople |  7352*1|
|subject_test| testPeople| 2947*1 |
|y_train| trainActivity| 7352*1 |
|y_test| testActivity| 2947*1 |


# Below is the table for the new data sets created after cleaning and analysing the raw data.
| Data Sets in R |  Dimension  | Description
|     :---:      | :---:      | :---:      |
| DATA      |   10299*563 | Merge from the last 6 data sets from above table (Qestion 1) |
| Measure |    561*2 |  Extracts the mean and standard deviation for each measurement (Qestion 2)   |
| DATA2      | 180*563      |  Group by Activity and People, then summarize all measurements by mean (Question 5)  |

