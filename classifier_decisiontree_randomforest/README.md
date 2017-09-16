# Decision Tree : Divide and Conquer Method  

Decision learners are powerful classifiers,it uses tree structure to model the relationship.It starts with a **root node**, where it is passed through the **decision nodes**, where the decisions are made based on the condition provided at that instance.These choices split the data across branches that indicate potential outcomes of a decision, depicted here as yes or no outcomes, though in some cases there may be more than two possibilities.The tree is terminated by leaf nodes (also known as terminal nodes) that denote the action to be taken as the result of the series of decisions. In the case of a predictive model, the leaf nodes provide the expected result given the series of events in the tree.  
Decision trees are flow-chart based model,after the model is created, the output is readable as yes/no decision making format.Still this model has some pros-cons:  

**Pros :**  
  * Credit scoring models in which the criteria that causes an applicant to be rejected need to be clearly documented and free from bias.  
  * Marketing studies of customer behavior such as satisfaction or churn, which will be shared with management or advertising agencies.  
  
  * Diagnosis of medical conditions based on laboratory measurements, symptoms, or the rate of disease progression.  

**Cons :**
 * When data has wide range of nominal features or large number of numeric features it cannot fit into the problem.  
 
 * The case results in wide number of decisions, and overly complex trees.
 
 * Overfitting of data

Decision trees are built using a heuristic called **recursive partitioning**. This approach is also commonly known as **divide and conquer** because it splits the data into subsets, which are then split repeatedly into even smaller subsets, and so on and so forth until the process stops when the algorithm determines the data within the subsets are sufficiently homogenous, or another stopping criterion has been met.  

![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_decisiontree_randomforest/decisiontree.JPG)  

In the above diagram it is clearly shown how decision tree works,the decision tree selects features, in the above case, it selects the feature *salary* , it chooses features most predictive of the target class. If the salary is higher than 50k,he accepts else rejects. The next feature he selects is commuting time.If it is less than 1hr -> accept, more -> reject.Offers free coffee -> accept , else reject.Working down each branch, the algorithm continues to divide and conquer the data,choosing the best candidate feature each time to create another decision node, until a stopping criterion is reached.  

## Classifying Movie with Decision tree - divide and conquer method:  

For instance we have 3 categories of films, **critical success,mainstream hit,boxoffice hit** .Now the classification of the films depends on our variables in x and y axis.  
![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_decisiontree_randomforest/movie_plot.JPG)  

x-axis : estimated budget($) , y-axis : list of celebrities. Based on budget and list of A celebrities, the type of movie is categorized.

![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_decisiontree_randomforest/split.JPG)  

Above plot shows, how types of movie can be splitted in 3 sections based on features, movies which are mostly box office bust, don't really have A celebrities , whereas movies with critical success have A celebrities but doesn't have a budget.Box office hits have both A celebrities as well as high budgets.

![alt text](https://github.com/jishu1989/MachineLearning/blob/master/classifier_decisiontree_randomforest/decision_movie.JPG)  

The above decision tree shows how the movies can be categorized based on these two features : budget and celebrity list.













