##Uses descriptive activity names to name the activities in the data set

activity_labels <- as.data.frame(read.table("activity_labels.txt"))

##Appropriately labels the data set with descriptive variable names.

property <- read.table("features.txt")

##Read data: training and test sets
train_label <- read.table("./train/y_train.txt")
train_data <- read.table("./train/X_train.txt")
train_subject <- read.table("./train/subject_train.txt")
train <- cbind(train_data, train_label, train_subject)


test_label <- as.data.frame(read.table("./test/y_test.txt"))
test_data <- as.data.frame(read.table("./test/X_test.txt"))
test_subject <- as.data.frame(read.table("./test/subject_test.txt"))
test <- cbind(test_data, test_label, test_subject)


##Merges the training and the test sets to create one data set.

full_dataset <- rbind(train, test)
colnames(full_dataset) <- c(property$V2, "activity", "subject" )
full_dataset$activity <- factor(full_dataset$activity, levels = activity_labels[,1],
                                labels = activity_labels[,2])
full_dataset$subject <- as.factor(full_dataset$subject)

##Extracts only the measurements on the mean and standard deviation for each measurement

Means <- colMeans(full_dataset[1:(ncol(full_dataset)-2)])
Deviations <- apply(full_dataset[1:(ncol(full_dataset)-2)], 2, sd)


##Extracts only the measurements on the mean and standard deviation for 
##each measurement. 
full_data_melted <- melt(full_dataset, id = c("subject", "activity"))

#Average of each property by activity and subject
full_data_mean <- dcast(full_data_melted, subject + activity ~ variable, mean)

#Create new file: tidy.txt
write.table(full_data_mean, "tidy.txt", row.names = FALSE, quote = FALSE)

#}

