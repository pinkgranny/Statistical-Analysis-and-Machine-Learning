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




