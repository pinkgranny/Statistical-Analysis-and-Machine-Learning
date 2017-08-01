# Naive Bayes Classification:  
  
  Naive Bayes Classifiers are linear classifiers , they are simple but very efficient.The model of Naive Baye's classifier is dependent   on Baye's Theorem.It is assumed the dataset is mutually independent.But strong violations of the independence assumptions and 
  non-linear classification problems can lead to very poor performances of naive Bayes classifiers. Baye's classifier is used mainly in
  text classification. 
  
  ## Data:  
  
  The dataset contains SMS messages , unwanted messages labelled spam and wanted message labelled as ham.The descriptive view of the data :  
  
  ```
  > str(sms_raw)
'data.frame':	5574 obs. of  2 variables:
 $ type: chr  "ham" "ham" "spam" "ham" ...
 $ text: chr  "Go until jurong point, crazy.. Available only in bugis n great world la e buffet... Cine there got amore wat..." "Ok lar... Joking wif u oni..." "Free entry in 2 a wkly comp to win FA Cup final tkts 21st May 2005. Text FA to 87121 to receive entry question(std txt rate)T&C"| __truncated__ "U dun say so early hor... U c already then say..." ...
 ```
 The dataset consists of 5574 observations and 2 variables. The sms type is coded : spam and ham, type is a character variable.
 Exploring the dataset we find there are 4827 ham and 747 spam.
 ```
 > table(sms_raw$type)

 ham spam 
4827  747 
>
```  
## Processing Text data for Analysis:  
```tm``` package is installed , ```library(tm)``` is called,it is good package for text processing/NLP.
