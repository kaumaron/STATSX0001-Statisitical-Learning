# check working dir
getwd()

### vectors, date, matrices, subsetting
x <- c(2,7,5)
x

# using a sequence generator
y <- seq(from=4, length=3, by=3)
# seq help info
?seq
y

# operations
x+y
x/y
x^y

# Indexing/subsetting
x[2]
x[2:3]
x[-2]
x[-c(3,2)]

# matrices
z <- matrix(seq(1, 12), 4, 3)
z
# subsetting matrices
z[3:4, 2:3]
z[,2:3]
z[,1]
z[,1,drop=FALSE]
# dimension
dim(z)

# controls
# list vars
ls()
# remove vars
rm(y)

# generation of random data, graphics
# random uniform
x <- runif(50)
# random norm
y <- rnorm(50)

plot(x,y)
plot(x,y, xlab='Random Uniform', ylab='Random Normal', pch="*", col='blue')
par(mfrow=c(2,1))
plot(x,y)
hist(y)
par(mfrow=c(1,1))

# reading in data
Auto <- read.csv('../Data/Auto.csv')
# headers
names(Auto)
# data type
class(Auto)
# summary DataFrame data
summary(Auto)

# plot columns of list
plot(Auto$cylinders, Auto$mpg)
plot(Auto$cyl, Auto$mpg)

# attach
# The database is attached to the R search path.
# This means that the database is searched by R
# when evaluating a variable, so objects in the
# database can be accessed by simply giving their names.
?attach()
attach(Auto)

# search
# Gives a list of attached packages (see library),
# and R objects, usually data.frames.
?search()
search()
plot(cylinders, mpg)

# Factors
# The function factor is used to encode a vector 
# as a factor (the terms ‘category’ and ‘enumerated type’
# are also used for factors). If argument ordered is TRUE,
# the factor levels are assumed to be ordered.
cylinders = as.factor(cylinders)
