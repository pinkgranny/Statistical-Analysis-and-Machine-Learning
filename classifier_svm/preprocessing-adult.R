data = read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data",
                  sep=",",header=F,col.names=c("age", "type_employer", "fnlwgt", "education", 
                                               "education_num","marital", "occupation", "relationship", "race","sex",
                                               "capital_gain", "capital_loss", "hr_per_week","country", "income"),
                  fill=FALSE,strip.white=T)
adult=data

path= "C:\\Users\\Jishu\\Desktop\\cd\\adult\\"
fileout = paste0(path,"ver1.Rdata")
save(adult,file=fileout)
 
load("C:\\Users\\Jishu\\Desktop\\cd\\adult\\ver1.Rdata")
adult1 = adult
#attach(adult1)

start.time <- Sys.time()

#----type_employer-----#

level_name = levels(adult1$type_employer)
observation = 1: length(adult1$type_employer)
inner_loop = 1 : length(level_name)



new_type_employer = c()
temp = adult1$type_employer
for (i in observation) {
  for (j in inner_loop) {
    if(temp[i]==level_name[j])
      new_type_employer[i] = j;
  }
  
}

adult1$type_employer=new_type_employer
#----education-----#

level_name = levels(adult1$education)
observation = 1: length(adult1$education)
inner_loop = 1 : length(level_name)

new_education = c()
temp = adult1$education
for (i in observation) {
  for (j in inner_loop) {
    if(temp[i]==level_name[j])
      new_education[i] = j;
  }
  
}

adult1$education=new_education

#----marital-----#

level_name = levels(adult1$marital)
observation = 1: length(adult1$marital)
inner_loop = 1 : length(level_name)

new_marital = c()
temp = adult1$marital
for (i in observation) {
  for (j in inner_loop) {
    if(temp[i]==level_name[j])
      new_marital[i] = j;
  }
  
}

adult1$marital=new_marital


#------occupation------#

#start.time <- Sys.time()

level_name = levels(adult1$occupation)
observation = 1: length(adult1$occupation)
inner_loop = 1 : length(level_name)

new_occupation = c()
temp = adult1$occupation
for (i in observation) {
  for (j in inner_loop) {
    if(temp[i]==level_name[j])
      new_occupation[i] = j;
  }
  
}

adult1$occupation=new_occupation

#------relationship------#

level_name = levels(adult1$relationship)
observation = 1: length(adult1$relationship)
inner_loop = 1 : length(level_name)

new_relationship = c()
temp = adult1$relationship
for (i in observation) {
  for (j in inner_loop) {
    if(temp[i]==level_name[j])
      new_relationship[i] = j;
  }
  
}

adult1$relationship=new_relationship


#------race------#

level_name = levels(adult1$race)
observation = 1: length(adult1$race)
inner_loop = 1 : length(level_name)

new_race = c()
temp = adult1$race
for (i in observation) {
  for (j in inner_loop) {
    if(temp[i]==level_name[j])
      new_race[i] = j;
  }
  
}

adult1$race=new_race

#------sex------#

level_name = levels(adult1$sex)
observation = 1: length(adult1$sex)
inner_loop = 1 : length(level_name)

new_sex = c()
temp = adult1$sex
for (i in observation) {
  for (j in inner_loop) {
    if(temp[i]==level_name[j])
      new_sex[i] = j;
  }
  
}

adult1$sex=new_sex


#------country------#

level_name = levels(adult1$country)
observation = 1: length(adult1$country)
inner_loop = 1 : length(level_name)

new_country = c()
temp = adult1$country
for (i in observation) {
  for (j in inner_loop) {
    if(temp[i]==level_name[j])
      new_country[i] = j;
  }
  
}

adult1$country=new_country



#------income------#

level_name = levels(adult1$income)
observation = 1: length(adult1$income)
inner_loop = 1 : length(level_name)

new_income = c()
temp = adult1$income
for (i in observation) {
  for (j in inner_loop) {
    if(temp[i]==level_name[j])
      new_income[i] = j;
  }
  
}

adult1$income=new_income

end.time <- Sys.time()


path= "C:\\Users\\Jishu\\Desktop\\cd\\adult\\"
fileout = paste0(path,"ver2.Rdata")
save(adult1,file=fileout)


