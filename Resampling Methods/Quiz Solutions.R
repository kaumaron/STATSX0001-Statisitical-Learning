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

# There's a lot of autocorrelation in the data so SE(beta_1^hat) is too low


# 5.R.R3
# Now, use the (standard) bootstrap to estimate  𝑠.𝑒.(𝛽̂ 1) .
# To within 10%, what do you get?

require(boot)
?boot

# Function for bootstrap fit of beta_1
# 1 indexed?! (intercept, X1, X2)[2]
boot.fn <- function(data,index)
  return(coef(glm(y~X1+X2, data = data, subset = index))[2])

# test on first 100 datapoints
boot.fn(Xy, 1:100)

# compute 1000 bootstrap samples
boot(Xy ,boot.fn ,1000)

# 5.R.R4
# Finally, use the block bootstrap to estimate SE(beta_1).
# Use blocks of 100 contiguous observations, and resample 
# ten whole blocks with replacement then paste them together to 
# construct each bootstrap time series. For example, 
# one of your bootstrap resamples could be:
# new.rows = c(101:200, 401:500, 101:200, 901:1000, 301:400,
# 1:100, 1:100, 801:900, 201:300, 701:800)
# new.Xy = Xy[new.rows, ]
# To within 10%, what do you get?


# https://stat.ethz.ch/R-manual/R-devel/library/boot/html/tsboot.html
?tsboot

# beta_hat_1 from https://justinmshea.github.io/StatisticalLearning/articles/quiz-05-CV-Resampling-Methods.html#r-r4
# not sure why boot.fn doesn't work here.

# tsboot(Xy, boot.fn, sim='fixed', l=100, R=15000)

# Gives error:
#  Error in eval(substitute(subset), data, env) : 
# argument "index" is missing, with no default 


beta_hat_1 <- function(data, index, formula) {
  model <- lm(formula, data = data[index, ])
  summary(model)$coefficients[2, 1]
}
tsboot(Xy, beta_hat_1,formula = y~X1+X2, sim='fixed', l=100, R=15000)