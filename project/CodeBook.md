# Human Activity Recognition Using Smartphones Dataset

Data collected from the experiments that have been carried out with a group of 30 volunteers within age bracket of 19-48. Each person performed six activities:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING.

## Description

Original data were collected from group of persons wearing a smartphone(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope to captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50 Hz. The experiments have been video recored and label the data manually. The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% of the test data.

Time Domain signals of accelerometer were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The acceleration signal was the seperated into body and gravity acceleration signal using another low pass Butherworth filter with a corner frequency of 0.3 Hz

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these 3-dimensional signal were calculated using the Euclidean norm.

Finally, a Fast Fourier Transform(FFT) was applied to some of these signals are produced

#### All features available
All features which calculated from process mention above are available at 
* Datasource: [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

_File descriptions from datasource using for analysis:_
- _train/X_train.txt:_ each activity contain 561 features which is randomly selected (70% of overall data) using as training dataset
- _train/y_train.txt:_ label activity for each training data
- _train/subject_train.txt:_ label person who perform activity for each training data

- _test/X_test.txt:_ each activity contain 561 features which is randomly selected (70% of overall data) using as testing dataset
- _test/y_test.txt:_ label activity for each testing data
- _test/subject_test.txt:_ label person who perform activity for each testing data

- _activity_labels.txt:_ full activity name which refer by activity index in label activity data
- _features.txt:_ full description of all features available in original data

## Tidy data(filter only specify measurement)
From all features available in training/testing data set. Training and testing are merged as one data set containing information of features, subject and activity. Extracts only the measurement on the mean and standard deviation for each measurement. Finally, calculated average of each measurement for each activity and subject. Result in "tidy_data.txt"

## Naming features for tidy data
From 561 features detail available in "features.txt". Name of features using in each measurement of tidy data are transformed from feature description by the following methods
1. replace "-" with "_"
2. remove all parameters contain in breacket "()"
3. replace word "Acc" by "_acc" which mean using data from accelerometer signal
4. replace replicate word "BodyBody" with "Body" which mean using data from accelerometer(body)
5. replace word "Gyro" with "_gyro" which mean using data from gyrometer
6. replace word "Jerk" with "_jerk" which mean using dervied data as jerk signal
7. replace word "Mag" with "_mag" which mean using calculated magnitude data calculated from euclidean norm
8. use lowercase text	
9. word "body" mean using data from accelerometer(body)
10. word "gravity" mean using data from accelerometer(gravity)

## Feature description selected for tidy data
### Time Domain
Time domain signal of accelerometer in XYZ direction. Using low pass Butherworth filter to seperate body(tbody_acc) and gravity(tgravity_acc) signal. Estimated value from signal by mean.
- tbody_acc_mean_x
- tbody_acc_mean_y
- tbody_acc_mean_z
- tgravity_acc_mean_x
- tgravity_acc_mean_y
- tgravity_acc_mean_z

-----------------------------------
Time domain signal of accelerometer in XYZ direction. Using low pass Butherworth filter to seperate body(tbody_acc) and gravity(tgravity_acc) signal. Estimated value from signal by standard deviation.
- tbody_acc_std_x
- tbody_acc_std_y
- tbody_acc_std_z
- tgravity_acc_std_x
- tgravity_acc_std_y
- tgravity_acc_std_z

-----------------------------------
Time domain signal of gyrometer(tbody_gyro) in XYZ direction. Estimated value from signal by mean.
- tbody_gyro_mean_x
- tbody_gyro_mean_y
- tbody_gyro_mean_z

-----------------------------------
Time domain signal of gyrometer(tbody_gyro) in XYZ direction. Estimated value from signal by standard deviation.
- tbody_gyro_std_x
- tbody_gyro_std_y
- tbody_gyro_std_z

-----------------------------------
The body linear acceleration(tbody_acc) were derived in time to obtain Jerk signals. Estimated value from signal by mean.
- tbody_acc_jerk_mean_x
- tbody_acc_jerk_mean_y
- tbody_acc_jerk_mean_z

-----------------------------------
The body linear acceleration(tbody_acc) were derived in time to obtain Jerk signals. Estimated value from signal by standard deviation.
- tbody_acc_jerk_std_x
- tbody_acc_jerk_std_y
- tbody_acc_jerk_std_z

-----------------------------------
The angular velocity(tbody_gyro) were derived in time to obtain Jerk signals. Estimated value from signal by mean.
- tbody_gyro_jerk_mean_x
- tbody_gyro_jerk_mean_y
- tbody_gyro_jerk_mean_z

-----------------------------------
The angular velocity(tbody_gyro) were derived in time to obtain Jerk signals. Estimated value from signal by standard deviation.
- tbody_gyro_jerk_std_x
- tbody_gyro_jerk_std_y
- tbody_gyro_jerk_std_z

-----------------------------------
The magnitude of body linear acceleration(tbody_acc) signals were calculated using the Euclidean norm. Estimated value from signal by mean.
- tbody_acc_mag_mean()

-----------------------------------
The magnitude of body linear acceleration(tbody_acc) signals were calculated using the Euclidean norm. Estimated value from signal by standard deviation.
- tbody_acc_mag_std()

-----------------------------------
The magnitude of gravity acceleration(tGravity) signals were calculated using the Euclidean norm. Estimated value from signal by mean.
- tgravity_acc_mag_mean()

-----------------------------------
The magnitude of gravity acceleration(tGravity) signals were calculated using the Euclidean norm. Estimated value from signal by standard deviation.
- tgravity_acc_mag_std()

-----------------------------------
The magnitude of Jerk signal from body linear acceleration(tbody_acc_jerk) were calculated using the Euclidean norm. Estimated value from signal by mean.
- tbody_acc_jerk_mag_mean()

-----------------------------------
The magnitude of Jerk signal from body linear acceleration(tbody_acc_jerk) were calculated using the Euclidean norm. Estimated value from signal by standard deviation.
- tbody_acc_jerk_mag_std()

-----------------------------------
The magnitude of gravity acceleration(tgravity_acc_jerk) signals were calculated using the Euclidean norm. Estimated value from signal by mean.
- tgravity_acc_mag_mean()

-----------------------------------
The magnitude of gravity acceleration(tgravity_acc_jerk) signals were calculated using the Euclidean norm. Estimated value from signal by standard deviation.
- tgravity_acc_mag_std()

-----------------------------------
The magnitude of angular velocity(tbody_gyro) signals were calculated using the Euclidean norm. Estimated value from signal by mean.
- tbody_gyro_mag_mean()

-----------------------------------
The magnitude of angular velocity(tbody_gyro) signals were calculated using the Euclidean norm. Estimated value from signal by standard deviation.
- tbody_gyro_mag_std()

-----------------------------------
The magnitude of Jerk signal from angular velocity(tbody_gyro_jerk) were calculated using the Euclidean norm. Estimated value from signal by mean.
- tbody_gyro_jerk_mag_mean()

-----------------------------------
The magnitude of Jerk signal from angular velocity(tbody_gyro_jerk) were calculated using the Euclidean norm. Estimated value from signal by standard deviation.
- tbody_gyro_jerk_mag_std()


### Frequency domain
Fast Fourier Transform(FFT) was applied to time domain signal of accelormeter(tbody_acc) in XYZ direction. Using low pass Butherworth filter to seperate body(tbody_acc) and gravity(tgravity_acc) signal. Estimated value from signal by mean.
- fbody_acc_mean_x
- fbody_acc_mean_y
- fbody_acc_mean_z

-----------------------------------
Fast Fourier Transform(FFT) was applied to time domain signal of accelerometer(tbody_acc) in XYZ direction. Using low pass Butherworth filter to seperate body(tbody_acc) and gravity(tgravity_acc) signal. Estimated value from signal by standard deviation.
- fbody_acc_std_x
- fbody_acc_std_y
- fbody_acc_std_z

-----------------------------------
Fast Fourier Transform(FFT) was applied to Jerk signal from body linear acceleration(tbody_acc_jerk) in XYZ direction. Estimated value from signal by mean.
- fbody_acc_jerk_mean_x
- fbody_acc_jerk_mean_y
- fbody_acc_jerk_mean_z

-----------------------------------
Fast Fourier Transform(FFT) was applied to Jerk signal from body linear acceleration(tbody_acc_jerk) in XYZ direction. Estimated value from signal by standard deviation.
- fbody_acc_jerk_std_x
- fbody_acc_jerk_std_y
- fbody_acc_jerk_std_z

-----------------------------------
Fast Fourier Transform(FFT) was applied to angular velocity(tbody_gyro) signals in XYZ direction. Estimated value from signal by standard deviation.
- fbody_gyro_mean_x
- fbody_gyro_mean_y
- fbody_gyro_mean_z

-----------------------------------
Fast Fourier Transform(FFT) was applied to angular velocity(tbody_gyro) signals in XYZ direction. Estimated value from signal by standard deviation.
- fbody_gyro_std_x
- fbody_gyro_std_y
- fbody_gyro_std_z

-----------------------------------
Fast Fourier Transform(FFT) was applied to the magnitude of accelerometer signal(tbody_acc_mag) which calculated using the Euclidean norm. Estimated value from signal by mean.
- fbody_acc_mag_mean()

-----------------------------------
Fast Fourier Transform(FFT) was applied to the magnitude of accelerometer signal(tbody_acc_mag) which calculated using the Euclidean norm. Estimated value from signal by standard deviation.
- fbody_acc_mag_std()

-----------------------------------
Fast Fourier Transform(FFT) was applied to Magnitude of Jerk signal from body linear acceleration(tbody_acc_jerk) in XYZ direction using the Euclidean norm. Estimated value from signal by mean.
- fbody_acc_jerk_mag_mean()

-----------------------------------
Fast Fourier Transform(FFT) was applied to Magnitude of Jerk signal from body linear acceleration(tbody_acc_jerk) in XYZ direction using the Euclidean norm. Estimated value from signal by standard deviation.
- fbody_acc_jerk_mag_std()

-----------------------------------
Fast Fourier Transform(FFT) was applied to Magnitude of gyrometer signal using the Euclidean norm. Estimated value from signal by mean.
- fbody_gyro_mag_mean()

-----------------------------------
Fast Fourier Transform(FFT) was applied to Magnitude of gyrometer signal using the Euclidean norm. Estimated value from signal by standard deviation.
- fbody_gyro_mag_std()

-----------------------------------
Fast Fourier Transform(FFT) was applied to Magnitude of Jerk signal from gyrometer(tbody_gyro_jerk) signals using the Euclidean norm. Estimated value from signal by mean.
- fbody_gyro_jerk_mag_mean()

-----------------------------------
Fast Fourier Transform(FFT) was applied to Magnitude of Jerk signal from gyrometer(tbody_gyro_jerk) signals using the Euclidean norm. Estimated value from signal by standard deviation.
- fbody_gyro_jerk_mag_std()

-----------------------------------
