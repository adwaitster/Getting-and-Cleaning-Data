Getting-and-Cleaning-Data
=========================

Steps of getting from the raw data to tidy data set.

The raw data was downloaded from this location: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The files used from the raw data were the following:
activity_labels.txt ## Label Names for activity ids

y_train.txt         ## Training activity ids

subject_train.txt   ## Training subject ids

X_train.txt        ## File containing the 561 feature/variable data for each TRAINING 
                      subject and activity

y_test.txt         ## Test activity ids

subject_test.txt   ## Test subject ids

X_test.txt        ## File containing the 561 feature/variable data for each TEST 
                      subject and activity

features.txt      ## 561 feature names

###########################Step 1###################################
Read in all the files except the data sets containing information on the 
561 features
###########################Step 2###################################
Clean up the the "features.txt" file to leave only features containing the
mean(), Mean, and std() features. 

The remaining features are replaced with  "NULL".

This is done to import only the features that we want. This step will 
make reading the file faster and also reduce the size it consumes.
###########################Step 3###################################
Read in all the files except the data sets containing information on the 
561 features
