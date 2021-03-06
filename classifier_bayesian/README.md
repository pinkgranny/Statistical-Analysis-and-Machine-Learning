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
Figure : Spam | Figure : Ham  
:------------:|:------------:
![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_bayesian/spam.jpeg) | ![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_bayesian/ham.jpeg)  

```findFreqTerms()``` function of ```tm``` package,returns a character vector containing the words that appear for at least the specified number of times. For instance,the below code displays the words appearing at least five times in the sms_dtm_train matrix.  

```
> findFreqTerms(sms_dtm_train, 5)
   [1] "available"       "bugis"           "cine"            "crazy"          
   [5] "got"             "great"           "point"           "wat"            
   [9] "world"           "lar"             "wif"             "apply"          
  [13] "comp"            "cup"             "entry"           "final"          
  [17] "free"            "may"             "receive"         "text"           
  [21] "txt"             "win"             "wkly"            "already"        

> head(findFreqTerms(sms_dtm_train, 5))
[1] "available" "bugis"     "cine"      "crazy"     "got"       "great"    
> tail(findFreqTerms(sms_dtm_train, 5))
[1] "murdered" "murderer" "police"   "budget"   "happens"  "thurs"   
> 
```
We assign ```sms_freq_words=findFreqTerms(sms_dtm_train, 5)```, then create a training and test dataset for the dtm dataset. The sms_dtm_train data set :  
```
> str(sms_dtm_train)
List of 6
 $ i       : int [1:32237] 1 1 1 1 1 1 1 1 1 1 ...
 $ j       : int [1:32237] 1 2 3 4 5 6 7 8 9 10 ...
 $ v       : num [1:32237] 1 1 1 1 1 1 1 1 1 1 ...
 $ nrow    : int 4169
 $ ncol    : int 7958
 $ dimnames:List of 2
  ..$ Docs : chr [1:4169] "1" "2" "3" "4" ...
  ..$ Terms: chr [1:7958] "amore" "available" "buffet" "bugis" ...
 - attr(*, "class")= chr [1:2] "DocumentTermMatrix" "simple_triplet_matrix"
 - attr(*, "weighting")= chr [1:2] "term frequency" "tf"
```
Now we sms_dtm_freq_train and test dataset using the sms_freq_words, the words that appear at least 5 times.  
```
sms_dtm_freq_train <- sms_dtm_train[ , sms_freq_words]
sms_dtm_freq_test <- sms_dtm_test[ , sms_freq_words]
```  
The training and test datasets now include 1,136 features, which correspond to words appearing in at least five messages.  

Since,Naive Bayes classifier is typically trained on data with categorical features.This poses a problem, since the cells in the sparse matrix are numeric and measure the number of times a word appears in a message. We need to change this to a categorical variable that simply indicates yes or no depending on whether the word appears at all.  ```convert_counts()``` function converts count to strings : Yes/No.  

```
sms_train <- apply(sms_dtm_freq_train, MARGIN = 2,
                   convert_counts)

sms_test <- apply(sms_dtm_freq_test, MARGIN = 2,
                  convert_counts)
```  
The apply() function allows a function to be used on each of the rows or columns in a matrix. It uses a MARGIN parameter to specify either rows or columns. Here, we'll use MARGIN = 2, since we're interested in the columns (MARGIN = 1 is used for rows).  
The result will be two character type matrixes, each with cells indicating "Yes" or "No" for whether the word represented by the column appears at any point in the message represented by the row.  

## Training a model on the data:  

We installed ```install.packages("e1071") library(e1071)```  a package by TU Wein for machine learning.Unlike the k-NN algorithm we used for classification in the previous chapter, a Naive Bayes learner is trained and used for classification in separate stages.  

