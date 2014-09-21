
print("The data set is too big. Please wait (usually, more than a minute)!")
# Step 0: Download and unzip the data file.
## 0.1 Check whether working directory has 'jtleek' folder
## Trivia: I chose 'jtleek' to show my respect for the instructor of this course =)
if(!file.exists("./jtleek")){dir.create("./jtleek")}

## 0.2 Check whether the data set exists/was previously downloaded.
if(!file.exists("./jtleek/getdata_projectfiles_UCI HAR Dataset.zip")){
        fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "./jtleek/getdata_projectfiles_UCI HAR Dataset.zip")
}

## 0.3 Unzip the downloaded file.
unzip("./jtleek/getdata_projectfiles_UCI HAR Dataset.zip", exdir = "./jtleek", setTimes = TRUE)

# Steps after 0 and before 1 =)

## Importing variable names which is necessary for step 4 (Appropriately labeling the data set with descriptive variable names)
## I prefer to name the columns during step 1. I think it is more resanable!
variable_names <- read.table("./jtleek/UCI HAR Dataset/features.txt", header = FALSE)

## Importing elements of "TEST" data set
subject_of_test <- read.table("./jtleek/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
colnames(subject_of_test) <- c("SubjectID")

activity_id_of_test <- read.table("./jtleek/UCI HAR Dataset/test/y_test.txt", header = FALSE)
colnames(activity_id_of_test) <- c("Activity")

data_of_test <- read.table("./jtleek/UCI HAR Dataset/test/X_test.txt", header = FALSE)
colnames(data_of_test) <- factor(variable_names$V2)

## Creating "Test" Data Set
test_dataset = cbind(subject_of_test, activity_id_of_test, data_of_test)


## Importing elements of "TRAIN" data set
subject_of_train <- read.table("./jtleek/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
colnames(subject_of_train) <- c("SubjectID")

activity_id_of_train <- read.table("./jtleek/UCI HAR Dataset/train/y_train.txt", header = FALSE)
colnames(activity_id_of_train) <- c("Activity")

data_of_train <- read.table("./jtleek/UCI HAR Dataset/train/X_train.txt", header = FALSE)
colnames(data_of_train) <- factor(variable_names$V2)

## Creating "TRAIN" Data Set
train_dataset = cbind(subject_of_train, activity_id_of_train, data_of_train)


# Step 1. Merging the training and the test sets to create one data set.
merged_dataset = rbind(train_dataset, test_dataset)

print("Step 1 (Merge the training and the test sets to create one data set): done!")
print("Furthermore, labeling the data set with descriptive variable names (Step 4) has been done during merging step.")


# Step 2. Extracting only the measurements on the mean and standard deviation for each measurement.
## The  following line keeps first and second columns ('SubjectID' and 'Activity')
## and choose columns which have 'mean(' or 'std('(standard deviation) in their names.
narrowed_dataset <- merged_dataset[ , c(1, 2, grep("mean\\(|std\\(", colnames(merged_dataset)))]

print("Step 2 (Extracting only the measurements on the mean and standard deviation for each measurement): done!")


# Step 3. Using descriptive activity names to name the activities in the data set
activity_labels <- read.table("./jtleek/UCI HAR Dataset/activity_labels.txt", header = FALSE)
number_of_activites <- nrow(activity_labels)
activity_labels$V1 <- as.character(activity_labels$V1)
activity_labels$V2 <- as.character(activity_labels$V2)

narrowed_dataset$Activity <- as.character(narrowed_dataset$Activity)
for (i in 1:number_of_activites){
        narrowed_dataset$Activity[narrowed_dataset$Activity == activity_labels$V1[i]] <- activity_labels$V2[i]
}
print("Step 3 (Useing descriptive activity names to name the activities in the data set): done!")


# Step 4. As mentioned earlier, step 4 (Appropriately labeling the data set with descriptive variable names)
# has been done during step 1.
print("Step 4 was done during step 1!")


# Step 5. From the data set in step 4, creating a second,
# independent tidy data set with the average of each variable for each activity and each subject.

library(reshape2)
melted_narrowed_dataset <- melt(narrowed_dataset, id.vars = c("SubjectID", "Activity"))
library(plyr)
final_tidy_dataset <- dcast(melted_narrowed_dataset, SubjectID + Activity ~ variable, mean)

write.table(final_tidy_dataset, file = "./jtleek/final_tidy_dataset.txt", row.names = FALSE, sep = "\t")

print("Step 5 (From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject): done!")

# 6. Extra step: The unziped data set takes up to 269 MB of your disk storage.
## It's time to clean up the mess!
unlink("./jtleek/UCI HAR Dataset", recursive = TRUE, force = TRUE)

# 7. Extra step: Notification about the downloaded data set!
print(c("For your future references, the downloaded data set file is in 'jtleek' folder of your working directory:", getwd()))
print("You can find the result of this R script (final tidy dataset in TXT format) in 'jtleek' folder.")

# 8. Extra Step: This script has created a number of varibales which are now in your R workspace.
## To keep things running smoothly after you test this script, It's better to remove them =)
## Credit goes to the author of 'SWIRL' package who inspired me for this tweak =)
rm(list=ls())