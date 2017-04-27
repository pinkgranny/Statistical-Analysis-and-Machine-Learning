library(e1071)
#head(iris)
attach(iris)
#colnames(iris)
#x= subset(iris,select = Species)
#y= Species
# simple SVM ~ taking full data set
#svm_model = svm(Species~.,data=iris)
#summary(svm_model)
#prediction- predictive analytics
#pred = predict(svm_model,x)
#table(y,pred)
#svm_tuning performance
data1 = iris

#data sampling train data - 100, test data - 50

x_train = data1[c(1:100),-c(5)] 
y_train = data1[c(1:100),c(5)]
x_test = data1[c(101:150),-c(5)]
y_test = data1[c(101:150),c(5)]

model <- e1071::svm(x_train, y_train,kernel="radial")

pred <- predict(model,x_test)
table(pred,y_test)

svm_tune <- tune(svm, x_train, y_train, 
                 kernel="radial", ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))

print(svm_tune)

