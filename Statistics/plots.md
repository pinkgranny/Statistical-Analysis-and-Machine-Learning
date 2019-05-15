
 ## visualizing the data with charts:
 
 * **Barchart**
 
 Barcharts and pie charts are appropriate to summarize the distribution of **categorical variable**.Barchart is the visual display of frequency for each category of categorical variable/ relative frequency of each category.
 
 Frequency table can be generated using the ```table()``` command. For instance ```table(Gender)``` creates the frequency table for Gender variable.
 
 ![alt text](https://github.com/jishu1989/Statistical-Analysis-and-Machine-Learning/blob/master/Statistics/screenshot/barplot/freq_gender.JPG)
 
 ```barplot(count,main = "Count",xlab="Gender",ylab="count")```
 
 We can see there are 358 females and 367 males in the sample.
 ![alt text](https://github.com/jishu1989/Statistical-Analysis-and-Machine-Learning/blob/master/Statistics/screenshot/barplot/barplot_count.JPG)
 
 To express the barplots as relative frequencies or percentages:
   ```table(Gender)/725```
  
  ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/barplot/gender_percent.JPG)
  
  ```barplot(percent, main = "Percent",xlab="Gender",ylab="%",las=1)```
  
  ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/barplot/barplot_percent.JPG)
  
  Plotting the barchart horizontally:
  
  ```
  #to plot horizontally 

barplot(count,main = "Count",ylab="Gender",xlab="count",
        names.arg = c("Female","Male"),horiz = TRUE)

#names.arg to change the default "female","male"
```
  ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/barplot/count_horiz.JPG)
  
 * **Piechart**
   
```
#pie-chart
pie(count,main = "Count")
box()
```
![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/barplot/pie_chart.JPG)

 * **BoxPlot**
 
 A boxplot is appropriate for summarizing the distribution of **numeric variable**.
 
 ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/boxplot.JPG)
 
 Visualizing the entire dataset in boxplot:
 
 ```boxplot(Lung,main ="LungCap Dataset",xlab="columns",ylab="values",las=1)```
 
 ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/boxplot/bp_dataset.JPG)
 
 Boxplot for LungCap:
 
 ```
quantile(LungCap)
boxplot(LungCap,main ="LungCap", las=1,ylab="Lung Capacity",ylim=c(0,16),las=1)
 ```
 
 ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/boxplot/bp_lungcap.JPG)
 
 We can also do a comparative analysis of two groups based on a single variable, for instance -
 male female ratio based on Lung Capacity.
 
 ```
 #boxplot for lung capacity differentiated by Gender variable
boxplot(LungCap~Gender,main="Boxplot by Gender",ylab="Lung Capacity")
```
 ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/boxplot/Lungcap_Gender.JPG)
 
 * **Stratified Boxplot**: Stratified boxplot is useful in examining relationship between categorical variable and numeric
   variable, within strata or group defined by third categorical variable.
   
   For instance here we will be examine the relationship between Smoking and LungCapacity data with respect to age strata.
 
   Creating AgeGroups: In this dataset we have a ```min(Age) #3``` and ```max(Age) #19``` so we divide the age variable into 
   following groups : "<13","14/15","16/17","18+"
   
   ```AgeGroup=cut(Age,breaks = c(0,13,15,17,25),labels = c("<13","14/15","16/17","18+"))```

    ```levels(AgeGroup)```

 Here is a boxplot comparing LungCapacity of smoker and non smokers:

```boxplot(LungCap~Smoke,main="Lung Capacity Smoker vs. NonSmoker",ylab="Lung Capacity")```

  ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/stratified/smoker_nonsmoker.JPG)

*Inference : The box plot shows the smokers have larger lung capacity than non smokers, this is because of the age effect, the smokers are older in age than the non-smokers.Older people have bigger bodies than the children.*
 
Now taking the AgeStrata in consideration we can see the effect of Smoking on the lung capacity more closely:
 
 ```boxplot(LungCap[Age>=18]~Smoke[Age>=18],main="Smoker vs. NonSmoker 18+",ylab="Lung Capacity",las=1)```
 
 For 18+ age strata, NonSmokers have greater lung capacity than Smokers
 
  ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/stratified/smoker_nonsmoker18%2B.JPG)
 
 Visualizing Lung Capacity of different Age Groups for Smoker and Non Smokers:
 
 ```boxplot(LungCap~Smoke*AgeGroup,main="Smoker vs. NonSmoker All Groups",ylab="Lung Capacity",las=2,col=c(4,2))```
 
   ![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/stratified/all_groups1.JPG)
 
 Below Script is to plot Lung Capacity of different Age Groups for Smoker and Non Smokers with legends:
 
 ```boxplot(LungCap~Smoke*AgeGroup,main="Smoker vs. NonSmoker All Groups",ylab="Lung Capacity",las=2,col=c(4,2))

boxplot(LungCap~Smoke*AgeGroup,main="Smoker vs. NonSmoker All Groups",
        ylab="Lung Capacity",xlab="Age Strata",las=2,col=c(4,2),axes=F)

box()
axis(2,at=seq(0,20,2),seq(0,20,2),las=1)
axis(1,at=c(1.5,3.5,5.5,7.5),labels = c("<13","14/15","16/17","18+"))

legend(x=5.5,y=4.5,legend=c("NonSmoke","Smoke"),col = c(4,2),pch = 15,cex = 0.8)
```
![alt text](https://github.com/jishu1989/BioStatistical-Approach/blob/master/Lung_Capacity_Data/screenshot/stratified/all_groups2.JPG)

 * **Histograms** : Histograms are appropriate for summarizing the distribution of numeric variable.
