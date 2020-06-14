##Read data: training and test sets
train_label <- read.table("./train/y_train.txt")
train_data <- read.table("./train/X_train.txt")

test_label <- read.table("./test/y_test.txt")
test_data <- read.table("./test/X_test.txt")

##Merges the training and the test sets to create one data set.

data_labels <- rbind(train_label, test_label)
full_dataset <- rbind(train_data, test_data)

##Extracts only the measurements on the mean and standard deviation for 
##each measurement.

Means <- colMeans(full_dataset)
Deviations <- apply(full_dataset, 2, sd)

#summarized_data <- rbind(Means, Deviations)
##Uses descriptive activity names to name the activities in the data set


##Appropriately labels the data set with descriptive variable names.