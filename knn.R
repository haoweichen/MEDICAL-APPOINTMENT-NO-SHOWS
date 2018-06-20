rm(list=ls())

MedicalAppointment<-read.csv("C:/Users/Orlando/Dropbox/513/Project/KaggleV2-May-2016.csv", sep=",", na.strings = "")

# DATASET ANALYSIS

# DATASET NOMALIZATION FUNCTION
mmnorm<-function(x){
  z<-((x-min(x))/(max(x)-min(x)))
  return(z)  
}

# CLEANNING DATASET
Gender = factor(MedicalAppointment[,3])
Interval = as.integer(as.Date(MedicalAppointment[,5])-as.Date(MedicalAppointment[,4])) 
Age <- MedicalAppointment[,6]
Scholarship <- MedicalAppointment[,8]
Hipertension <- MedicalAppointment[,9]
Diabetes <- MedicalAppointment[,10]
Alcoholism <- MedicalAppointment[,11]
Handcap <- MedicalAppointment[,12]
SMS_received <- MedicalAppointment[,13]
No_show <- factor(MedicalAppointment[,14])

data <- cbind(Gender,Interval,Age,Scholarship,Hipertension,Diabetes,Alcoholism,Handcap,SMS_received,No_show)
## age>0 and nomalize age
data <- data[data[,3]>0,]
## nomalize age and Handcap and interval and gender
data[,3] <- mmnorm(data[,3])*3.5
data[,8] <- mmnorm(data[,8])
data[,2] <- mmnorm(data[,2])*3.5
data[,1] <- mmnorm(data[,1])

#rm(list=ls())

#data <- read.csv("/Users/haoweichen/Desktop/KaggleV2-May-2016.csv",sep=",", na.strings = "")
data=na.omit(data)
data<-data[0:30000,]
data

head(data)

nrow(data)

d = data[,c(1,2,3,4,5,6,7,8,9,10)]

# Store every fifthrecord in a "test" dataset starting with the first record
idx=seq(from=1,to=nrow(d),by=3)
test<-d[idx,]
training<-d[-idx,]

head(training)
library(class)

# Romove the Nth record in training data set While the Nth record is being predicted
predict<-knn(training[,-grep("No_show", colnames(training))], test[,-grep("No_show", colnames(test))], training[,"No_show"],k=8)
predict

results<-cbind(test, as.character(predict))
head(results, 100)

# Measure the performance of knn
error_list<-results[,10]!=results[,11]
error_rate<-sum(error_list)/length(error_list)
print(error_rate)

table(predict, actual=test[,"No_show"])

