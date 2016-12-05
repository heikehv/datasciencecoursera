#Code Book for Course Project

##Overview
For this project you need to download the folder with all the data from 
`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`

Once you download the folder, move it to your R working directory (alternatively you could change your working directory but I prefer to have all my files for this course in one place rather than changing the working directory all the time)

###Part One
Within this folder are two subfolders called 'train' and 'test' respectively, within them are the files that you need to read into R (there's three files in each folder) - as well as the two files 'activity.txt' and 'features.txt' in the main folder.

As all files are straightforward text files, you can use the `read.table` command to read the data into R, assigning each file to a separate name:

`myActivities <- read.table("path_to_your_file", header = FALSE)`

You need to do this for every file you need.

You then need to check the dimensions of the files you want to merge using `dim(myFile)` to make sure they are the same. If they are you can use rbind to merge the files from the test and train folder.

###Part Two
Next step is to separate out just the mean and standard deviation data from the 'features' data set and apply this to just the X merged data set.

###Part Three
As the Y merged data set is just numbers, you need to get the names for each data piece from the Activity data set.

###Part Four
Here you need to apply names to the columns of your data set as far as possible, using your labeled data set from Part Three. 

###Part Five
Combine all your data into one table using `cbind` and `data.table`. Use `lapply` to just use Standard Deviation and the Mean for each and sort by subject ID and type of activity. Write this table to file using the `write.table` command.

##And then you're done!