####################
# Name: Silvia Jin #
# MATH 510 HW 04 ###
# Jin_Silvia_hw4.R #
####################

### Problem 01 ###

# a)
# Create the vector (1,2,3,...,19,20).
1:20

# b)
# Create the vector (20,19,...,2,1).
20:1

# c)
# Create the vecotr (1,2,3,...,19,20,19,18,...,2,1).
c(1:20,19:1)

# d)
# Create the vector (4,6,3) and assign it to the name tmp.
tmp <- c(4,6,3)

# result
tmp

# e)
# Create the vector (4,6,3,4,6,3,...,4,6,3) 
# where there are 10 occurrences of 4.
rep(c(4,6,3),10)

# f)
# Create the vector (4,6,3,4,6,3,...,4,6,3,4) 
# where there are 11 occurrences of 4.
rep(c(4,6,3),l=31)

# g)
# Create the vector(4,4,...,4, 6,6,...,6, 3,3,...,3) 
# where there are 10 occurrences of 4, 
# 20 occurrences of 6 and 30 occurrences of 3.
rep(c(4,6,3), times = c(10,20,30))

### Problem 02 ###
# Create a vecotr of the values of e^x cos(x)
# at x = 3,3.1,3.2,...,5.9,6.

# create a sequence of x, from 3, to 6, with steps of 0.1.
xs <- seq(3,6,0.1)
# calculate the equation of each entry in the list
vec02 <- exp(xs)*cos(xs)

# result
vec02

### Problem 03 ###
# a) 
# Create the vector (0.1^3*0.2^1, 0.1^6*0.2^4,...,0.1^36*0.2^34)

# First we create the two sequences of the exponents
exp01 <- seq(3,36,3)
exp02 <- seq(1,34,3)
# then we calculate the whole sequence
vec03a <- (0.1^exp01) * (0.2^exp02)

# result
vec03a

# b) 
# Create the vector (2,2^2/2,2^2/3,...,2^25/25)

# create the vector fo the sequence
exps <- seq(1,25)
# create the vector for the numerator
nums <- 2^exps
# create the vector for the denominator
den <- seq(1,25)
# calculate the result
vec03b <- nums/den

# result
vec03b

### Problem 04 ###
# a) 
# initialize a value 
ans04a <- 0
# use a for loop to add up the sum
for (i in seq(10,100)){
  ans04a <- ans04a + i^3 + 4*i^2
}

# Could also use (directly call sum):
# tmp <- 10:100
# ans04a <- sum(tmp^3+4*tmp^2)

# result
ans04a

# b)
# initialize a value 
ans04b <- 0
# use a for loop to add up the sum
for (i in seq(1,25)){
  ans04b <- ans04b + (2^i)/i + (3^i)/(i^2)
}

# could also use:
# tmp <- 1:25
# sum((2^tmp)/tmp+(3^tmp)/(tmp^2))

#result
ans04b

### Problem 05 ###
# a)
# Create the character vector 
# ("label 1", "label 2",...,"label 30").
paste("label", 1:30, sep = " ")

# b)
# Create the character vector 
# ("fn1", "fn2",...,"fn30").
paste("fn", 1:30, sep="")

### Problem 06 ###
set.seed(50)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)

# a) 
# Create the vector (y_2-x_1,...,y_n-x_(n-1))

# first create a null vector
vec10a <- numeric()
# then use a for loop to put in each value
for (i in seq(1,length(xVec)-1)){
  vec10a[i] <- yVec[i+1] - xVec[i]
}

# could also use:
# yVec[-1] - xVec[-length(xVec)]

# result
vec10a

# b)
# Create the vector (sin(y1)/cos(x2),sin(y2)/cos(x3),...,sin(y_n-1)/cos(x_n)).

# first create a null vector
vec10b <- numeric()
# then use a for loop to put in each value
for (i in seq(1,length(xVec)-1)){
  vec10b[i] <- sin(yVec[i])/cos(xVec[i+1])
}

