rm(list=ls())

MedicalAppointment<-read.csv(file="C:/Users/Orlando/Dropbox/513/Project/KaggleV2-May-2016.csv")

# DATASET ANALYSIS

# DATASET NOMALIZATION FUNCTION
mmnorm<-function(x){
  z<-((x-min(x))/(max(x)-min(x)))
  return(z)  
}

# CLEANNING DATASET
ID = MedicalAppointment[,2]
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

data <- cbind(ID,Gender,Interval,Age,Scholarship,Hipertension,Diabetes,Alcoholism,Handcap,SMS_received,No_show)
## age>0 and nomalize age
data <- data[data[,4]>0,]
## nomalize age and Handcap
data[,3] <- mmnorm(data[,3])
data[,4] <- mmnorm(data[,4])
data[,9] <- mmnorm(data[,9])

head(data)

dataf<-data.frame(data[,1])
for(i in 2:ncol(data)){
  dataf<-cbind(dataf,as.factor(data[,i]))
}

colname_data<-colnames(data)
colnames(dataf)<-colname_data

# remove the id column
dataf<-dataf[,-1]

head(dataf)

index <- seq (1,nrow(dataf),by=5)
test<-dataf[index,]
training<-dataf[-index,]

library(e1071)
nBayes_diag <- naiveBayes( No_show~., data =training[,-9])
nBayes_Prediction <- predict( nBayes_diag, test[,-9])

# print confusion matrix and error rate
table(actual=test[,"No_show"],nBayes_Prediction )
wrong<- (test[,"No_show"]!=nBayes_Prediction )
error_rate<-sum(wrong)/length(wrong)
error_rate 

