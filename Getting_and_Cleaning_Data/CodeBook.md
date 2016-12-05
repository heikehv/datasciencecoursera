#Code Book

This contains and explains all the R command I used for my Getting & Cleaning Data Coursera project.
I hope I haven't forgotten any .... :-)

##Commands
- `read.table` to read each text file
- `dim()` to check dimensions of each dataset
- `rbind` to merge datasets from test and train folders
- `grep("mean\\(\\)|std\\(\\)", myFeatures[,2])` to select only mean and standard deviation data from the Features dataset
- `names()` apply selected names to the respective dataset
- `cbind` merge Subject, X, and Y which have the same number of columns each
- `data.table()` create a table from a dataset
- `lapply` applying standard deviation and mean to all
- `write.table()` write table to file


##Variable Names
- `mysubject_train` to store initial data from train/subject.text
- `myX_train`       to store initial data from train/X.text
- `myY_train`       to store initial data from train/Y.text
- `mysubject_test`  to store initial data from test/subject.text
- `myX_test`        to store initial data from test/X.text
- `myY_test`        to store initial data from test/Y.text
- `myActivities`    to store initial data from activities.text
- `myFeatures`      to store initial data from features.text
- `X`               merged dataset of x variable (from test & train folders respectively)
- `Y`               merged dataset of y variable (from test & train folders respectively)
- `Subject`         merged dataset of subject variable (from test & train folders respectively)
- `mean_standard_selection` the selection of only the mean and standard deviation features
- `X_select`          contains only mean and SD for the X dataset
- `Total_Overview`  merged dataset of X, Y and Subject
- `Overview`        data table containing data from Total_Overview
- `Not_messy_overview` data table containing only Mean and SD, sorted by subject and activity
- `notMessy.txt`    final output as text file
