## Get the analysis data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/data.zip")

##Unzip the dataset
unzip(zipfile = "./data/data.zip", exdir = "./data")

##Set working Directory to the data directory
setwd("./data")

##Get list of files in the dataset
list.files()
# [1] "data.zip"        "UCI HAR Dataset"

#get list of files in the UCI HAR Dataset

list.files("UCI HAR Dataset")
# [1] "activity_labels.txt" "features.txt"        "features_info.txt"  
# [4] "README.txt"          "test"                "train" 

##view the readme text to see how the files relate to each other
Readmetxt <- readLines("UCI HAR Dataset/README.txt")
View(Readmetxt)

## Read in the features files to be used for adding headings 
## to the X_train & X_test Data

features <- read.table("UCI HAR Dataset/features.txt")

## Read in the Activity Lables and assign column names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("activity_id","activity_name")


## get list of files in the training dataset
list.files("UCI HAR Dataset/train")
# [1] "Inertial Signals"  "subject_train.txt" "X_train.txt"      
# [4] "y_train.txt" 

## Read in the Training Data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

## Add the headings to the train data
colnames(subject_train)<- "subject_id"
colnames(X_train)<- features[,2]
colnames(y_train)<- "activity_id"

## get list of files in the test dataset
list.files("UCI HAR Dataset/test")
# [1] "Inertial Signals" "subject_test.txt" "X_test.txt"       "y_test.txt"   

## Read in the test Data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

## Add the headings to the test data
colnames(subject_test)<- "subject_id"
colnames(X_test)<- features[,2]
colnames(y_test)<- "activity_id"

## Merge the training data column-wise 
train_merge <- cbind(subject_train, y_train,X_train)

## Merge the test data columnwise
test_merge <- cbind(subject_test, y_test,X_test)

##Merge the train and test data row-wise
mergeAll <- rbind(train_merge,test_merge)


## Get a list of the ID columns, mean columns, and the SD columns

col_list_all <- colnames(mergeAll)
subset_cols <- c(grep("activity_id",col_list_all, value = TRUE),
                 grep("subject_id",col_list_all, value = TRUE),
                  grep( "mean..",col_list_all, value = TRUE),
                  grep("std..",col_list_all, value = TRUE))

## Subset the merged data to inlcude only the ID, mean and SD columns from above                  
subset_data <- mergeAll[,subset_cols]

## Add in the activity descriptions

descirpt_data <- merge(activity_labels, subset_data, by.x = "activity_id",by.y = "activity_id" )

## Create and aggregated tidy data set including the average of each variable and subject

agg_data <- aggregate(. ~subject_id + activity_id + activity_name, descirpt_data, mean)

order_agg <- arrange(agg_data, subject_id, activity_id)

## Write the tidy results to a file

write.table(order_agg, "run_analysis_output.txt", row.name = FALSE)

