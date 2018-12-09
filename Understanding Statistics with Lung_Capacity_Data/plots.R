Lung=read.table(file="C:/Users/Jishu/Desktop/LungCapData.txt",header=TRUE,sep="\t")

attach(Lung)

count = table(Gender)#storing the data in a variable
#Female=358,Male=367

percent = table(Gender)/725 #to have the overall percentage of male and female

#--------------------------barchart/piechart------------------------------------#

barplot(count,main = "Count",xlab="Gender",ylab="count") #male female ratio

barplot(percent, main = "Percent",xlab="Gender",ylab="%",las=1) #male female percent ratio

#to plot horizontally 

barplot(count,main = "Count",ylab="Gender",xlab="count",
        names.arg = c("Female","Male"),horiz = TRUE)

#names.arg to change the default "female","male" to "Female","Male"

#pie-chart
pie(count,main = "Count")
box()

#---------------------------boxplots----------------------------------------------#

boxplot(LungCap,main ="LungCap", las=1)
        #,xlab="columns",ylab="values",las=1)

quantile(LungCap)
boxplot(LungCap,main ="LungCap", las=1,ylab="Lung Capacity",ylim=c(0,16),las=1)

#boxplot for lung capacity differentiated by Gender variable
boxplot(LungCap~Gender,main="Boxplot by Gender",ylab="Lung Capacity")

#-------------------------stratified boxplots-------------------------------------#


AgeGroup=cut(Age,breaks = c(0,13,15,17,25),
             labels = c("<13","14/15","16/17","18+"))

levels(AgeGroup)

boxplot(LungCap~Smoke,main="Lung Capacity Smoker vs. NonSmoker",ylab="Lung Capacity")

#AgeStrata : Closer look on the lung Capacity

boxplot(LungCap[Age>=18]~Smoke[Age>=18],main="Smoker vs. NonSmoker 18+",ylab="Lung Capacity",las=1)

boxplot(LungCap~Smoke*AgeGroup,main="Smoker vs. NonSmoker All Groups",ylab="Lung Capacity",las=2,col=c(4,2))

#boxplot with legend
boxplot(LungCap~Smoke*AgeGroup,main="Smoker vs. NonSmoker All Groups",
        ylab="Lung Capacity",xlab="Age Strata",las=2,col=c(4,2),axes=F)

box()
axis(2,at=seq(0,20,2),seq(0,20,2),las=1)
axis(1,at=c(1.5,3.5,5.5,7.5),labels = c("<13","14/15","16/17","18+"))

legend(x=5.5,y=4.5,legend=c("NonSmoke","Smoke"),col = c(4,2),pch = 15,cex = 0.8)

#--------------------------------histograms----------------------------------------#

hist(LungCap)#default

hist(LungCap,freq = F) #changing yaxis to probability density than frequency

       #OR

hist(LungCap,probability =T) #changing yaxis to probability density than frequency

hist(LungCap,probability =T,ylim=c(0,0.2))#changing the limit

#to change the bin width we use 'break'

hist(LungCap,probability =T,ylim=c(0,0.2),breaks = 7)#break=7 points creates 8bins
hist(LungCap,probability =T,ylim=c(0,0.2),breaks = 14)

#specifying break points manually
hist(LungCap,probability =T,ylim=c(0,0.2),breaks =c(0,2,4,6,8,10,12,14,16))
#or
hist(LungCap,probability =T,ylim=c(0,0.2),breaks =seq(from=0,to=16,by=2))

hist(LungCap,probability =T,ylim=c(0,0.2),breaks =seq(from=0,to=16,by=2),
     main="Histogram of Lung Capacity",xlab ="Lung Capacity",las=1)#las=1 is done to rotate the values

lines(density(LungCap),col=2,lwd=3) #adding density line to histogram

#---------------------------Stem and Leaf Plot------------------------------------#

#* **Stem and LeafPlots** : Summarizing the distribution of numeric variable

stem(LungCap[Gender=="female"])

# R lets us know decimal point is at the | line
# smallest lung capacity 0.5
# largest lung capacity 13.1

#setting scale =2 , seperates decimal 0-4 in one row rest in other
stem(LungCap[Gender=="female"],scale=2)

