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

# matricies
z <- matrix(seq(1, 12), 4, 3)
z
