## Look for directory, if not create it
if(!file.exists("./gacdproject")){dir.create("./gacdproject")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## Download file
download.file(fileUrl,destfile="./gacdproject/gacdproject.zip")
## Load data
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
## Binds data frames and selects measures only with mean and standard deviation
test <- cbind(X_test, subject_test)
subset_test <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,
                 253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)
subset_test <- test[subset_test]
train <- cbind(X_train, subject_train)
subset_train <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,
                  253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)
subset_train <- train[subset_train]
t_set <- rbind(subset_test,subset_train)
actions <- rbind(y_test, y_train)
## Allocate action names
actions$V1[actions$V1 == 1] <- "Walking"
actions$V1[actions$V1 == 2] <- "Walkingupstairs"
actions$V1[actions$V1 == 3] <- "Walkingdownstairs"
actions$V1[actions$V1 == 4] <- "Sitting"
actions$V1[actions$V1 == 5] <- "Standing"
actions$V1[actions$V1 == 6] <- "Laying"
## Create a single tidy data frame
tidyset <- cbind(t_set, actions)
library(data.table)
## Set data frame column names
setnames(tidyset, c('tbodyaccmeanx','tbodyaccmeany','tbodyaccmeanz','tbodyaccstdx','tbodyaccstdy',
                    'tbodyaccstdz','tgravityaccmeanx','tgravityaccmeany','tgravityaccmeanz',
                    'tgravityaccstdx','tgravityaccstdy','tgravityaccstdz','tbodyaccjerkmeanx',
                    'tbodyaccjerkmeany','tbodyaccjerkmeanz','tbodyaccjerkstdx','tbodyaccjerkstdy',
                    'tbodyaccjerkstdz','tbodygyromeanx','tbodygyromeany','tbodygyrostdz',
                    'tbodygyrojerkmeanx','tbodygyrojerkmeany','tbodygyrojerkmeanz','tbodygyrojerkstdx',
                    'tbodygyrojerkstdy','tbodygyrojerkstdz','tbodyaccmagmean','tbodyaccmagstd',
                    'tgravityaccmagmean','tgravityaccmagstd','tbodyaccjerkmagmean','tbodyaccjerkmagstd',
                    'tbodygyromagmean','tbodygyromagstd','tbodygyrojerkmagmean','tbodygyrojerkmagstd',
                    'fbodyaccmeanx','fbodyaccmeany','fbodyaccmeanz','fbodyaccstdx','fbodyaccstdy',
                    'fbodyaccstdz','fbodyaccjerkmeanx','fbodyaccjerkmeany','fbodyaccjerkmeanz',
                    'fbodyaccjerkstdx','fbodyaccjerkstdy','fbodyaccjerkstdz','fbodygyromeanx',
                    'fbodygyromeany','fbodygyromeanz','fbodygyrostdx','fbodygyrostdy','fbodygyrostdz'
                    ,'fbodyaccmagmean','fbodyaccmagstd','fbodybodyaccjerkmagmean','fbodybodyaccjerkmagstd'
                    ,'fbodybodygyromagmean','fbodybodygyromagstd','fbodybodygyrojerkmagmean',
                    'fbodybodygyrojerkmagstd','fbodybodygyromagmean','fbodybodygyromagstd',
                    'fbodybodygyrojerkmagmean','activity'))