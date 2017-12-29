smokerData <- read.csv(file='C://Users//Jishu//Downloads//smoker.csv',sep=',',header=T)
#data2= head(smokerData)

level_name = levels(smokerData$Smoke)
outerloop = 1:length(level_name)
p_smoke = as.character(smokerData$Smoke)
#temp=rep(0,length(p_smoke)):shouldnot be here
for(j in outerloop)
{
  temp=rep(0,length(p_smoke))
  #key->putting inside forloop, helps to initialize temp as 0 vector,for each iteration 
  a = which(p_smoke==level_name[j])
  #checks a level name:"current" with entire column -> create a newcol->smoke_levelname
  name1 <- level_name[j]
  name1 <- paste0("Smoker_",name1)#new column name
  if(length(a)>0)#value greater than 0 i.e 1 -> that means a match,0 no match
  {
    temp[a]=1#assigning 1 to vector temp where value of a is a match
    
  }
  print(temp)
  smokerData[name1]=temp#pasting value of temp vector on empty smoke_levelname column
}