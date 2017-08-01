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
```tm``` package is installed , ```library(tm)``` is called,it is good package for text processing/NLP. Firstly we process text using ```corpus``` command. ```Corpus()``` command creates an R object to store text documents. ```Vector Source()``` gets the text data source.  
```
library(tm)
sms_corpus=Corpus(VectorSource(sms_raw$text))
```
In text data analysis it is important to remove stop words and other characters,we change all the characters into lowercase and get rid of numbers.  
```
corpus_clean <- tm_map(sms_corpus, content_transformer(tolower)) # all to lowercase
corpus_clean <- tm_map(corpus_clean, content_transformer(removeNumbers)) # get rid of all numbers
```  
Now cleaning the stop words, punctuation and white space.  
```
corpus_clean <- tm_map(corpus_clean, content_transformer(removeWords), stopwords()) # remove all stopwords
corpus_clean <- tm_map(corpus_clean, content_transformer(removePunctuation)) # removes all punctuation
corpus_clean <- tm_map(corpus_clean, content_transformer(stripWhitespace)) # removes additional white space
```  
```tm``` package provides functionality to tokenize SMS message, ```DocumentTermMatrix(corpus_clean)``` create a data structure called a **sparse matrix**.  

## Creating training and test datasets:

Before applying machine learning we split data into two parts test and train data. 75% of data assigned for training data and 25% for test data.  
```
#Splitting raw data frame
sms_raw_train <- sms_raw[1:4169, ]
sms_raw_test <- sms_raw[4170:5559, ]

# splitting document-term matrix
sms_dtm_train <- sms_dtm[1:4169, ]
sms_dtm_test <- sms_dtm[4170:5559, ]

# splitting corpus
sms_corpus_train <- corpus_clean[1:4169]
sms_corpus_test <- corpus_clean[4170:5559]

> prop.table(table(sms_raw_train$type))

      ham      spam 
0.8647158 0.1352842 
> prop.table(table(sms_raw_test$type))

      ham      spam 
0.8697842 0.1302158 
> table(sms_raw_train$type)

 ham spam 
3605  564 
> table(sms_raw_test$type)

 ham spam 
1209  181 
```

## Visualizing text data - Word Cloud:  

After installing ```wordcloud```, which is a way to visually depict the appearance of the words in text data.

```
> # install.packages("wordcloud")
> library(wordcloud)
Loading required package: RColorBrewer
Warning messages:
1: package ‘wordcloud’ was built under R version 3.3.3 
2: package ‘RColorBrewer’ was built under R version 3.3.2 
> 
> # Create the wordcloud diagram, most frequent ones will be close to the center
> wordcloud(sms_corpus_train, min.freq = 40, random.order = FALSE)
There were 39 warnings (use warnings() to see them)
````

![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_bayesian/wordcloud_sms_corpus_train.jpeg)  

We create subset for spam and ham, then we generate a word cloud for spam and ham.

```
# subset spam ones
spam <- subset(sms_raw_train, type=="spam")

# subset ham ones
ham <- subset(sms_raw_train, type=="ham")

wordcloud(spam$text, max.word = 40, scale= c(3, 0.5))
wordcloud(ham$text, max.word = 40, scale= c(3, 0.5))
```  
![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_bayesian/spam.jpeg)  
Figure : Spam  

![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_bayesian/ham.jpeg)   
Figure : Ham

