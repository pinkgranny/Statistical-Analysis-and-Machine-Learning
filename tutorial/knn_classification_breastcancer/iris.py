# -*- coding: utf-8 -*-
"""
Created on Tue Jul 12 17:28:00 2016

@author: jishu
"""

import numpy as np;
from sklearn import datasets
from sklearn import cross_validation
from sklearn.linear_model import LinearRegression
from sklearn import svm
from sklearn.neighbors import KNeighborsClassifier
from sklearn.linear_model import LogisticRegression
from sklearn import metrics


iris = datasets.load_iris()
# iris.data.shape, iris.target.shape

#X_train , X_test,y_train,y_test = cross_validation.train_test_split(iris.data,iris.target,test_size=0.4)
#
##clf=LinearRegression()
#clf=svm.SVC(kernel='poly', C=1)
#clf.fit(X_train,y_train)
#accuracy = clf.score(X_test,y_test)
#
#print(accuracy)

X=iris.data
y=iris.target

#knn = KNeighborsClassifier(n_neighbors=1)
#knn = KNeighborsClassifier(n_neighbors=1)
#knn.fit(X,y)
#y_pred=knn.predict(X)
#print metrics.accuracy_score(y,y_pred)



#logreg= LogisticRegression()
#logreg.fit(X,y)
#
#y_pred=logreg.predict(X)
#
#print metrics.accuracy_score(y,y_pred)

from sklearn.cross_validation import train_test_split
X_train,X_test,y_train,y_test = train_test_split(X,y,test_size=0.4,random_state=3)
#random_state:pseudo-random number generator - random sampling
#logreg= LogisticRegression()
#logreg.fit(X_train,y_train)
#
#y_pred=logreg.predict(X_test)
#
#print metrics.accuracy_score(y_test,y_pred)

#knn = KNeighborsClassifier(n_neighbors=5)
#knn.fit(X_train,y_train)
 
#y_pred=knn.predict(X_test)

#print metrics.accuracy_score(y_test,y_pred)

#k= range(1,26)
#scores=[]
#for i in k:
#    knn = KNeighborsClassifier(n_neighbors=19)
#    knn.fit(X_train,y_train)
#    y_pred=knn.predict(X_test)
#    scores.append(metrics.accuracy_score(y_test,y_pred))
#    
#import matplotlib.pyplot as plt
#
#
#plt.plot(k,scores)
#plt.xlabel('Value of K for KNN')
#plt.ylabel('Testing Accuracy')
    
#from sklearn.cross_validation import KFold
#
#kf =KFold(25,n_folds=5,shuffle=False)
#
#print '{}{:^61}{}'.format('Iteration','Training set Observations','Testing Set Observation')
#for iteration,data in enumerate(kf,start=1):
#    print'{:^9}{}{:^25}'.format(iteration,data[0],data[1])
    
from sklearn.cross_validation import cross_val_score
#knn = KNeighborsClassifier(n_neighbors=5)
#scores = cross_validation.cross_val_score(knn,X,y,cv=10,scoring='accuracy')

k_range=range(1,31)
k_scores=[]
for k in k_range:
    knn = KNeighborsClassifier(n_neighbors=k)
    scores = cross_validation.cross_val_score(knn,X,y,cv=10,scoring='accuracy')
    k_scores.append(scores.mean())

print k_scores

import matplotlib.pyplot as plt

plt.plot(k_range,k_scores)
plt.xlabel('Value for KNN')
plt.ylabel('Cross-Validated-Accuracy')