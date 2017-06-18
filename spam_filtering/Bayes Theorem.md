# Naive Bayes Classifier

## Source:  
1 . http://eneskemalergin.github.io/blog/classification_with_naive_bayes/  
2 . http://sebastianraschka.com/Articles/2014_naive_bayes_1.html  
  
## Concept of Bayesian Methods:  

Bayesian probability theory is rooted in the idea that the estimated likelihood of an event, or a potential outcome, should be based on  the evidence at hand across multiple trials, or opportunities for the event to occur.  

## Understanding Probability:

Probability of an event = number of trials(in which the events occured)/total number of trials.

Example : 
-if it rained 3 out of 10 days (conditions same as today), probability of raining today P(R)= 3/10 = 0.3 (30 percent)
-if 10 out 50 emails were spam, probability of incoming email to be spam P(S)= 10/50 = 0.2 (20 percent)

Probability of all the possible outcomes of a trial must always sum to 1

P(R)+P(-R)=1 ; P(R)- probability of raining,P(-R)- probability of not raining
P(S)+P(-S)=1 ; P(S)- probability of spam,P(-S)- probability of not not spam

P(-R) = 1-P(R)= 1-0.3 = 0.7
P(-S) = 1-P(S)= 1-0.2 = 0.8

![alt text](https://github.com/jishu1989/MachineLearning/blob/master/spam_filtering/understanding%20probability.JPG)


This concludes **rain and will not rain, spam and not spam are mutually exclusive and exhaustive events ~ which means they cannot occur at the same time, and there is only one possible outcome**

## Understanding Joint Probability:





## Naive Bayes Classification:  
  
  Naive Bayes Classifiers are linear classifiers , they are simple but very efficient.The model of Naive Baye's classifier is dependent   on Baye's Theorem.It is assumed the dataset is mutually independent.But strong violations of the independence assumptions and 
  non-linear classification problems can lead to very poor performances of naive Bayes classifiers. Baye's classifier is used mainly in
  text classification.  
  
  ![alt text](https://github.com/jishu1989/MachineLearning/blob/master/spam_filtering/joint%20prob.JPG)
  
  
