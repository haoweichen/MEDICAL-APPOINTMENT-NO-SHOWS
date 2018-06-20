# MEDICAL-APPOINTMENT-NO-SHOWS
WHY DO 22% OF PATIENTS MISS THEIR SCHEDULED APPOINTMENTS?


## Introduction
* The data includes 110527 medical appointments of the public healthcare of the capital city of Espirito Santo State - Vitoria - Brazil
* The data contains patients’ 
  1. Gender
  2. Data of booking appointment
  3. Schedule Date
  4. Age
  5. Whether or not having scholarship, hypertension, diabetes, alchoholism, handicap and getting text message receive
* The data are from Kaggle, dataset from: https://www.kaggle.com/joniarroba/noshowappointments/downloads/KaggleV2-May-2016.csv

<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/methodology.png"/></div>


## First Step: Data Cleaning
### 1.0 Data Overview
  1. Typos
  2. Empty Values
  3. Irrelevant or redundant parts of data
  
<br><strong>GOAL: Make sure all the data we need is accurate and will not influence the overall result.</strong>

### 1.1 ScheduledDay
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/ScheduleDay.png"/></div>

### 1.2 AppointmentDay
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/appointmentday.png"/></div>

### 1.3 Day interval between ScheduledDay & AppointmentDay
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/DayIntervalBetweenScheduleedDay.png"/></div>

### 1.4 Age
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/Age.png"/></div>

### 1.5 Scholarship, Hypertension & Diabetes
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/Scholarship.png"/></div>

### 1.6 Alcoholism & SMS_received
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/Alcoholism.png"/></div>

### 1.7 Handicap
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/handicap.png"/></div>


## Second Step: Feature Selection 
### 2.1 Scheduled Day
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/scheduledday.png"/></div>

### 2.2 Appointment Day
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/appointmentday2.png"/></div>

### 2.3 Day interval between Scheduled Day & Appointment Day
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/Dayintervalbetween.png"/></div>

### 2.4 Age
* Remove age <=0 & sample < 100
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/age2.png"/></div>

### 2.5 Scholarship
* 0 means have no scholarship, 1 means do have scholarship
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/scholarship2.png"/></div>

### 2.6 Hypertension
* 0 means have no hypertension, 1 means do have hypertension
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/hypertension.png"/></div>

### 2.7 Diabetes
* 0 means have no diabetes, 1 means do have diabetes
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/diabetes.png"/></div>

### 2.8 Alcoholism
* 0 means have no alcoholism, 1 means do have alcoholism
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/alcoholism2.png"/></div>

### 2.9 Handicap
* Handicap is the total amount of handicaps a person presents, it is not binary.
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/handicap2.png"/></div>

### 2.10 SMS_received
* 0 means did not receive SMS, 1 means did receive SMS
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/sms_received.png"/></div>


## Third Step: Building Models
### 3.1 KNN
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/knn.png"/></div>

### 3.1 KNN - Performance and Weights
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/knn_performance.png"/></div>

### 3.2 Naïve Bayes
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/naivebayes.png"/></div>

### 3.2 Naïve Bayes
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/naviesbayes2.png"/></div>

### 3.3 C50
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/c50.png"/></div>

### 3.4 Random Forest
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/randomforest.png"/></div>

### 3.4 Random Forest
* MeanDecreaseAccuracy: By permuting this feature, how much accuracy will be decreased averagely
* MeanDecreaseGini: How many Gini (the lower the purer) decreased by splitting this feature averagely
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/randomforest2.png"/></div>

### 3.5 Neural Network
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/neuralNetwork.png"/></div>

### 3.5 Neural Network
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/NeuralNetwork2.png"/></div>

### 3.5 Neural Network
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/neuralNetwork3.png"/></div>

### 3.5 Neural Network
* Future work
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/futureWork.png"/></div>


## Conclusion: business approach
1. Day Interval and Age are the most influential features
<div align=center><img width="500" height="250" src="https://github.com/haoweichen/MEDICAL-APPOINTMENT-NO-SHOWS/blob/master/conclusion.png"/></div>

2. The day interval shorter, the patients more likely to show up 
3. The patients between 10 and 20 years old is probably not to show up.
4. Patients who doesn’t receive a text message are more likely to show up.


## What we learn from this project	
* Review the data before building models
* Extreme values can affect final result (remove it!)
* Feature selection is important, manually select is as effective as with using methodology
* Sometimes the relationship between features and the prediction result is inexplicable
* Precise prediction is not as easy as we think, our best error rate is <span style="color: red"><strong>19.23%</strong></span> (Naïve Bayes)
