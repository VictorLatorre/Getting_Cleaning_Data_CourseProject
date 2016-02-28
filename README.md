# Getting_Cleaning_Data_CourseProject



There are only 1 script in which first of all I set my working directory, and check if I have the data ready for read. If not I download it and unzip.

Before read the data, I get all the information from the features and activities labels and levels. I use it after for create the data set required. 

Next step is to read both data sets, define columns, and melt in together with rbind(). After this step I filter all the columns and only select the ones which contain mean or std in the name, and then creat a new dataset with this columns.

With the Features and activities labels, I labeled appropirately this dataset.

Finally I generate a new tiny data set with the average of each variable for each activity and each subject and create the txt file for it.
