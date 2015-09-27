# Step 1: cleaning the X_test file
# Reading X_test.txt dataset into R
test_set <- read.table("test/X_test.txt")
# Read and process future temporary column names
features <- read.table("features.txt")
features <- features$V2
features <- as.character(features)
# Naming columns in "test_set" as "features"
colnames(test_set) <-features
# Subsetting the columns containing strings "mean" and "std"
test_set_std <- test_set[,grepl("std",names(test_set))]
test_set_mean_raw <- test_set[,grepl("mean",names(test_set))]
# Substracting the columns containing "meanFreq" (as it is just a preparatory value for the
# real "mean" calculation)
remove_meanfreq <- test_set_mean_raw[,grepl("meanFreq",names(test_set_mean_raw))]
drops <- names(remove_meanfreq)
test_set_mean <- test_set_mean_raw[,!(names(test_set_mean_raw) %in% drops)]
# Creating single data from the "mean"-frame and "std"-frame
test_frame <- cbind(test_set_std, test_set_mean)
# Some memory care...
remove(test_set,test_set_mean_raw, test_set_std,test_set_mean)
#
# ==============================================================================================
#
# Step 2: cleaning the X_train file
# Reading X_train.txt dataset into R
train_set <- read.table("train/X_train.txt")
# Naming columns in "train_set" as "features"
colnames(train_set) <-features
# Subsetting the columns containing strings "mean" and "std"
train_set_std <- train_set[,grepl("std",names(train_set))]
train_set_mean_raw <- train_set[,grepl("mean",names(train_set))]
# Substracting the columns containing "meanFreq" (as it is just a preparatory value for the
# real "mean" calculation)
train_set_mean <- train_set_mean_raw[,!(names(train_set_mean_raw) %in% drops)]
# Creating single data from the "mean"-frame and "std"-frame
train_frame <- cbind(train_set_std, train_set_mean)
# Some more memory care...
remove(train_set,train_set_mean_raw, train_set_std,train_set_mean, drops, features, remove_meanfreq)
#
#================================================================================================
#
# Step 3: creating a single data frame
# Getting the "activities" vector
activities <- rbind(read.table("test/y_test.txt"),read.table("train/y_train.txt"))
# Getting the "subject" vector
subject <- rbind(read.table("test/subject_test.txt"),read.table("train/subject_train.txt"))
# Creating a small data frame of this two vectors
act_subj <- cbind(activities,subject)
colnames(act_subj) <-cbind("activities", "subject")
# Memory care
remove(activities,subject)
#
#================================================================================================
#
# Step 4: combining all the data together
final_frame <- rbind(test_frame,train_frame)
final_frame <- cbind(act_subj,final_frame)
# Memory care
remove(act_subj,test_frame,train_frame)
#
#================================================================================================
#
# Step 5: creating the final data frame, naming and writing it into a file
clear_data <-data.frame()
count_act <- 1
# This first loop controls the numeric ID of an activity type
while (count_act < 7) {
  count_subj <- 1
  # This second nested loop controls the numeric ID of a person
  while (count_subj < 31) {
    # Subsetting the activity_type / person_ID data frame
    tmp_frame <- subset(final_frame, activities == count_act & subject == count_subj )
    # Calculating the mean of each value
    tmp_vector <- sapply(tmp_frame, mean)
    # Adding the result to the the draft of a clear data set
    clear_data <- rbind(clear_data, tmp_vector)
    count_subj <- count_subj + 1
  }
  count_act <- count_act + 1
}
# Removing unrequired objects from the enviroment
remove(tmp_frame,count_act,count_subj,tmp_vector)
# Now I need to change the numeric ID's of activities to names, as I exactly know the structure of the 
# data a little of cheating is ok.
clear_data[1:30,1] <- "WALKING"
clear_data[31:60,1] <- "WALKING_UPSTAIRS"
clear_data[61:90,1] <- "WALKING_DOWNSTAIRS"
clear_data[91:120,1] <- "SITTING"
clear_data[121:150,1] <- "STANDING"
clear_data[151:180,1] <- "LAYING"
# The final step: replacing the strange column names with a normal ones. Here begins the fun...
column_names <- c("activity_type", "subject_id", "t_body_accelerometer_std_x", "t_body_accelerometer_std_y",
                  "t_body_accelerometer_std_z", "t_gravity_accelerometer_std_x", "t_gravity_accelerometer_std_y",
                  "t_gravity_accelerometer_std_z", "t_body_accelerometer_jerk_std_x", "t_body_accelerometer_jerk_std_y",
                  "t_body_accelerometer_jerk_std_z", "t_body_gyroscope_std_x",   "t_body_gyroscope_std_y",  "t_body_gyroscope_std_z",
                  "t_body_gyroscope_jerk_std_x", "t_body_gyroscope_jerk_std_y", "t_body_gyroscope_jerk_std_z", 
                  "t_body_accelerometer_magnitude_std", "t_gravity_accelerometer_magnitude_std", "t_body_accelerometer_jerk_magnitude_std",
                  "t_body_gyroscope_magnitude_std", "t_body_gyroscope_jerk_magnitude_std", "f_body_accelerometer_std_x" , 
                  "f_body_accelerometer_std_y", "f_body_accelerometer_std_z", "f_body_accelerometer_jerk_std_x" ,
                  "f_body_accelerometer_jerk_std_y" , "f_body_accelerometer_jerk_std_z" , "f_body_gyroscope_std_x", 
                  "f_body_gyroscope_std_y", "f_body_gyroscope_std_z", "f_body_accelerometer_magnitude_std", 
                  "f_body_body_accelerometer_jerk_magnitude_std", "f_body_body_gyroscope_magnitude_std",
                  "f_body_body_gyroscope_jerk_magnitude_std", "t_body_accelerometer_mean_x", "t_body_accelerometer_mean_y",
                  "t_body_accelerometer_mean_z", "t_gravity_accelerometer_mean_x", "t_gravity_accelerometer_mean_y", 
                  "t_gravity_accelerometer_mean_z", "t_body_accelerometer_jerk_mean_x",  
                  "t_body_accelerometer_jerk_mean_y",  "t_body_accelerometer_jerk_mean_z",
                  "t_body_gyroscope_mean_x", "t_body_gyroscope_mean_y", "t_body_gyroscope_mean_z", 
                  "t_body_gyroscope_jerk_mean_x", "t_body_gyroscope_jerk_mean_y", "t_body_gyroscope_jerk_mean_z", 
                  "t_body_accelerometer_magnitude_mean", "t_gravity_accelerometer_magnitude_mean",
                  "t_body_accelerometer_jerk_magnitude_mean", "t_body_gyroscope_magnitude_mean", "t_body_gyroscope_jerk_magnitude_mean",
                  "f_body_accelerometer_mean_x", "f_body_accelerometer_mean_y", "f_body_accelerometer_mean_z", 
                  "f_body_accelerometer_jerk_mean_x", "f_body_accelerometer_jerk_mean_y", 
                  "f_body_accelerometer_jerk_mean_z", "f_body_gyroscope_mean_x", "f_body_gyroscope_mean_y",
                  "f_body_gyroscope_mean_z", "f_body_accelerometer_magnitude_mean", "f_body_body_accelerometer_jerk_magnitude_mean",
                  "f_body_body_gyroscope_magnitude_mean", "f_body_body_gyroscope_jerk_magnitude_mean")
colnames(clear_data) <- column_names
# Cleaning the enviroment
remove(final_frame,column_names)
# Writing the output to a file
write.csv(clear_data, file = "clear_data.csv")
