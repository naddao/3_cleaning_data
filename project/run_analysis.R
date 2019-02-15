########################################################
## Clean up features data collected from Accelerometer/Gyrometer 
## from datasource to be in format that will be used for later analysis
##
## To run program: source("run_analysis.R")
## Output: tidy_data.csv
######################################################

# import neccesary library
library(tidyr)
library(plyr)
library(dplyr)
library(data.table)

source_file <- "dataset.zip"
dataset_path <- "datasets"
prefix_path <- "datasets/UCI HAR Dataset/"

# function to download file from specify url
download_file <- function(url){
	download.file(url, source_file)
}

# function to read data from specify file
read_csv_file <- function (filename, header=FALSE, ...){
    file_path <- paste(prefix_path, filename, sep="")
    data <- read.table(file_path, header=header, ...)
}

# function to write data to specify file
write_csv_file <- function(data, filename, sep=" ", row.names=FALSE, ...){
    write.table(data, filename,  sep=sep, row.names=row.names, ... )
}

# function to produce human-readable feature name
get_clean_feature_name <- function(name){
    
    # replace dash("-") with underscore("_")
    name <- gsub("-", "_", name) 
    name <- gsub("\\(.*\\)", "", name)		
    name <- gsub("Acc", "_acc", name) 
    name <- gsub("BodyBody", "Body", name) 
    name <- gsub("Gyro", "_gyro", name) 		
    name <- gsub("Jerk", "_jerk", name) 
    name <- gsub("Mag", "_mag", name) 		
    name <- tolower(name)
}

# define column names
activites_column_names <- c("activity_id", "activity_name")
features_column_names <- c("feature_order", "features_name")
label_subject_column_names <- c("subject_id")
label_activities_column_names <- c("activity_id")

print("----------Downloading source file-----------")
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download_file(file_url)

# unzip downloaded file
print("----------Extracting zip file-----------")
unzip(source_file, exdir=dataset_path, overwrite=TRUE)

# load info of activities name
print("----------Preparing activites info-----------")
activities <- read_csv_file("activity_labels.txt")
names(activities) <- activites_column_names

# load info of features name
print("----------Preparing features info-----------")
features <- read_csv_file("features.txt")
names(features) <- features_column_names
features_name <- lapply(features$features_name, FUN=get_clean_feature_name) 

print("----------Preparing train data-----------")

# Preparing train data: load label info of person who perform activities
label_subjects <- read_csv_file("train/subject_train.txt")
names(label_subjects) <- label_subject_column_names

# Preparing train data: load label info of activities
label_activities <- read_csv_file("train/y_train.txt")
names(label_activities) <- label_activities_column_names
label_activities <- join(label_activities, activities, by="activity_id")

# Preparing train data: load features of test data
features_train_data <- read_csv_file("train/X_train.txt")

# naming feature column by feature info data
colnames(features_train_data) <- features_name

# Preparing train data: combine train data(features, label subject, label activity)
features_train_data <- cbind(label_subjects, label_activities, features_train_data) 

# free memory from loaded data
rm(label_activities, label_subjects)

print("----------Preparing test data-----------")

# Preparing test data: load label info of person who perform activities
label_subjects <- read_csv_file("test/subject_test.txt")
names(label_subjects) <- label_subject_column_names

# Preparing test data: load label info of activities
label_activities <- read_csv_file("test/y_test.txt")
names(label_activities) <- label_activities_column_names
label_activities <- join(label_activities, activities, by="activity_id")

# Preparing test data: load features of test data
features_test_data <- read_csv_file("test/X_test.txt")

# naming feature column by feature info data
colnames(features_test_data) <- features_name

# Preparing test data: combine test data(features, label subject, label activity)
features_test_data <- cbind(label_subjects, label_activities, features_test_data)

# free memory from loaded data
rm(label_activities, label_subjects)

# combine train/test data
print("----------Merging train+test data-----------")
merge_data <- rbind(features_train_data, features_test_data)

# free memory from loaded data
rm(features_train_data, features_test_data)

# select only measurement with mean and standard deviation
print("----------Filter measurement only mean and standard deviation-----------")
column_names <- colnames(merge_data)
select_column_idx <- grepl("subject_id|activity_name|mean$|mean_|std", column_names, fixed = FALSE)
selected_features <- merge_data[, select_column_idx]

# average selected features group by subject_id and activity_name
print("----------Preparing tidy data( average of each measurement of each suject and activity)-----------")
tidy_data <- selected_features %>% 
                group_by(subject_id, activity_name) %>% 
                    summarise_all(funs(mean))

# writing tidy data to file
print("----------Writing tidy data to file-----------")
write_csv_file(tidy_data, "tidy_data.csv")

print("----------Done-----------")
