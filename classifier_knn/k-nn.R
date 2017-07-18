#load wisconsin breast cancer data
wbcd <- read.csv("C://Users//Jishu//Desktop//statistics with R//MLR//data//wisc_bc_data.csv", stringsAsFactors = FALSE)

str(wbcd) #view of the data : 569 obs-rows/32-cols

wbcd=wbcd[-1]#deleting column1 since it does not provide useful information

table(wbcd$diagnosis) #B->357,M->212

#to make B-Benign and M- Malignant
wbcd$diagnosis<- factor(wbcd$diagnosis, levels = c("B", "M"),labels = c("Benign", "Malignant"))

round(prop.table(table(wbcd$diagnosis)) * 100, digits = 1)

summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])


normalize <- function(x){
  
  return((x - min(x))/(max(x) - min(x)))
}

#normalizing 2:31 columns _n is provided to understand normalized dataset
wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

#checking transformation was applied
summary(wbcd_n$area_mean)

wbcd_train <- wbcd_n[1:469, ]#train set
wbcd_test <- wbcd_n[470:569, ]#test set

wbcd_train_labels <- wbcd[1:469, 1]#label_training_Set
wbcd_test_labels <- wbcd[470:569, 1]#label_test_set

#training model on the data

install.packages("class")
library(class)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test,
                      cl = wbcd_train_labels, k = 21)


#performance evaluation

install.packages("gmodels")
library(gmodels)

CrossTable(x = wbcd_test_labels, y = wbcd_test_pred,
           prop.chisq=FALSE)

#improving performance:

wbcd_z <- as.data.frame(scale(wbcd[-1]))

#checking the summary to verify z-transformation is in action
summary(wbcd_z$area_mean)

#creating train and test dataset from z-transformed data

wbcd_z_train <- wbcd_z[1:469, ]
wbcd_z_test <- wbcd_z[470:569, ]
wbcd_z_train_labels <- wbcd[1:469, 1]
wbcd_z_test_labels <- wbcd[470:569, 1]

wbcd_z_test_pred <- knn(train = wbcd_z_train, test = wbcd_z_test,
                      cl = wbcd_z_train_labels, k = 21)

#cross table

CrossTable(x = wbcd_z_test_labels, y = wbcd_z_test_pred,
           prop.chisq = FALSE)