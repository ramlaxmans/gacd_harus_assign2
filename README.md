# gacd_harus_assign2
GACD_Human Activitiy Recognition Using Smartphones Assignment
This analysis is based on Human Activity Recognition Using Smartphones Dataset Version 1.0
From Readme.txt file we understand the following:
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. "
The dataset included the following files:
=========================================

1. 'README.txt'

2. 'features_info.txt': Shows information about the variables used on the feature vector.

3. 'features.txt': List of all features.

4. 'activity_labels.txt': Links the class labels with their activity name.

5. 'train/X_train.txt': Training set.

6  'train/y_train.txt': Training labels.

7. 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The R script file "run_analysis.R" is used to analyze these files to create a summary dataset. 
Steps invoved in the processing of the experimental data are:

1. Read the above set of files - numbered 3 to 7 ,  into data frames using read.table function
2. From the features file, identify the columns that have std() and mean() 
3. Subset the test and train data for std() and mean() columns identified in the above step.
4. Tidy the header names of std() and mean() columns and retain the column names
5. Add subject id and activity id columns with the test and train data to create the final dataset
6. Add column names to the above dataset to create a labelled dataset
7. Compute the mean values of all the columns of the above dataset
8. Write the summary data of the means to a file harus.txt that contains 30*6*79 [subject*activity*variables]
9. Activity id in the final summary to be converted into activity name.

Note:
1. Ensure that the directory structure for the execution of run_analysis as below:
./proj
  ./test
    subject_test.txt
    X_test.txt
    y_test.txt
  ./train
    subject_train.txt
    X_train.txt
    y_train.txt
  activity_labels.txt
  features.txt
  README.txt
  run_analysis.R 
  harus.txt < ----- output file created by the script


Acknowledgement:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 