data(iris)
t=length(levels(iris$Species))

for (i in 1:t) {
  
  name1 = i
  name1 <- paste0("Species_",name1)
  iris[name1]<-0
  for (j in 1:n) {
    
    
  }
}

iris$Species_1 <-ifelse (iris$Species=="setosa",1,0)
iris$Species_2 <-ifelse (iris$Species=="versicolor",1,0)
iris$Species_3 <-ifelse (iris$Species=="virginica",1,0)