# result
vec10b

# c)
# Create the vector (x_1+2x_2-x_3,x_(n-2)+2x_(n-1)-x_n).

# first create a null vector
vec10c <- numeric()
# then use a for loop to put in each value
for (i in seq(1,length(xVec)-2)){
  vec10c[i] <- xVec[i]+2*xVec[i+1]-xVec[i+2]
}

# result
vec10c

# d)
# Calculate the sum.

# first create an initial value
ans10d <- 0
# then use a for loop to add up the values
for (i in seq(1,length(xVec)-1)){
  ans10d <- ans10d +exp(-xVec[i+1])/(xVec[i]+10)
}

# result
ans10d

### Problem 07 ###
# a)
# Pick out the values in yVec which are >600.

# first create a null vector
ans07a <- numeric()
# then use a for loop to put in each value
for (num in yVec){
  if (num > 600){
    ans07a <- c(ans07a, num)
  }
}

# could also use:
# yVec[yVec>600]

# result
ans07a

# b)
# Get the index position in yVec of the values
# which are >600.

# first create a null vector
ans07b <- numeric()
# then use a for loop to put in each value
for (i in seq(1,length(xVec))){
  if (xVec[i]>600){
    ans07b <- c(ans07b,i)
  }
}

# result
ans07b

# c)
# What are the values in xVec which correspond to the values in yVec
# which are > 600? (By correspond, we mean at the same index
# positions.)

# first create a null vector
ans07c <- numeric()
# then use a for loop to put in each value
for (i in seq(1,length(yVec))){
  if (yVec[i]>600){
    ans07c <- c(ans07c,xVec[i])
  }
}

# could also use:
# xVec[yVec>600]

# result
ans07c

# d)
# Create the vector as in the instruction.

xMean <- mean(xVec)
ans07d <- sqrt(abs(xVec-xMean))

# could also use:
# sqrt(abs(xVec-mean(xVec)))
# result
ans07d

# e)
# How many values in yVec are within 200 of the maximum value of
# the terms in yVec?

yMax <- max(yVec)
# first create an initial value
ans07e <- 0
# then use a for loop to add up the values
for (num in yVec){
  if (num > yMax-200){
    ans07e <- ans07e + 1
  }
}

# could also use:
# sum(yVec>max(yVec)-200)

# result
ans07e

# f)
# How many numbers in xVec are divisible by 2? (Note that the mod
# operator is denoted %%.)

# first create an initial value
ans07f <- 0
# then use a for loop to add up the values
for (num in xVec){
  if (num%%2 == 0){
    ans07f <- ans07f + 1
  }
}

# could also use:
# sum(xVec%%2==0)

# result
ans07f

# g)
# Sort the numbers in the vector xVec in the order of increasing values
# in yVec.
indexes <- sort(yVec, index.return=TRUE)$ix
ans07g <- numeric()
# then use a for loop to put in each value
for (index in indexes){
  ans07g <- c(ans07g,xVec[index])
}

# could also use:
# xVec[order(yVec)]

# result
ans07g

# h)
# Pick out the elements in yVec at index positions 1,4,7,10,13,…

# first create a null vector
ans07h <- numeric()
# then use a for loop to put in each value
for (i in seq(1,250,3)){
  ans07h <- c(ans07h,yVec[i])
}

# could also use:
# yVec[c(T,F,F)]

# result
ans07h

### Problem 08 ###
# Calculate.

num08 <- cumprod(seq(2,38,2))
den08 <- cumprod(seq(3,39,2))
# first create an initial value
ans08 <- 1
# then use a for loop to add up the values
for (i in seq(1,19)){
  ans08 <- ans08 + num08[i]/den08[i]
}

# could also use:
# 1+sum(cumprod(seq(2,38,2)/seq(3,39,2)))

# result
ans08