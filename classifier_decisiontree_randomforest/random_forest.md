# Random Forest  

* Random Forest(RF) is popular tree based classifier, which is based on decision tree.
* A decision tree is a straight forward if-then-else like diagram that combines individual attributes into a decision.
* Decision trees are easily trained to learn the data, but the problem of the decision trees they overlearn data, i.e the training data is memorized with poor ability to generalize.  
* With no restrictions, the decision tree will have one root leaf path per sample, which is essentially same as nearest neighbour.  
* Random forest avoids this by training many "imperfect" trees.
* Each tree is trained with a subset of samples and a subset of features, i.e  some of the attributes are hidden from the training.
* Random forest extract values at randomly selected coordinates.    
* After training many trees each with different samples and features, the RF predicts the class by taking the majority vote,i.e the most frequent label.  
* Collection of trees gives a natural way to estimate class probabilities: Proportion of trees voting for each class.  
* RF also includes a method for assessing feature importances: randomly shuffle each feature at a time and test how much the accuracy drops.  
* Losing an important feature drops the accuracy a lot.
* Shuffling non important feature doesnt change the result much.

