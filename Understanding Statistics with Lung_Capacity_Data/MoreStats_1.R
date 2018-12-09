#-------Descriptive Statistics :Mean, Standard Deviation, Frequencies---------#

#interest:summaries of numeric and categorical variable
#quantify the center of spread and of the distribution

#study: categorical variable and numeric variable : LungCapacity

#categorical variable - smoke

table(Smoke) # freq table

table(Smoke)/725 #percent

length(Smoke)

table(Smoke)/length(Smoke)

table(Smoke,Gender)#contingency

#numeric variable - Lung Capacity

mean(LungCap) #arithmetic mean

#trimmed mean 

mean(LungCap, trim=0.10)# remove top 10 and bottom 10

#median

median(LungCap)

#variance

var(LungCap)

sqrt(var(LungCap))^2

#standard deviation

sd(LungCap)

sqrt(var(LungCap))

min(LungCap)#minimum

max(LungCap)#maximum

range(LungCap)

#to calculate specific quantile or percentile

quantile(LungCap, probs=0.90)


#multiple percentile

quantile(LungCap, probs=c(0.20,0.5,0.9,1))

mean=sum(LungCap)/725

cor(LungCap,Age)# Pearson Correlation is the default

cor(LungCap,Age,method="spearman")

cov(LungCap,Age)#covariance

var(LungCap,Age)#covariance

summary(LungCap)

summary(Smoke)

summary(Lung)

#---------------------Probability Distribution-----------------------#

         #---------****Binomial Distribution****---------#

#we can find the probability of binomial using pbinom or dbinom commands

#dbinom : probability density function

#for probability x=3, sample size=20, probability of success=1/6

dbinom(x=3,size=20,prob=1/6)#probability of X exactly 3 success, from 20 samples

#multiple probability return

dbinom(x=0:3,size=20,prob=1/6)#P(X=0),P(X=1)...P(X=3)

#probability of less than equal to 3 success
#P(X<=3) i.e P(X=0) or P(X=1) or P(X=2) or P(X=3) successes


sum(dbinom(x=0:3,size=20,prob=1/6))

#pbinom : probability distribution function

#using pbinom we can also find the #P(X<=3)

pbinom(x=3,size=20,prob=1/6,lower.tail=T)#lower.tail=T : for less than equal to 3

#rbinom : random sample from a binomial distribution

#qbinom : quantiles of a binomial distribution


           #---------****Poisson Distribution****---------#


# X follows poisson distribution of rate lambda=7
# X~poisson(lambda=7)

#ppois: probability distribution #dpois: probability density function

dpois(x=4,lambda=7)

#P(X=0),P(X=1)...P(X=4)

dpois(x=0:4,lambda=7)

#P(X<=4)

sum(dpois(x=0:4,lambda=7))

ppois(q=4,lambda=7,lower.tail=T)

#P(X>=12)

ppois(q=12,lambda=7,lower.tail=F)

#rpois: random sample from poisson distribution

#qpois: find quantiles for poisson distribution


                #---------****Normal Distribution****---------#


#X is normally distributed with a mean of 75 and sd=5

#X~N(mu=75,sigma^2=5^2)

#pnorm : probability distribution from normal distribution,

#qnorm : quantiles and percentiles from normal distribution

#rnorm : random sample from normal distribution

#P(X<=70)- lower tail=T-> left of the value

pnorm(q=70,mean=75,sd=5,lower.tail=T)

#P(X>=85) lower tail=F-> right of the value

pnorm(q=85,mean=75,sd=5,lower.tail=F)

#P(Z>=1)

pnorm(q=1,mean=0,sd=1,lower.tail=F)

# find first quartile for the variable

qnorm(p=0.25,mean=75,sd=5,lower.tail=T)

#dnorm : probability density function

x=seq(from=55,to=95,by=0.25)

density = dnorm(x,mean=75,sd=5)

plot(x,density)

plot(x,density,type="l")

abline(v=75)# line at mean v=parameter for mean

rand = rnorm(n=40,mean=75,sd=5)

hist(rand)


                  #---------****t-Distribution****---------#


#can be used to calculate p-values/critical values
#calculating confidence interval for statistics following t-distribution

#pt

#t-stat=2.3 ,df=25(degrees of freedom)

pt(q=2.3,df=25,lower.tail=F) #P(t>2.3)

#two-sided p-value

pt(q=2.3,df=25,lower.tail=F)+pt(2.3,df=25,lower.tail=T) #P(t>2.3) #P(t>2.3)


pt(2.3,df=25,lower.tail=F)*2 #P(t>2.3)

#find t for 95% confidence
#value of t with 2.5% in each tail

qt(p=0.025,df=25,lower.tail=T)















