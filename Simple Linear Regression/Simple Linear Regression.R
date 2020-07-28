# Chapter 3 Lab: Linear Regression

# Import data from Massachusetts data set and ISLR data
library(MASS)
library(ISLR)

# Simple Linear Regression

# display dataframe in R Data Editor
# skipped because it's unneccessary in reruns but good for EDA
# fix(Boston)

# display column names from dataframe (similar to df.columns)
names(Boston)
# more info on the df.
?Boston

# generate a linear model: regress median value on lower status
# lstat - lower status of the population (percent).
# medv - median value of owner-occupied homes in $1000s.
lm.fit=lm(medv~lstat)

# prior line didn't provide the data to the linear model function
lm.fit=lm(medv~lstat,data=Boston)

# attach df to make it searchable in the namespace
attach(Boston)
lm.fit=lm(medv~lstat)

# display the linear model's fit parameters
lm.fit

# display the linear model's fit parameters and statistics
summary(lm.fit)
### The values so lstat is significant
#Coefficients:
#            Estimate Std. Error    t value  Pr(>|t|)    
#(Intercept)   34.55384    0.56263   61.41   <2e-16 ***
#  lstat       -0.95005    0.03873  -24.53   <2e-16 ***

# get names of model components  
names(lm.fit)

# get model coefficients and confidence interval
coef(lm.fit)
confint(lm.fit)

# make predictions with the linear model
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="confidence")
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="prediction")

# plot lstat, medv scatter
plot(lstat,medv)
# add straight line of model with abline
abline(lm.fit)
# tweak line style
abline(lm.fit,lwd=3)
abline(lm.fit,lwd=3,col="red")

# tweak plot styles
plot(lstat,medv,col="red")
plot(lstat,medv,pch=20)
plot(lstat,medv,pch="+")

# display plot point styles
plot(1:20,1:20,pch=1:20)

# Set graph parameters to be a 2x2 set of subplots
par(mfrow=c(2,2))
plot(lm.fit)
plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

# Multiple Linear Regression

lm.fit=lm(medv~lstat+age,data=Boston)
summary(lm.fit)
lm.fit=lm(medv~.,data=Boston)
summary(lm.fit)

library(car)
# vif calculates variance-inflation and generalized
# variance-inflation factors for linear, generalized 
# linear, and other models.
vif(lm.fit)
lm.fit1=lm(medv~.-age,data=Boston)
summary(lm.fit1)
# Update and re-fit model call
lm.fit1=update(lm.fit, ~.-age)
summary(lm.fit1)

# Interaction Terms

summary(lm(medv~lstat*age,data=Boston))

# Non-linear Transformations of the Predictors

# add lstat^2
lm.fit2=lm(medv~lstat+I(lstat^2))
summary(lm.fit2)
lm.fit=lm(medv~lstat)
anova(lm.fit,lm.fit2)
par(mfrow=c(2,2))
plot(lm.fit2)
lm.fit5=lm(medv~poly(lstat,5))
summary(lm.fit5)
summary(lm(medv~log(rm),data=Boston))

# Qualitative Predictors

#fix(Carseats)
names(Carseats)
lm.fit=lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
summary(lm.fit)
attach(Carseats)
contrasts(ShelveLoc)
?contrasts

# Writing Functions

# not yet created
LoadLibraries
LoadLibraries()
# create a load libraries function that loads ISLR and MASS
LoadLibraries=function(){
  library(ISLR)
  library(MASS)
  print("The libraries have been loaded.")
}
# shows the function definition
LoadLibraries
# calls function
LoadLibraries()
