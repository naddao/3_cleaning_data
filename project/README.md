# Project Description
To collect, work with and clean dataset. To prepare tidy data that can be used for later analysis.
Project: Get and Cleaning Data Course Project
Datasource: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Output data: tidy_data.csv

#### To run analysis
`source("run_analysis.R")`

#### Require library
> tidyr, plyr, dplyr, data.table

#### Files
* CODEBOOKS.txt - Description of collected data
* README.txt - Detail of analysis process.
* tidy_data.txt - tidy data which is output file from analysis.
* run_analysis.R - R script to perform analysis.

#### Steps of analysis
1. download original dataset
2. unzip original dataset.
3. load all available activities info data from "activity_labels.txt"
4. load all available features info data from "features.txt" and clean up feature name to understandable format
5. loading training data
	5.1 person who perform each activity of training data from "train/subject_train.txt"
	5.2 label activity data describe which activity each feature perform. "train/y_train.txt"
	5.3 features as measurement which calculated from accelerometer/gyrometer "train/X_train.txt"
	5.4 naming each feature by all feature name availble from 4
	5.5 combine data from 5.1-5.4
6. loading testing data
	6.1 person who perform each activity of testing data from "test/subject_test.txt"
	6.2 label activity data describe which activity each feature perform. "test/y_test.txt"
	6.3 features as measurement which calculated from accelerometer/gyrometer "test/X_test.txt"
	6.4 naming each feature by all feature name availble from 4
	6.5 combine data from 6.1-6.4
7. merge training data and testing data from 5, 6
8. select only measurement on mean and standard deviation
9. calculate tidy data by average each measurement for each activity and subject
10. write tidy data to file as "tidy_data.txt"

