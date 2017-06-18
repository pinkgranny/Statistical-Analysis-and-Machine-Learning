# Bayesian Probability

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

![alt text](https://github.com/jishu1989/MachineLearning/blob/master/spam_filtering/joint%20prob.JPG)  

The virus circle doesnot completely fill the spam circle, nor is it completely contained by the spam circle. This implies not all spam messages contain the word virus, and not every email with the word virus is a spam.  

![alt text](https://github.com/jishu1989/MachineLearning/blob/master/spam_filtering/jp_close.JPG)  

If spam and virus where two **independent** events.Since 20% of the emails were spam P(spam)=20/100=0.20 and 5% of emails contained the word virus P(virus)=5/100=0.05, So the email which are spam and contained the word virus **P(spam ∩ virus)= P(spam) X P(virus)**= 0.20 X 0.05 = 0.01. i.e 1% of the all emails.

## Conditional Probability:  

The calculation for dependent events is more complex.Relationship between dependent events can be described using **Baye's theorem**.  

```
Formula :  P(A/B) = P(A ∩ B)/P(B) #P(A/B), probability of event A given that event B has occurred.
```

Frequency|Virus-Yes|Virus-No|Total  
---------|---------|--------|-----
Spam|4|16|20
Not Spam|1|79|80  
Total|5|95|100  

Likelihood|Virus-Yes|Virus-No|Total  
---------|---------|--------|-----
Spam|4/20|16/20|20
Not Spam|1/80|79/80|80  
Total|5/100|95/100|100
 
  
  
  
  
