# Chapter 3 Lab: Linear Regression

# Import data from Massachusetts data set and ISLR data
library(MASS)
library(ISLR)

# Simple Linear Regression

# display dataframe in R Data Editor
fix(Boston)

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
  
names(lm.fit)
coef(lm.fit)
confint(lm.fit)
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="confidence")
predict(lm.fit,data.frame(lstat=(c(5,10,15))), interval="prediction")
plot(lstat,medv)
abline(lm.fit)
abline(lm.fit,lwd=3)
abline(lm.fit,lwd=3,col="red")
plot(lstat,medv,col="red")
plot(lstat,medv,pch=20)
plot(lstat,medv,pch="+")
plot(1:20,1:20,pch=1:20)
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
vif(lm.fit)
lm.fit1=lm(medv~.-age,data=Boston)
summary(lm.fit1)
lm.fit1=update(lm.fit, ~.-age)

# Interaction Terms

summary(lm(medv~lstat*age,data=Boston))

# Non-linear Transformations of the Predictors

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

fix(Carseats)
names(Carseats)
lm.fit=lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
summary(lm.fit)
attach(Carseats)
contrasts(ShelveLoc)

# Writing Functions

LoadLibraries
LoadLibraries()
LoadLibraries=function(){
  library(ISLR)
  library(MASS)
  print("The libraries have been loaded.")
}
LoadLibraries
LoadLibraries()