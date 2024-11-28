# Loading required packages
library(dplyr)

# Downloading and unzipping the dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("UCI HAR Dataset")) {
  download.file(fileUrl, destfile = "dataset.zip")
  unzip("dataset.zip")
}

# Loading data files
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_code")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_code")

# Merging training and test datasets
subject <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
merged_data <- cbind(subject, y_data, x_data)

# Extracting measurements on mean and standard deviation
selected_features <- features$feature[grep("mean\\(\\)|std\\(\\)", features$feature)]
selected_data <- merged_data %>%
  select(subject, activity_code, all_of(selected_features))

# Using descriptive activity names
selected_data <- merge(selected_data, activities, by.x = "activity_code", by.y = "code", all.x = TRUE)
selected_data <- selected_data %>% select(-activity_code) %>% rename(activity = activity)

# Labelling dataset with descriptive variable names
names(selected_data) <- gsub("^t", "Time_", names(selected_data))
names(selected_data) <- gsub("^f", "Frequency_", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))

# Creating a tidy dataset with the average of each variable for each activity and each subject
tidy_data <- selected_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

# Writing the tidy dataset to a file
write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
