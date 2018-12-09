#statistical-data exploration- lung capacity data

#loading a text file with tab delimited data
Lung=read.table(file="C:/Users/Jishu/Desktop/LungCapData.txt",header=TRUE,sep="\t")
#to remove an object : e.g:Lung
rm(Lung)
rm(list = ls())#remove all objects from the environment
#dimension of data - number of rows and columns
dim(Lung)
#head - first 6 rows
head(Lung)
#tail - last 6 rows
tail(Lung)
#selecting rows manually
Lung[c(3,4,5),] #selects 3,4,5
Lung[5:9,]#selects 5-9 rows
Lung[-(4:722),]#selects all rows expect 4-722 i.e : 1,2,3,723,724,725
#column names
names(Lung)
colnames(Lung)
#mean Age calculation
mean(Lung$Age)#12.3269
#other way round
attach(Lung)
mean(Age)
#to unattach Lung
detach(Lung)
#check type of variable
class(Lung$LungCap)#"numeric"
class(Lung$Age)#"integer"
class(Lung$Height)#"numeric"
class(Lung$Smoke)#"factor"
class(Lung$Gender)#"factor"
class(Lung$Caesarean)#"factor"
#levels
levels(Lung$Smoke)#"no"  "yes"
levels(Lung$Gender)#"female" "male"
levels(Lung$Caesarean)#"no"  "yes"
#summary of the data
summary(Lung)
#checking length
length(Lung$Age)
#mean age of females
mean(Lung$Age[Lung$Gender=="female"])
#mean age of males
mean(Lung$Age[Lung$Gender=="male"])
#creating male and female subset
FemData = Lung[Lung$Gender=="female",]#all the columns where gender is female
MaleData = Lung[Lung$Gender=="male",]#all the columns where gender is male
mean(MaleData$LungCap)
median(MaleData$Height)
#logical checks#
temp = Age>15
temp[1:5]
temp2 = as.numeric(Age>15)
temp2[1:5]
#cbind-rbind#
FemSmoke= (Gender=="female"& Smoke=="yes")
#careful with levels "female" cannot be "Female"
#"yes" cannot be "Yes" - returns false results
MoreData=cbind(Lung,FemSmoke)
MoreData[1:5,]

