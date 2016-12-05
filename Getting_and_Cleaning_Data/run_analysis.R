# PART ONE - Merge the training and the test sets to create one data set
# read txt data into R from downloaded folder
mysubject_train <- read.table("/Users/heikehv/datasciencecoursera/datasciencecoursera/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
myX_train <- read.table("/Users/heikehv/datasciencecoursera/datasciencecoursera/UCI HAR Dataset/train/X_train.txt", header = FALSE)
myY_train <- read.table("/Users/heikehv/datasciencecoursera/datasciencecoursera/UCI HAR Dataset/train/Y_train.txt", header = FALSE)
mysubject_test <- read.table("/Users/heikehv/datasciencecoursera/datasciencecoursera/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
myX_test <- read.table("/Users/heikehv/datasciencecoursera/datasciencecoursera/UCI HAR Dataset/test/X_test.txt", header = FALSE)
myY_test <- read.table("/Users/heikehv/datasciencecoursera/datasciencecoursera/UCI HAR Dataset/test/Y_test.txt", header = FALSE)
myActivities <- read.table("/Users/heikehv/datasciencecoursera/datasciencecoursera/UCI HAR Dataset/activity_labels.txt", header = FALSE)
myFeatures <- read.table("/Users/heikehv/datasciencecoursera/datasciencecoursera/UCI HAR Dataset/features.txt", header = FALSE)

# to check that both test and train data sets have same number of variables
dim(mysubject_test)
dim(mysubject_train)
dim(myX_test)
dim(myX_train)
dim(myY_test)
dim(myY_train)

# combine both datasets using rbind 
# as respective datasets have the same number of variables
X <- rbind(myX_test, myX_train)
Y <- rbind(myY_test, myY_train)
Subject <- rbind(mysubject_test, mysubject_train)

# PART TWO Extract only the measurements on the mean and standard deviation for each measurement.
# applying labels 
# names(X) = myFeatures

# selecting only mean and standard deviation features from the features dataset
mean_standard_selection <- grep("mean\\(\\)|std\\(\\)", myFeatures[,2])

# .... and applying this to the X dataset
X_select <- X[ ,mean_standard_selection]

# results
dim(X_select)

# PART THREE Use descriptive activity names to name the activities in the data set
# label numeric values in the Y dataset with the 
# respective activity names from the activity dataset
Y[,1] <- myActivities[Y[,1],2]

# PART FOUR Appropriately label the data set with descriptive variable names
# label the variables with descriptive names
names<-myFeatures[mean_standard_selection,2] ## just focusing on mean & standard deviation)
names(X)<-names
names(Subject)<-"Subject_Number"
names(Y)<-"Type_of_Activity"
Total_Overview<-cbind(Subject, Y, X)

# PART FIVE Create a second, independent tidy data set with the average of each variable for each activity and each subject
# write table
Overview<-data.table(Total_Overview)
Not_messy_overview <- Overview[, lapply(.SD, mean), by = 'Subject,Type_of_Activity']
write.table(Not_messy_overview, file = "notMessy.txt", row.names = FALSE)
