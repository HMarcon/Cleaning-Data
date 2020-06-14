##Uses descriptive activity names to name the activities in the data set

activity_labels <- as.data.frame(read.table("activity_labels.txt"))

##Appropriately labels the data set with descriptive variable names.

variables <- as.data.frame(read.table("features.txt"))

##Read data: training and test sets
train_label <- as.data.frame(read.table("./train/y_train.txt"))
train_data <- as.data.frame(read.table("./train/X_train.txt"))
colnames(train_data) <- variables$V2
train_data$activity <- as.factor(train_label$V1)

test_label <- as.data.frame(read.table("./test/y_test.txt"))
test_data <- as.data.frame(read.table("./test/X_test.txt"))
colnames(test_data) <- variables$V2
test_data$activity <- as.factor(test_label$V1)

##Merges the training and the test sets to create one data set.

#data_labels <- rbind(as.factor(train_label$V1),as.factor(test_label$V1))
full_dataset <- rbind(train_data, test_data)

##for (i in 1:nrow(full_dataset)){
##        for (j in 1:nrow(activities)){
##                if(full_dataset$label[i] == activities[j,1]){
##                        full_dataset$label[i] <- activities[j,2]
##                }
##        }
##}

##Extracts only the measurements on the mean and standard deviation for 
##each measurement.

Means <- colMeans(full_dataset[-562])
Deviations <- apply(full_dataset[-562], 2, sd)

summarized_data <- as.data.frame(rbind(Means, Deviations))

##From the data set, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.

##A job for tapply!

indep <- tapply(full_dataset[-562], full_dataset$activity, mean)
