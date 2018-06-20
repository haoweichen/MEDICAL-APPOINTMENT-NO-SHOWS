rm(list=ls())
{
  installed.packages('caret')
  library(neuralnet)
  #library(caret)
  
  MedicalAppointment<-read.csv(file="/Users/ben/Dropbox/Stevens/CS513 Data Mining/Project/KaggleV2-May-2016.csv")
  
  # DATASET ANALYSIS
  
  # DATASET NOMALIZATION FUNCTION
  mmnorm<-function(x){
    z<-((x-min(x))/(max(x)-min(x)))
    return(z)  
  }
  
  # CLEANNING DATASET
  Gender <- as.character(MedicalAppointment[,"Gender"])
  Gender[which(Gender=='F')]<-'0'
  Gender[which(Gender=='M')]<-'1'
  # Gender <- as.factor(Gender)
  Gender <- as.numeric(Gender)
  Interval = as.integer(as.Date(MedicalAppointment[,5])-as.Date(MedicalAppointment[,4])) 
  Age <- MedicalAppointment[,6]
  Neighbourhood <- as.factor(MedicalAppointment[,7])
  Scholarship <- MedicalAppointment[,8]
  Hipertension <- MedicalAppointment[,9]
  Diabetes <- MedicalAppointment[,10]
  Alcoholism <- MedicalAppointment[,11]
  Handcap <- MedicalAppointment[,12]
  SMS_received <- MedicalAppointment[,13]
  
  No_show <- as.character(MedicalAppointment[,"No.show"])
  No_show[which(No_show=='No')]<-0
  No_show[which(No_show=='Yes')]<-1
  No_show<-as.numeric(No_show);
  
  data <- cbind(Gender,Interval,Age,Scholarship,Hipertension,
                Diabetes,Alcoholism,SMS_received,No_show)
  #data <- data.frame(Gender, Interval, Age, Scholarship, Hipertension, 
  #                   Diabetes, Alcoholism, SMS_received, No_show)
  
  ## exclude age<=0
  data <- data[data[,"Age"]>0,]
  ## nomalize age Handcap, Interval
  data[,"Age"] <- mmnorm(data[,"Age"])
  #data[,"Handcap"] <- mmnorm(data[,"Handcap"])
  data[,"Interval"] <- mmnorm(data[,"Interval"])
  # Neighbourhood
  #data.temp<-cbind(Neighbourhood)
  #data[,"Neighbourhood"] <- mmnorm(data.temp[,"Neighbourhood"])
  
  #data <- model.matrix(~No_show+Gender+Interval+Age+Scholarship+Hipertension+Diabetes+Alcoholism+SMS_received, 
  #  data = data)
}
{
  idx<-sample(nrow(data)*0.7,as.integer(.70*nrow(data)*0.7))
  training<-data[idx,]
  test<-data[-idx,]
  
  bpn <- neuralnet(No_show~Gender+Interval+Age+Scholarship+Hipertension+Diabetes+Alcoholism+SMS_received, 
                   data=training, hidden=c(5,3), threshold=0.01, stepmax=1e6)
  #bpn <- neuralnet(No_show~Gender+Interval+Age+Scholarship+Hipertension+Diabetes+Alcoholism+SMS_received, 
  #                 data=training, hidden = c(2,4),learningrate = 0.01)
  
  prediction <- compute(bpn,test[,1:8])
  prediction.round <- sapply(prediction$net.result,round)
  plot(bpn)
  
  table(prediction.round,test[,"No_show"])
  error<-(test[,"No_show"]!=prediction.round )
  error.rate<-sum(error)/length(error)
  error.rate 
  
  #預測最佳神經元參數組合
  #model <- train(form = No_show~., data=training, method = "neuralnet", 
  #               tuneGrid = expand.grid(.layer1 = c(1:4), .layer2 = c(1:4), .layer3 = c(0)), learningrate = 0.01)
  #model
  
}

