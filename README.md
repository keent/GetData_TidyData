Human Activity Recognition Using Smartphones  
============================================
"Tidy" Dataset Version 1.0
--------------------------

This tidy data set was extracted and refined from this:
[study](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  
The original data can be download from here:
[download](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This project contains  
**1. tidy_data.txt**  
The tidy data which contains the average of all the variables for each activity and each subject  
**2. README.md**  
This document which defines what run_analysis.R does, which is the code that performs analysis and outputs tidy_data.txt  
**3. Codebook.md**  
The codebook which defines the variables, the data, and the transformations from the original dataset to tidy_data.txt  
**4. run_analysis.R**  
The code that performs the transformation from the original data to the tidy data.


Analysis in run_analysis.R
--------------------------
### Objects and File produced
run_analysis.R is the code that performs the transformation of the original data
to 3 R Data Frame Objects : dataMergedSet, dataMeanStd, dataSummary
and 1 file called tidy_data.txt

* **dataMergedSet**, is taken from several training and test set files from the original data and finally merged into one cohesive data frame

* **dataMeanStd**, is taken from dataMergedSet which contains only the variables that has mean and std (standard deviation)

* **dataSummary**, is the average of each variable for each activity and each subject in dataMeanStd

* **tidy_data.txt** dataSummary is written to this file


### Steps
The steps done by run_analysis.R can be broken down into the following 6 steps in order


1. Merges the training and the test sets to create one data set 
to object "dataMergedSet"

2. Extracts only the measurements on the mean and standard deviation for each measurement to object "dataMeanStd"

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
named "dataSummary"

6. Finally, it writes the dataSummary from step 5, to a file named tidy_data.txt

### Assumptions
For run_analysis.R to run, it expects the data that can be download from 
[here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to be extracted to the same folder.  
That is, the following file and folder  
* .\run_analysis.R  
* .\UCI HAR Dataset  

must be in the same directory.