To build model on sms_train matrix, we use the following command:```sms_classifier <- naiveBayes(sms_train, sms_train_labels)```  
```sms_classifier``` object now contains naiveBayes classifier that now can be used to make prediction.  
```
sms_train_labels          No         Yes
            ham  0.998613037 0.001386963
            spam 1.000000000 0.000000000

                looks
sms_train_labels          No         Yes
            ham  0.998335645 0.001664355
            spam 1.000000000 0.000000000

                idea
sms_train_labels          No         Yes
            ham  0.998058252 0.001941748
            spam 1.000000000 0.000000000

                away
sms_train_labels          No         Yes
            ham  0.996116505 0.003883495
            spam 0.996453901 0.003546099

                fantastic
sms_train_labels          No         Yes
            ham  0.999445215 0.000554785
            spam 0.994680851 0.005319149

                aftr
sms_train_labels          No         Yes
            ham  0.998613037 0.001386963
            spam 1.000000000 0.000000000

                dey
sms_train_labels          No         Yes
            ham  0.998613037 0.001386963
            spam 1.000000000 0.000000000

                sit
sms_train_labels          No         Yes
            ham  0.998613037 0.001386963
            spam 1.000000000 0.000000000

                students
sms_train_labels         No        Yes
            ham  0.99889043 0.00110957
            spam 1.00000000 0.00000000

                wer
sms_train_labels          No         Yes
            ham  0.999445215 0.000554785
            spam 1.000000000 0.000000000
``` 

## Evaluation of Model and its Performance:  
To evaluate the sms classifier, we need to test its predictions on unseen messages in the test data.The unseen message features are stored in a matrix named sms_test, while the class labels (spam or ham) are stored in a vector name sms_test_labels. The classifier that we trained has been named sms_classifier.We will use this classifier to generate predictions and then compare the predicted values to the true values.
```
> sms_pred_test = predict(sms_classifier,sms_test)
> sms_pred_test
   [1] spam ham  ham  ham  ham  ham  ham  ham  ham  ham  ham  ham  ham  ham  spam ham  ham  ham  ham  ham 
  [21] ham  ham  ham  ham  ham  ham  ham  spam ham  spam spam spam ham  ham  ham  ham  ham  spam ham  ham 
  [41] ham  ham  ham  ham  ham  ham  ham  ham  ham  ham  ham  ham  ham  spam ham  ham  ham  ham  ham  ham 
  [61] ham  ham  ham  ham  ham  ham  ham  spam spam ham  ham  ham  ham  ham  spam ham  ham  ham  ham  spam

> head(sms_pred_test)
[1] spam ham  ham  ham  ham  ham 
Levels: ham spam
```  
Now below we use ```CrossTable()``` function of ```gmodels``` package, and also use dnn parameter dimension to eliminate unnecessary cell proportion and relabel the rows and columns.  

```
> CrossTable(sms_pred_test, sms_test_labels,
+            prop.chisq = FALSE, prop.t = FALSE,
+            dnn = c('predicted', 'actual'))

 
   Cell Contents
|-------------------------|
|                       N |
|           N / Row Total |
|           N / Col Total |
|-------------------------|

 
Total Observations in Table:  1390 

 
             | actual 
   predicted |       ham |      spam | Row Total | 
-------------|-----------|-----------|-----------|
         ham |      1203 |        28 |      1231 | 
             |     0.977 |     0.023 |     0.886 | 
             |     0.995 |     0.155 |           | 
-------------|-----------|-----------|-----------|
        spam |         6 |       153 |       159 | 
             |     0.038 |     0.962 |     0.114 | 
             |     0.005 |     0.845 |           | 
-------------|-----------|-----------|-----------|
Column Total |      1209 |       181 |      1390 | 
             |     0.870 |     0.130 |           | 
-------------|-----------|-----------|-----------|
```  
Looking at the table, we can see that a total of only 6 + 30 = 36 of the 1,390 SMS messages were incorrectly classified (2.6 percent). Among the errors were 6 out of 1,207 ham messages that were misidentified as spam, and 30 of the 183 spam messages were incorrectly labeled as ham.  

This is the reason why Naive Bayes is the standard for text classification;directly out of the box, it performs surprisingly well.






