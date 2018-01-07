# Descriptive and Inferential Statistical Analysis using Political Data  

## Data : LaLonde's data  
This is a policy focused data, analysis of this data in 1970s helped long-term unemployed people find jobs in private sector and also covered the labor cost of their employment. Well now how to get this data,we must load this data, we start by installing the package,  
```
> install.packages("cem")
Installing package into ‘/home/soumya/R/x86_64-pc-linux-gnu-library/3.4’
(as ‘lib’ is unspecified)
also installing the dependencies ‘Matching’, ‘rgenoud’, ‘MatchIt’, ‘combinat’, ‘randomForest’
> library(cem)
Loading required package: tcltk
Loading required package: lattice

How to use CEM? Type vignette("cem")
> data(LL)
> View(LL)
```  
the data has 772 observations and 12 columns, below is the summary of the data:  
```
> dim(LL)
[1] 722  12
> summary(LL)
    treated            age          education         black       
 Min.   :0.0000   Min.   :17.00   Min.   : 3.00   Min.   :0.0000  
 1st Qu.:0.0000   1st Qu.:19.00   1st Qu.: 9.00   1st Qu.:1.0000  
 Median :0.0000   Median :23.00   Median :10.00   Median :1.0000  
 Mean   :0.4114   Mean   :24.52   Mean   :10.27   Mean   :0.8006  
 3rd Qu.:1.0000   3rd Qu.:27.00   3rd Qu.:11.00   3rd Qu.:1.0000  
 Max.   :1.0000   Max.   :55.00   Max.   :16.00   Max.   :1.0000  
    married         nodegree           re74              re75        
 Min.   :0.000   Min.   :0.0000   Min.   :    0.0   Min.   :    0.0  
 1st Qu.:0.000   1st Qu.:1.0000   1st Qu.:    0.0   1st Qu.:    0.0  
 Median :0.000   Median :1.0000   Median :  823.8   Median :  936.3  
 Mean   :0.162   Mean   :0.7798   Mean   : 3630.7   Mean   : 3042.9  
 3rd Qu.:0.000   3rd Qu.:1.0000   3rd Qu.: 5211.8   3rd Qu.: 3993.2  
 Max.   :1.000   Max.   :1.0000   Max.   :39570.7   Max.   :37431.7  
      re78          hispanic           u74              u75        
 Min.   :    0   Min.   :0.0000   Min.   :0.0000   Min.   :0.0000  
 1st Qu.:    0   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000  
 Median : 3952   Median :0.0000   Median :0.0000   Median :0.0000  
 Mean   : 5455   Mean   :0.1053   Mean   :0.4529   Mean   :0.4003  
 3rd Qu.: 8772   3rd Qu.:0.0000   3rd Qu.:1.0000   3rd Qu.:1.0000  
 Max.   :60308   Max.   :1.0000   Max.   :1.0000   Max.   :1.0000  

```  