#-------------stack,group barcharts, Mosaic Plots-------------------------------#

#examining relationship between two categorical variable
#graphically plot relationship between gender and smoking

#contigency table

Table1 = table(Smoke,Gender)

barplot(Table1,main="Gender vs Smoke",xlab="Gender",
        ylab = "count",
        legend.text=c("NonSmoker","Smoker"),
        col=c(4,2)) #default: stacked barchart

barplot(Table1,beside=T,main="Gender vs Smoke",
        xlab="Gender",ylab = "count",
        legend.text=c("NonSmoker","Smoker"),
        col=c(4,2))#clustered barchart

#one may wish to express this plot in terms of 
#conditional probability, someone is smoking ,
#given one is female, or not female

mosaicplot(Table1)

#--------------ScatterPlots-------------------#

#Appropriate for comparing two numeric variables

#graphically relate height and age 

#Pearson's correlation - strength of linear relationship between two numeric variable

cor(Age,Height) #0.8357368 linear correlation -Age&Height

#variable entered first in x-axis,variable entered second in y-axis
plot(Age,Height) #age-x,height-y


#we can change the plotting character using pch argument
plot(Age,Height,main = "Scatterplot",
     xlab = "Age",ylab = "Height",xlim=c(0,25),col=2) 

abline(lm(Height~Age)) #adding linear regression line
abline(lm(Height~Age),col=4)#blue line

lines(smooth.spline(Age,Height))#spline is just an attribute of smooth

lines(smooth.spline(Age,Height),lty=2,lwd=5)#modifying regression line

#-----------------Modification in ScatterPlot---------------#

#cex used change size of plotting character
plot(Age,Height,main="ScatterPlot/cex=0.5",cex=0.5)

#change the font of the title
plot(Age,Height,main="ScatterPlot",font.main=4)

plot(Age,Height,main="ScatterPlot",font.main=3)

#changing font of the x-y label
plot(Age,Height,main="ScatterPlot",font.main=4,font.lab=2)

#changing font of the x-y axis
plot(Age,Height,main="ScatterPlot",font.main=4,font.lab=2,font.axis=3)

#plotting character pch
plot(Age,Height,main="ScatterPlot",pch=2)
plot(Age,Height,main="ScatterPlot",pch="w")

#plotting two variables---image
plot(Age[Gender=="male"],Height[Gender=="male"],
     col=4,pch="m",xlab="Age",ylab="Height",main="Gender ScatterPlot")
points(Age[Gender=="female"],Height[Gender=="female"],col=2,pch="f")

#other way round-----image
par(mfrow=c(1,2))

plot(Age[Gender=="male"],Height[Gender=="male"],
     xlab="Age",ylab="Height",main="Male ScatterPlot",
     xlim = c(0,20),ylim = c(45,85))

plot(Age[Gender=="female"],Height[Gender=="female"],
     xlab="Age",ylab="Height",main="Female ScatterPlot",
     xlim = c(0,20),ylim = c(45,85))

#axis() to add external axis of your own for instance:
#axis(size=1) # xaxis ,#axis(size=1) #yaxis

#axes=F removes the axes from the plot

#----------------Adding text to plot-----------------------------#

par(mfrow=c(1,1))#reset par mode
cor(Age,LungCap)#0.8196749
plot(Age,LungCap)

#adj=0, text starts from x=5
text(x=5,y=13,label="cor=0.8196749",adj=0)

#adj=1, text ends at x=5
text(x=5,y=13,label="cor=0.8196749",adj=1)

#adding and labeling mean line

abline(h=mean(LungCap),col=2,lwd=2)
text(x=3,y=9,label="mean LungCap",adj=0,cex=0.6,col=2)

#---------------Adding Legend to the plot------------------------#


plot(Age[Smoke=="no"],LungCap[Smoke=="no"],
     col=4,pch=16,xlab="Age",ylab="LungCap",
     main="Age vs. LungCap Smoke/NonSmoke")

points(Age[Smoke=="yes"],LungCap[Smoke=="yes"],
       col=2,pch=17)

legend(x=3.5,y=14,legend=c("NonSmoker","Smoker"),col=c(4,2),pch = c(16,17))













