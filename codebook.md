---
title: "Tidy UCI HAR Data Codebook"
author: "rrr0189"
date: "8/12/2020"
output: html_document
---

#### <b>Overview</b> (from the problem statement):

<i>"One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. "</i>


#### <b>Overview</b> (from the UCI README):

<i> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

</i>

#### <b>Further Remarks:</b>

According to the website cited directly below, the measurements have been normalized to be within the interval [-1, 1], perhaps to make machine learning smoother. This was done prior to receiving the raw data. That is, the raw data contains normalized measurements.

The data was obtained from the UC-Irvine Center for Machine Learning and Intelligent Systems: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. A thorough description of the data, as well as the README referred to above, is provided at this link.

<b> A remark on time:</b>

Categorized as a "time series," the time dimension is explained as follows (per the UCI README at the link):

<i>"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window)."</i>

Thus, each [subject, activity] combination in the data set represents the aforementioned fixed-width sliding windows, with rows <i>cascading chronologically</i>, having the data frame partitioned by [subject, activity]. We have chosen to represent the data on one data table; we would otherwise make "time intervals" as a primary key to link to other tables. Such a column has been omitted on purpose, and we instead provide this explanation.


### <b>Token Dictionary: Anatomy of a Variable</b>

Each variable name is composed of tokens. The description of each token is given below. A combination of these tokens will consequently produce a variable definition.



|  Token  |                Token Description ("Indicates that the measurement is___")               |
|:-------:|--------------------------------------------------|
| time | in the time domain, with <i>seconds</i> as the base unit. |
| freq | in in the frequency domain, with <i>Hertz</i> (inverted seconds) as the base unit. |
| Body | with respect to the body motion component, captured by sensors attached to the subject's body. |
| Gravity | with respect to the gravitational motion component. |
| Accel | in reference to linear acceleration, measured by an accelerometer. |
| Gyro | in reference to angular velocity, measured by a gyroscope, captured at a constant rate of 50Hz. |
| Jerk | in reference to the third derivative with respect to time (i.e. a tri-axial gradient vector). |
| Mean | the mean value of some coinciding measurement. |
| Std |  the standard deviation of some coinciding measurement. |
| X | in the direction of the X-axis. |
| Y | in the direction of the Y-axis. |
| Z | in the direction of the Z-axis. |
| Mag | the Euclidean norm of the tri-axial measurement. |

<b> NOTE:</b> For variables with the <b>Mag</b> token, the <b>Mean</b> and <b>Std</b> tokens follow it. This means that the mean and standard deviation calculations are made <i>after</i> taking the Euclidean norm of the tri-axial components.

#### <b>  Variable Definitions </b>

