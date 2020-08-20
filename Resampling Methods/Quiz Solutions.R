# Chapter 5 - Resampling Methods

# set correct working directory
setwd('/Users/akdm/Documents/GitHub/STATSX0001-Statistical-Learning/Resampling Methods')
getwd()

# 5.R.R1
# Download the file 5.R.RData and load it into R using load("5.R.RData")
# Consider the linear regression model of y on X1 and X2.
# What is the standard error for beta_1?

load('5.R.RData')
# loads object Xy
View(Xy)

# y is regressed ib X1, X2
glm.fit <- glm(y~X1+X2, data=Xy)
summary(glm.fit)

# 5.R.R2
# Next, plot the data using matplot(Xy,type="l").
# Which of the following do you think is most likely given what you see?

matplot(Xy, type="l")
