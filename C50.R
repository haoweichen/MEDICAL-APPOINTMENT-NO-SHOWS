{
  rm(list=ls())
  library(class)
  # install.packages("C50")
  require(C50)
  MedicalAppointment<-read.csv(file="/Users/ben/Dropbox/Stevens/CS513 Data Mining/Project/KaggleV2-May-2016-raw.csv")
  
  # DATASET ANALYSIS
  
  # DATASET NOMALIZATION FUNCTION
  mmnorm<-function(x){
    z<-((x-min(x))/(max(x)-min(x)))
    return(z)  
  }
  mmnorm.3<-function(x){
    z<-((x-min(x))/(max(x)-min(x)))
    return (3*z)
  }
  
  # CLEANNING DATASET
  Gender = factor(MedicalAppointment[,3])
  Interval = as.integer(as.Date(MedicalAppointment[,5])-as.Date(MedicalAppointment[,4])) 
  Age <- MedicalAppointment[,6]
  Neighbourhood <- as.factor(MedicalAppointment[,7])
  Scholarship <- MedicalAppointment[,8]
  Hipertension <- MedicalAppointment[,9]
  Diabetes <- MedicalAppointment[,10]
  Alcoholism <- MedicalAppointment[,11]
  Handcap <- MedicalAppointment[,12]
  SMS_received <- MedicalAppointment[,13]
  No_show <- factor(MedicalAppointment[,14])
  
  data <- cbind(Gender,Interval,Age,Scholarship,Hipertension,Diabetes,Alcoholism,Handcap,SMS_received,No_show)
  ## exclude age<=0
  data <- data[data[,3]>0,]
  ## nomalize age and Handcap
  data[,"Gender"] <- mmnorm(data[,"Gender"])
  data[,"Age"] <- mmnorm(data[,"Age"])
  #data[,"Neighbourhood"] <- mmnorm(data[,"Neighbourhood"])
  data[,"Handcap"] <- mmnorm(data[,"Handcap"])
  data[,"Interval"] <- mmnorm(data[,"Interval"])
}
{
  # reset to have core features
  data<-cbind(Gender,Interval,Age,Scholarship,Hipertension,Diabetes,Alcoholism,Handcap,SMS_received,No_show)
  # no SMS_received
  # data<-data[,c("Age", "Neighbourhood", "No_show", "Diabetes", "Alcoholism", "Hipertension", "Scholarship")]
  #-grep("SMS_received", colnames(data))
}
{
  idx<-sample(nrow(data),as.integer(.70*nrow(data)))
  training<-data[idx,]
  test<-data[-idx,]
  
  model<-C5.0(training[,-grep("No_show", colnames(training))],as.factor(training[,"No_show"]))
  p1 <- predict(model, test)
  table(test[,"No_show"], Predicted = p1)
  plot(model)
  #attr(result,"prob")
  #table(test[,"No_show"], result)
  
  error<-(test[,"No_show"]!=p1 )
  error.rate<-sum(error)/length(error)
}
error.rate 
table(test[,"No_show"], p1)
