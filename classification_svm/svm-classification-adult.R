load("C:\\Users\\Jishu\\Desktop\\cd\\adult\\ver2.Rdata")


#--------------classification-------------------#
ax <- adult1$sex  
new_Data <- adult1[,-10]
new_Data1 <- cbind(new_Data,ax) 

install.packages("e1071", dep = TRUE)

library(e1071)

install.packages('caret', repos='http://cran.rstudio.com/')
library(caret) # for confusion matrices

fold <- 4 # 5 fold cross validation

num <- ncol(new_Data1)
data <- new_Data1[-32561,]
newLabel  <- data[,num]  ##  Data Labels created 
sampleNum <- length(newLabel)
########  n fold cross validation (LOOCV) ########

ste <- floor(sampleNum/fold)  # each fold size of data
indx <- c(1:length(newLabel))
#indx <- row.names(data1)
j<-1
#F1 <- c()
acc <- c()
sensitivity_svm <- c()
specificity_svm <- c()
#precision_svm <-  c()
#recall_svm <- 
sample_test <- c()
sample_train <- c()
count <- 1

for(i in 1:fold){
  start <- count
  count <- i*ste
  sample_test <- indx[start:count]   # test index
  sample_train <- indx[-c(start:count)]  # training index
  
  train_in <- data[sample_train,-num] # training sample
  train_out <- newLabel[sample_train] # training  sample label
  
  test_in <- data[sample_test,-num] # test sample
  test_out <- newLabel[sample_test] # test sample
  
  model <- e1071::svm(train_in, train_out, kernel="linear") # SVM model generate
  predsvm1 <- predict(model,test_in) # class prediction
  tab <- table(predsvm1,test_out) # confusion matrix
  #print(tab)
  cm<-confusionMatrix( predsvm1,  test_out)  #confusion matrix
  acc[j] <- cm$overall[1] # accuracy
  ######  macro avaraging is done here ########
  sensitivity_svm[j] <-  mean(cm$byClass[,1]) # sensitivity
  specificity_svm[j] <-  mean(cm$byClass[,2]) # specificity
  # precision_svm[j]  <-  mean(cm$byClass[,5])  # Precision 
  #recall_svm[j]  <-  mean(cm$byClass[,6])     #recall
  
  #F1[j] <- mean(cm$byClass[,7])               # F1 Score
  
  j<-j+1
}

## Mean  calculation #######
acc_mean <- mean(acc)*100 # mean of accuracy
#AF1    <-  mean(F1)       # Avarage F1 score
sensitivity_mean <- mean(sensitivity_svm)*100 # sensitivity
specificity_mean <-  mean(specificity_svm)*100 # specificity
# precision_mean <-  mean(precision_svm)*100 # precision
# recall_mean  <-  mean(recall_svm)*100  # recall 

## Standard Error calculation ###### 
Sd_acc = sd(acc)/sqrt(length(acc)) # mean Standered error
Sd_sens = sd(sensitivity_svm)/sqrt(length(sensitivity_svm)) # mean Standered error
Sd_spec = sd(specificity_svm)/sqrt(length(specificity_svm)) # mean Standered error

### allScore #######

#Afone <-  c(precision_mean,  recall_mean,  AF1)
allScore <- c(acc_mean, Sd_acc, sensitivity_mean, Sd_sens, specificity_mean, Sd_spec)
## Print Results ######
print("Accuracy,    Sd_acc,  sensitivity,    Sd_sens,   specificity,   Sd_spec")
print(allScore)


end.time <- Sys.time()
TimeElaps <-  end.time -start.time 
print(TimeElaps)
