library(reshape2)

setwd(dir ="Downloads/R/GettingCleaningData/")

filename<-"getdata_dataset.zip"

if (!file.exists(filename)){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",filename)
}
if(!file.exists("UCI HAR Dataset")){
  unzip(filename)
}

Activities_labels<-as.character(read.table("UCI HAR Dataset/activity_labels.txt")[,2])
Activities_levels<-read.table("UCI HAR Dataset/activity_labels.txt")[,1]
Features<-as.character(read.table("UCI HAR Dataset/features.txt")[,2])


#Load Dataset and merge

# Construct train and test data frames (including the descriptive activity names as was asked in 3) an 4) )
train_Activities<-read.table("UCI HAR Dataset/train/y_train.txt")
train_Subjects<-read.table("UCI HAR Dataset/train/subject_train.txt")
train<-read.table("UCI HAR Dataset/train/X_train.txt")
train<-cbind(train_Subjects,train_Activities,train)
colnames(train)<-c("Subjects","Activities",Features)

test_Activities<-read.table("UCI HAR Dataset/test/y_test.txt")
test_Subjects<-read.table("UCI HAR Dataset/test/subject_test.txt")
test<-read.table("UCI HAR Dataset/test/X_test.txt")
test<-cbind(test_Subjects,test_Activities,test)
colnames(test)<-c("Subjects","Activities",Features)

# 1) Merge training and test sets to create on data set
merged_data<-rbind(train,test)

# 2) Extract only mean and std
mean_std<-grep(".*mean.*|.*std*.",Features)

Data_mean_std<-merged_data[,c(1,2,2+mean_std)]

Data_mean_std$Activities<-factor(Data_mean_std$Activities, levels = Activities_levels, labels = Activities_labels)
Data_mean_std$Subjects<-as.factor(Data_mean_std$Subjects)

Data_mean_std.melted<-melt(Data_mean_std, id = c("Subjects","Activities"))
Data_mean_std.mean<-dcast(Data_mean_std.melted, Subjects+Activities~variable,mean)

# Produce new table independent with the values of the average of each variable for each activity and each subject.
write.table(Data_mean_std.mean,"tidy_dataset.txt",row.names=FALSE,quote = FALSE)