| Variable | Variable Definition |
|:-------------:|---------------------------------|
|subject| A factor variable; the anonymous participant of the experiment; range from 1 to 30.|
|activity| A factor variable; the activity that the subject was partaking in for the set of measurements at some instance of time. Activities are one of (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).|
|timeBodyAccelMeanX| Mean value of the body motion component of acceleration in the X direction in the time domain.|
|timeBodyAccelMeanY| Mean value of the body motion component of acceleration in the Y direction in the time domain.|
|timeBodyAccelMeanZ| Mean value of the body motion component of acceleration in the Z direction in the time domain.|
|timeBodyAccelStdX| Standard deviation of the body motion component of acceleration in the X direction in the time domain.|
|timeBodyAccelStdY| Standard deviation of the body motion component of acceleration in the Y direction in the time domain.|
|timeBodyAccelStdZ| Standard deviation of the body motion component of acceleration in the Z direction in the time domain.|
|timeGravityAccelMeanX| Mean value of the gravity motion component of acceleration in the X direction in the time domain.|
|timeGravityAccelMeanY| Mean value of the gravity motion component of acceleration in the Y direction in the time domain.|
|timeGravityAccelMeanZ| Mean value of the gravity motion component of acceleration in the Z direction in the time domain.|
|timeGravityAccelStdX| Standard deviation of the gravity motion component of acceleration in the X direction in the time domain.|
|timeGravityAccelStdY| Standard deviation of the gravity motion component of acceleration in the Y direction in the time domain.|
|timeGravityAccelStdZ| Standard deviation of the gravity motion component of acceleration in the Z direction in the time domain.|
|timeBodyAccelJerkMeanX| Mean value of the third derivative with respect to time, using the body motion component of acceleration, in the X direction.|
|timeBodyAccelJerkMeanY| Mean value of the third derivative with respect to time, using the body motion component of acceleration, in the Y direction.|
|timeBodyAccelJerkMeanZ| Mean value of the third derivative with respect to time, using the body motion component of acceleration, in the Z direction.|
|timeBodyAccelJerkStdX| Standard deviation of the third derivative with respect to time, using the body motion component of acceleration, in the X direction.|
|timeBodyAccelJerkStdY| Standard deviation of the third derivative with respect to time, using the body motion component of acceleration, in the Y direction.|
|timeBodyAccelJerkStdZ| Standard deviation of the third derivative with respect to time, using the body motion component of acceleration, in the Z direction.|
|timeBodyGyroMeanX| Mean value of the body motion component of angular velocity in the X direction in the time domain.|
|timeBodyGyroMeanY| Mean value of the body motion component of angular velocity in the Y direction in the time domain.|
|timeBodyGyroMeanZ| Mean value of the body motion component of angular velocity in the Z direction in the time domain.|
|timeBodyGyroStdX| Standard deviation  of the body motion component of angular velocity in the X direction in the time domain.|
|timeBodyGyroStdY| Standard deviation  of the body motion component of angular velocity in the Y direction in the time domain.|
|timeBodyGyroStdZ| Standard deviation  of the body motion component of angular velocity in the Z direction in the time domain.|
|timeBodyGyroJerkMeanX| Mean value of the third derivative with respect to time, using the body motion component of angular velocity, in the X direction.|
|timeBodyGyroJerkMeanY| Mean value of the third derivative with respect to time, using the body motion component of angular velocity, in the Y direction.|
|timeBodyGyroJerkMeanZ| Mean value of the third derivative with respect to time, using the body motion component of angular velocity, in the Z direction.|
|timeBodyGyroJerkStdX| Standard deviation of the third derivative with respect to time, using the body motion component of angular velocity, in the X direction.|
|timeBodyGyroJerkStdY| Standard deviation of the third derivative with respect to time, using the body motion component of angular velocity, in the Y direction.|
|timeBodyGyroJerkStdZ| Standard deviation of the third derivative with respect to time, using the body motion component of angular velocity, in the Z direction.|
|timeBodyAccelMagMean| Mean value of the Euclidean norm of the body motion component of acceleration, in the time domain.|
|timeBodyAccelMagStd| Standard deviation of the Euclidean norm of the body motion component of acceleration, in the time domain.|
|timeGravityAccelMagMean| Mean value of the Euclidean norm of the gravity motion component of acceleration, in the time domain.|
|timeGravityAccelMagStd| Standard deviation of the Euclidean norm of the gravity motion component of acceleration, in the time domain.|
|timeBodyAccelJerkMagMean| Mean value of the third derivative with respect to time, using the Euclidean norm of the body motion component of acceleration.|
|timeBodyAccelJerkMagStd| Standard deviation of the third derivative with respect to time, using the Euclidean norm of the body motion component of acceleration.|
|timeBodyGyroMagMean| Mean value of the Euclidean norm of the body motion component of angular velocity, in the time domain.|
|timeBodyGyroMagStd| Standard deviation of the Euclidean norm of the body motion component of angular velocity, in the time domain.|
|timeBodyGyroJerkMagMean| Mean value of the third derivative with respect to time, using the Euclidean norm of the body motion component of angular velocity.|
|timeBodyGyroJerkMagStd| Standard deviation of the third derivative with respect to time, using the Euclidean norm of the body motion component of angular velocity.|
|freqBodyAccelMeanX| Mean value of the body motion component of acceleration in the X direction, in the frequency domain.|
|freqBodyAccelMeanY| Mean value of the body motion component of acceleration in the Y direction, in the frequency domain.|
|freqBodyAccelMeanZ| Mean value of the body motion component of acceleration in the Z direction, in the frequency domain.|
|freqBodyAccelStdX| Standard deviation of the body motion component of acceleration in the X direction, in the frequency domain.|
|freqBodyAccelStdY| Standard deviation of the body motion component of acceleration in the Y direction, in the frequency domain.|      
|freqBodyAccelStdZ| Standard deviation of the body motion component of acceleration in the Z direction, in the frequency domain.|
|freqBodyAccelJerkMeanX| Mean value of the third derivative with respect to time, using the body motion component of acceleration in the X direction, in the frequency domain.|
|freqBodyAccelJerkMeanY| Mean value of the third derivative with respect to time, using the body motion component of acceleration in the Y direction, in the frequency domain.|
|freqBodyAccelJerkMeanZ| Mean value of the third derivative with respect to time, using the body motion component of acceleration in the Z direction, in the frequency domain.|
|freqBodyAccelJerkStdX| Standard deviation of the third derivative with respect to time, using the body motion component of acceleration in the X direction, in the frequency domain.|
|freqBodyAccelJerkStdY| Standard deviation of the third derivative with respect to time, using the body motion component of acceleration in the Y direction, in the frequency domain.|
|freqBodyAccelJerkStdZ| Standard deviation of the third derivative with respect to time, using the body motion component of acceleration in the Z direction, in the frequency domain.|
|freqBodyGyroMeanX| Mean value of the body motion component of angular velocity in the X direction, in the frequency domain.|
|freqBodyGyroMeanY| Mean value of the body motion component of angular velocity in the Y direction, in the frequency domain.|
|freqBodyGyroMeanZ| Mean value of the body motion component of angular velocity in the Z direction, in the frequency domain.|        
|freqBodyGyroStdX| Standard deviation of the body motion component of angular velocity in the X direction, in the frequency domain.|
|freqBodyGyroStdY| Standard deviation of the body motion component of angular velocity in the Y direction, in the frequency domain.|
|freqBodyGyroStdZ| Standard deviation of the body motion component of angular velocity in the Z direction, in the frequency domain.|
|freqBodyAccelMagMean| Mean value of the Euclidean norm of the body motion component of acceleration, in the frequency domain.|
|freqBodyAccelMagStd| Standard deviation of the Euclidean norm of the body motion component of acceleration, in the frequency domain.|    
|freqBodyAccelJerkMagMean| Mean value of the third derivative with respect to time, using the body motion component of acceleration, in the frequency domain.|
|freqBodyAccelJerkMagStd| Standard deviation of the third derivative with respect to time, using the body motion component of acceleration, in the frequency domain.|
|freqBodyGyroMagMean| Mean value of the Euclidean norm of the body motion component of the angular velocity, in the frequency domain.|
|freqBodyGyroMagStd| Standard deviation of the Euclidean norm of the body motion component of the angular velocity, in the frequency domain.|
|freqBodyGyroJerkMagMean| Mean value of the Euclidean norm of third derivative with respect to time, using the  body motion component of angular velocity, in the frequency domain.|
|freqBodyGyroJerkMagStd| Standard deviation of the Euclidean norm of third derivative with respect to time, using the  body motion component of angular velocity, in the frequency domain.|

