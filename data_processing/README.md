# COOKBOOK...ITS AN EXPERIENCE     

In this repo, I am sharing my practical learnings I had while preprocessing data.The real data cleaning and processing challenges, I faced while working on different projects. I am trying to document my experiences, since they are priceless and can't be learnt from reading a tutorial or book. 

## lapply and sapply:  
lapply and sapply are similar functions, which are used to traverse over set of data,calling a specified function for each data in the dataset.But basic difference between sapply and lapply , lapply returns a **list** whereas sapply returns a **vector**.
```
> a=lapply(1:3,function(x) x^2)
> a
[[1]]
[1] 1

[[2]]
[1] 4

[[3]]
[1] 9

> a[0]
list()
> typeof(a)
[1] "list"
> a[[0]]
Error in a[[0]] : 
  attempt to select less than one element in get1index <real>
> a[[1]]
[1] 1
```
