# set correct working directory
setwd('/Users/akdm/Documents/GitHub/STATSX0001-Statistical-Learning/Moving Beyond Linearity')
getwd()

load('7.R.RData')

# 7.R.R1
# Load the data from the file 7.R.RData, and plot it using plot(x,y).
# What is the slope coefficient in a linear regression of y on x (to within 10%)?

plot(x,y)
lr = lm(y~x)
summary(lr)$coefficients[2]

# 7.R.R2
# For the model y ~ 1+x+x^2, what is the coefficient of x (to within 10%)?

qm = lm(y ~ 1+x+I(x^2))
summary(qm)$coefficients[2]
