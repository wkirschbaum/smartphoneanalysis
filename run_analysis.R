library(dplyr)

#load all required data
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#combine training and test data
x_combined <- rbind(x_test, x_train)
y_combined <- rbind(y_test, y_train)
subject_combined <- rbind(subject_test, subject_train)

#extract only mean and standard deviation measurements
features_extracted <- filter(features, grepl("-mean\\(\\)|-std\\(\\)", V2))
x_extracted <- x_combined[,features_extracted[,1]] 

# name the activities
activity <- join(y_combined, activity_labels, by="V1")$V2
x_named <- cbind(activity, x_extracted)

# label the variables
formatted_feature_names <- gsub("\\(\\)", "", gsub("-", ".", features_extracted$V2))
colnames(x_named) <- c("activity", formatted_feature_names)

# create activity averages data set
tidy_data <- cbind(subject = subject_combined[,1], x_named)
group <- group_by(tidy_data, subject, activity)
summary <- summarise_each(group, funs(mean))
write.table(summary, file="smartphone_average_activity.txt", row.names = FALSE)