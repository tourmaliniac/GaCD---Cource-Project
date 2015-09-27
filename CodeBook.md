Code Book

*General information about data:*
The data set in a file clear_data.txt has 68 variables and 180 observations. First two variables «activity_type» and «subject_id» identify the type of activity and ID of a participant, while the others are mean values of various values obtained from a Samsung Galaxy S 2 accelerometer and gyroscope and processed in several ways. 

*Transformations of data and general algorithme:*
The script consists of five basic parts:

*Step 1: cleaning the X_test file — this part takes the mean and standart deviation columns out of the X_test for further processing

*Step 2: cleaning the X_train file - this part takes the mean and standart deviation columns out of the X_train for further processing, subsequently removing the meanFreq columns as they are not actually mean values (see README.txt )

*Step 3: creating a single data frame — combines the draft data sets obtained in steps 1 & 2

*Step 4: combining all the data together — adds «activity_type» and «subject_id» columns to the draft of a data set

*Step 5: creating the final data frame:  naming and writing it into a file —  calculates the means of all values, than names the activities, adds «tidy» names of columns and finally outputs the data to a file named clear_data.txt.

For more information about the algorithme see the comments in run_analysis.R
For technical details and explanations of some moments see README.md

*List of variables:*
*«activity_type» - the type of activity as listed in activity_labels.txt

*«subject_id» - identifier of a person

*«t_body_accelerometer_std_x», «t_body_accelerometer_std_y», «t_body_accelerometer_std_z» - standart deviation of a processed body accelerometer signal 

*«t_gravity_accelerometer_std_x», «t_gravity_accelerometer_std_y», «t_gravity_accelerometer_std_z» - standart deviation of a processed gravity accelerometer signal 

*«t_body_accelerometer_jerk_std_x», «t_body_accelerometer_jerk_std_y» «t_body_accelerometer_jerk_std_z» - standart deviation of a processed  accelerometer jerk signal 

*«t_body_gyroscope_std_x»,   «t_body_gyroscope_std_y»,  «t_body_gyroscope_std_z» - standart deviation of a processed  gyroscope signal 

*«t_body_gyroscope_jerk_std_x», «t_body_gyroscope_jerk_std_y», «t_body_gyroscope_jerk_std_z» - standart deviation of a processed gyroscope  Jerk signal 

*«t_body_accelerometer_magnitude_std» - standart deviation of an accelerometer acceleration signal magnitudenitude

*«t_gravity_accelerometer_magnitude_std» - standart deviation of an accelerometer gravity signal magnitudenitude

*«t_body_accelerometer_jerk_magnitude_std» - standart deviation of an accelerometer jerc signal magnitudenitude

*«t_body_gyroscope_magnitude_std» - standart deviation of a gyroscope signal magnitudenitude

*«t_body_gyroscope_jerk_magnitude_std»  - standart deviation of an gyroscope jerc signal magnitudenitude

*«f_body_accelerometer_std_x» , «f_body_accelerometer_std_y», «f_body_accelerometer_std_z» - standart deviation of an accelerometer frequency domain signal

*«f_body_accelerometer_jerk_std_x» , «f_body_accelerometer_jerk_std_y» , «f_body_accelerometer_jerk_std_z» - standart deviation of an accelerometer jerk frequency domain signal

*«f_body_gyroscope_std_x», «f_body_gyroscope_std_y», «f_body_gyroscope_std_z» - standart deviation of an gyroscope frequency domain signal

*«f_body_accelerometer_magnitude_std» -  standart deviation of an accelerometer frequency domain signal magnitudenitude

*«f_body_body_accelerometer_jerk_magnitude_std» - standart deviation of an accelerometer jerk frequency domain signal magnitudenitude

*«f_body_body_gyroscope_magnitude_std» - standart deviation of an gyroscope  frequency domain signal magnitudenitude

*«f_body_body_gyroscope_jerk_magnitude_std» - standart deviation of an gyroscope jerk  frequency domain signal magnitudenitude

*«t_body_accelerometer_mean_x», «t_body_accelerometer_mean_y», «t_body_accelerometer_mean_z» - mean value of a processed body accelerometer signal 

*«t_gravity_accelerometer_mean_x», «t_gravity_accelerometer_mean_y», «t_gravity_accelerometer_mean_z» - mean value of a processed accelerometer gravity signal 

*«t_body_accelerometer_jerk_mean_x»,   «t_body_accelerometer_jerk_mean_y»,  «t_body_accelerometer_jerk_mean_z» - mean value of a processed  accelerometer jerk signal 

*«t_body_gyroscope_mean_x», «t_body_gyroscope_mean_y», «t_body_gyroscope_mean_z» - mean value of a processed  gyroscope signal 

*«t_body_gyroscope_jerk_mean_x», «t_body_gyroscope_jerk_mean_y», «t_body_gyroscope_jerk_mean_z» - mean value of a processed gyroscope  Jerk signal 

*«t_body_accelerometer_magnitude_mean» - mean value of an accelerometer signal magnitudenitude

*«t_gravity_accelerometer_magnitude_mean» - mean value of an an accelerometer gravity signal magnitudenitude

*«t_body_accelerometer_jerk_magnitude_mean» - mean value of an accelerometer jerk signal magnitudenitude

*«t_body_gyroscope_magnitude_mean» - mean value of a gyroscope signal magnitudenitude

*«t_body_gyroscope_jerk_magnitude_mean» - mean value of an gyroscope jerc signal magnitudenitude

*«f_body_accelerometer_mean_x», «f_body_accelerometer_mean_y», «f_body_accelerometer_mean_z» - mean value of an accelerometer frequency domain signal

*«f_body_accelerometer_jerk_mean_x», «f_body_accelerometer_jerk_mean_y», «f_body_accelerometer_jerk_mean_z» - mean value of an accelerometer jerk frequency domain signal

*«f_body_gyroscope_mean_x», «f_body_gyroscope_mean_y», «f_body_gyroscope_mean_z» - mean value of a gyroscope frequency domain signal

*«f_body_accelerometer_magnitude_mean»  - mean value of an accelerometer frequency domain signal magnitudenitude

*«f_body_body_accelerometer_jerk_magnitude_mean» - mean value of an accelerometer jerk frequency domain signal magnitudenitude

*«f_body_body_gyroscope_magnitude_mean» - mean value of an gyroscope  frequency domain signal magnitudenitude

*«f_body_body_gyroscope_jerk_magnitude_mean» - mean value of an gyroscope jerk  frequency domain signal magnitudenitude
