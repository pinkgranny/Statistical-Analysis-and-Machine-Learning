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

![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_bayesian/understanding%20probability.JPG)


This concludes **rain and will not rain, spam and not spam are mutually exclusive and exhaustive events ~ which means they cannot occur at the same time, and there is only one possible outcome**

## Understanding Joint Probability:  

![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_bayesian/joint%20prob.JPG)  

The virus circle doesnot completely fill the spam circle, nor is it completely contained by the spam circle. This implies not all spam messages contain the word virus, and not every email with the word virus is a spam.  

![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_bayesian/jp_close.JPG)  

If spam and virus where two **independent** events.Since 20% of the emails were spam P(spam)=20/100=0.20 and 5% of emails contained the word virus P(virus)=5/100=0.05, So the email which are spam and contained the word virus **P(spam ∩ virus)= P(spam) X P(virus)**= 0.20 X 0.05 = 0.01. i.e 1% of the all emails.

## Conditional Probability:  

The calculation for dependent events is more complex.Relationship between dependent events can be described using **Baye's theorem**.  

```
Formula :  P(A/B) = P(A ∩ B)/P(B) #P(A/B), probability of event A given that event B has occurred.
```

We continue with our previous example, Virus-Yes : number of times the word virus is found in Spam and not Spam mails. Virus no is the complementary condition. Probability that a message is spam is 20%, i.e previously know - prior probability.  

Now we want to look close , probability of the word virus used in previously recieved 20% of spam, which we term as **likelihood**. We construct a frequency table which has the number of spam and non-spam emails listing whether they have the word virus in them or not.

Frequency|Virus-Yes|Virus-No|Total  
---------|---------|--------|-----
Spam|4|16|20
Not Spam|1|79|80  
Total|5|95|100  

In the below table we calculate the likelihood ratio of a spam and non-spam mail to contain the word virus, and not to contain the word virus.

Likelihood|Virus-Yes|Virus-No|Total  
---------|---------|--------|-----
Spam|4/20|16/20|20
Not Spam|1/80|79/80|80  
Total|5/100|95/100|100  

The likelihood table reveals P(Virus=Yes|Spam) = 4/20 = 0.20. i.e 20% of the messages contain the term Virus, provided the message is spam.  
We can calculate P(Spam ∩ Virus) = P(Virus|Spam) x P(Spam) = 0.20 x 0.20 =.04 = 4% (i.e messages which are both Spam and contain the word Virus). We find it 4 times greater than our estimate for independent event.  

Now we calculate the probability of a message to be spam , if it contains the word "Virus", using Baye's equation :  
**P(Spam|Virus) = P(Virus=Yes|Spam) x P(Spam) / P(Virus)** = (0.20 x 0.20)/0.05 = .80 = 80%.  

## Classification with Naive Bayes:  

In addition to Virus, now there are more variables, money, groceries and unsubscribe.Below is the chart of spam and Not spam table with the following variables.  

Likelihood|Virus-Yes|Virus-No|Money-Yes|Money-No|Groceries-Yes|Groceries-No|Unsubscribe-Yes|Unsubscribe-No|Total  
---------|---------|--------|--------|---------|----------|----------|-----------|---------|--------------
Spam|4/20|16/20|10/20|10/20|0/20|20/20|12/20|8/20|20
Not Spam|1/80|79/80|14/80|66/80|8/80|71/80|23/80|57/80  
Total|5/100|95/100|24/100|76/100|8/100|91/100|35/100|65/100|100  
 
  
  
  
  
