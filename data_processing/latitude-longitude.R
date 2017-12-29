data1 = data.frame(country=c("Finland","Sweden","Norway","Denmark","Sweden","Finland"))
data1 =cbind.data.frame(data1,lat=c(0,0,0,0,0,0))
data1 =cbind.data.frame(data1,long=c(0,0,0,0,0,0))

data1 = as.data.frame(data1)



data1$lat[data1$country=="Finland"]<-61.92411
data1$long[data1$country=="Finland"]<-25.748151

data1$lat[data1$country=="Sweden"]<-60.128161
data1$long[data1$country=="Sweden"]<-18.643501

data1$lat[data1$country=="Denmark"]<-56.26392
data1$long[data1$country=="Denmark"]<-9.501785

data1$lat[data1$country=="Norway"]<-60.472024
data1$long[data1$country=="Norway"]<-8.468946