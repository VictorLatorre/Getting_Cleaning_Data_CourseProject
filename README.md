# Getting_Cleaning_Data_CourseProject

Getting and Cleaning Data Course Projectless 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

1) a tidy data set as described below 

2) a link to a Github repository with your script for performing the analysis

3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.


#############################################################################################################################

There are only 1 script in which first of all I set my working directory, and check if I have the data ready for read. If not I download it and unzip.

Before read the data, I get all the information from the features and activities labels and levels. I use it after for create the data set required. 

Next step is to read both data sets, define columns, and melt in together with rbind(). After this step I filter all the columns and only select the ones which contain mean or std in the name, and then creat a new dataset with this columns.

With the Features and activities labels, I labeled appropirately this dataset.

Finally I generate a new tiny data set with the average of each variable for each activity and each subject and create the txt file for it.
