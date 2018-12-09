# Lung Capacity Data

  ## source: 
http://www.statslectures.com/index.php/r-stats-datasets

 ## dataset:

Lung Capacity dataset consists of 725 observation and 6 variables. ```dim(Lung)``` gives the dimensions of the dataset.
After loading the data using ```read.table``` we can check the dataset from the workspace.
![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/dataset.JPG)

**LungCap** : Lung Capacity of the person

**Age** : Age of the person

**Height** : Height of the person

**Smoker** : Whether the person is a smoker or not(Non Smoker)

**Gender** : Whether the person is male or female

**Caesarean** : Whether the person born is by Caesarean process or not

Note: Later we will be discussing more the data and their types.

```head(Lung)``` displays the first 6 rows, and ```tail(Lung)``` displays last 6 rows of the dataset.
![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/head_6.JPG)     

![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/tail_6.JPG)

```names(Lung) ``` or ```colnames(Lung)``` displays the column names.
![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/column_names.JPG)

```mean(Lung$Age)``` , calculates the mean of age variable , we can also find it after attaching the dataset, in that case we don't need
to type ```Lung$Age``` everytime during our computation. For instance :

 ``` attach(Lung)#attaching the Lung Capacity Dataset ```
   ``` mean(Age)#finding the mean of age variable ``` 

mean age of the samples present is 12.3269.

Taking a plot of the age : ```plot(Age)``` , rather the age group.

![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/age_plot.JPG)

 ## data types:
 
 Basically data can be divided into two categories : Quantitative(*Numerical*) and Qualitative(*Categorical*).
 
 Numerical/Quantitative variable can be further divided into : Continuous and Discrete.
 
 **Continuous** variables take on any number of infinite values within a given range.
 **Discrete** variables take specific set of numeric values.
 
 Whereas Categorical variables are of two types : Regular and Ordinal
 
 Example of Ordinal : 1st, 2nd , 3rd..., sick vs. healthy, guilty vs. not guilty, true vs. false
 
 Here in this data set we use the following set of commands to investigate the data, and their data types:
 
 ```class(Lung$LungCap)#"numeric"
class(Lung$Age)#"integer"
class(Lung$Height)#"numeric"
class(Lung$Smoke)#"factor"
class(Lung$Gender)#"factor"
class(Lung$Caesarean)#"factor"
#levels
levels(Lung$Smoke)#"no"  "yes"
levels(Lung$Gender)#"female" "male"
levels(Lung$Caesarean)#"no"  "yes"
```

LungCap(Lung Capacity) is a numeric, Age is integer, Height is numeric, Smoke is a factor - since it consists of categorical variable Smoker vs. NonSmoker, same for Gender and Caesarean. ```levels``` command tells us the factors for categorical variables.

 ## digging the data:
 
 Summary of the data:
 
 ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/summary.JPG)
 
 Finding the mean age of the female and the male population ```mean(Lung$Age[Lung$Gender=="female"]) #12.44972```, ```mean(Lung$Age[Lung$Gender=="male"]) #12.20708```.
 
 ```FemData = Lung[Lung$Gender=="female",]#all the columns where gender is female```
   ```MaleData = Lung[Lung$Gender=="male",]#all the columns where gender is male```
   
 disecting the data set into Female and Male data, then trying to figure out the mean lung capacity of the male population and the female population present.
   
 ```mean(MaleData$LungCap)``` -> 8.309332(mean Lung Capacity of the male population)
   
   ```median(MaleData$Height)``` -> 66.1(median height of the male population)

Here we are trying to create another column 'FemSmoke', and add it to the dataset , which will list down 'TRUE', for a person who is female and she smokes.

```
FemSmoke= (Gender=="female"& Smoke=="yes")
#careful with levels "female" cannot be "Female"
#"yes" cannot be "Yes" - returns false results
MoreData=cbind(Lung,FemSmoke)
MoreData[1:5,]
```
 ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/more_data.JPG)
 
 
 
 
 
 
 

 
 
 







