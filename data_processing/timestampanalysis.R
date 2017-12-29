data2 = data.frame(time= c("2013-06-24 14:21:06.000", 
                           "2013-06-24 12:21:06.000", 
                           "2013-06-24 15:21:06.000",
                           "2013-06-24 16:21:06.000", 
                           "2013-06-24 22:21:06.000", 
                           "2013-06-24 19:21:06.000",
                           "2013-06-24 16:21:06.000", 
                           "2013-06-24 15:21:06.000", 
                           "2013-06-24 21:21:06.000",
                           "2013-06-24 23:21:06.000" ))



data2$time <- strptime(x = as.factor(data2$time),
                                format = "%Y-%m-%d %H:%M:%S")

b <- data.frame(btime = matrix(0, ncol = 1, nrow = 10))
data2 = cbind.data.frame(data2,b)

data2$btime <- ifelse(data2$time > "2013-06-24 16:00:00.000","0", "1")

data2$hour<- format(data2$time,"%H:%M:%S")
