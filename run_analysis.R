#################Getting and Cleaning Data Course Project################
##Date Created: 10/25/2014
##Merge Training and Test datasets
##Extract only mean and standard deviation measurements
##Name activities in dataset using descriptive names
##Name variables in dataset using descriptive names
##Average of each variable for each activity and subject
setwd("./Coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset")

  # Read in the following:
    # Activity ids and Activity labels
    # Subject ids
    # Test and Training datasets


### Read in Activity names, Activity ids, Subject ids
  activity_names<-read.table("activity_labels.txt")
  names(activity_names)<-c("act_id","act_desc")
  
  train_activity_ids<-read.table("./train/y_train.txt")
  test_activity_ids<-read.table("./test/y_test.txt")
  
  train_subject_ids<-read.table("./train/subject_train.txt")
  test_subject_ids<-read.table("./test/subject_test.txt")

### Read in training and test datasets
###The below code is to extract only variables with mean and std during the reading process###
variable_names<-read.table("features.txt",colClasses=c("NULL","character"),
                           col.names=c("NULL","Feature"))
keep<-union(grep("mean",variable_names[,1],ignore.case=TRUE),
            grep("std()",variable_names[,1],ignore.case=TRUE))##Variables to keep
keep_variables<-variable_names[,1][keep] # Get variable names
column_names<-rep_len("NULL",nrow(variable_names)) # Null vector of 561 length
column_classes <-rep_len("NULL",nrow(variable_names)) # Null vector of 561 length
column_names[keep]<-keep_variables #Replace null values with variable names
column_classes[keep]<-"numeric" #Replace null values with variable class

  train_data_set<-read.table("./train/X_train.txt",colClasses = column_class, 
                           col.names=column_names)
  
  test_data_set<-read.table("./test/X_test.txt",colClasses = column_class, 
                            col.names=column_names)
  
### Attach the subject and activity ids with the data sets###
  ### Training dataset
  train_data_set<-cbind(train_subject_ids,train_data_set)
  names(train_data_set)[1]<-"subjectid"
  
  train_data_set<-cbind(train_activity_ids,train_data_set)
  names(train_data_set)[1]<-"activityid"

  ### Test dataset
test_data_set<-cbind(test_subject_ids,test_data_set)
names(test_data_set)[1]<-"subjectid"

test_data_set<-cbind(test_activity_ids,test_data_set)
names(test_data_set)[1]<-"activityid"

###Merge/Appends Training and Test datasets
  merged_data_set<-rbind(test_data_set,train_data_set)

###Name activities in dataset using descriptive names
merged_data_set<-merge(merged_data_set,activity_names,by.x = "activityid",by.y="act_id")

##Name variables in dataset using descriptive names
  ## This was already done, by using "col.names" in "read.table()" function above


##Average of each variable for each activity and subject


tidy_data_set<-aggregate(merged_data_set[,3:88],
               by=list(Activity=merged_data_set$act_desc,
               Subject=merged_data_set$subjectid),FUN="mean")

##Export data to a txt file for assignment

write.table(tidy_data_set,file="./Tidy_Data.txt",sep=",",row.names=FALSE)

