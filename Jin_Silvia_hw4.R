### Problem 01 ###

# a)
c(1:20)

# b)
c(20:1)

# c)
c(1:20,19:1)

# d)
tmp <- c(4,6,3)

tmp

# e)

rep(c(4,6,3),10)

# f)

c(rep(c(4,6,3),10),4)

# g)
c(rep(4,10),rep(6,20),rep(3,30))

### Problem 02 ###
xs <- seq(3,6,0.1)
vec02 <- exp(xs)*cos(xs)

vec02

### Problem 03 ###
# a) 
exp01 <- seq(3,36,3)
exp02 <- seq(1,34,3)
vec03a <- numeric(24)
for (i in seq(1,12)){
  vec03a[i] <- 0.1^exp01[i]
  vec03a[2*i] <- 0.1^exp02[i]
}

vec03a

# b) 
exps <- seq(1,25)
nums <- 2^exps
den <- seq(1,25)
vec03b <- nums/den

vec03b

### Problem 04 ###
# a) 
ans04a <- 0
for (i in seq(10,100)){
  ans04a <- ans04a + i^3 + 4*i^2
}

ans04a

# b)
ans04b <- 0
for (i in seq(1,25)){
  ans04b <- ans04b + (2^i)/i + (3^i)/(i^2)
}

ans04b

### Problem 05 ###
# a)
paste("label", 1:30, sep = " ")

# b)
paste("fn", 1:30, sep="")

### Problem 06 ###
set.seed(50)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)

# a) 
vec10a <- numeric()
for (i in seq(1,length(xVec)-1)){
  vec10a[i] <- yVec[i+1] - xVec[i]
}

vec10a

# b)
vec10b <- numeric()
for (i in seq(1,length(xVec)-1)){
  vec10b[i] <- sin(yVec[i])/cos(xVec[i+1])
}

vec10b

# c)
vec10c <- numeric()
for (i in seq(1,length(xVec)-2)){
  vec10c[i] <- xVec[i]+2*xVec[i+1]-xVec[i+2]
}

vec10c

# d)
ans10d <- 0
for (i in seq(1,length(xVec)-1)){
  ans10d <- ans10d +exp(-xVec[i+1])/(xVec[i]+10)
}

ans10d

### Problem 07 ###
# a)
ans07a <- numeric()
for (num in yVec){
  if (num > 600){
    ans07a <- c(ans07a, num)
  }
}

ans07a

# b)
ans07b <- numeric()
for (i in seq(1,length(xVec))){
  if (xVec[i]>600){
    ans07b <- c(ans07b,i)
  }
}

ans07b

# c)

ans07c <- numeric()
for (i in seq(1,length(yVec))){
  if (yVec[i]>600){
    ans07c <- c(ans07c,xVec[i])
  }
}

ans07c

# d)
xMean <- mean(xVec)
ans07d <- sqrt(abs(xVec-xMean))

# e)
yMax <- max(yVec)
ans07e <- 0
for (num in yVec){
  if (num > yMax-200){
    ans07e <- ans07e + 1
  }
}

ans07e

# f)
ans07f <- 0
for (num in xVec){
  if (num%%2 == 0){
    ans07f <- ans07f + 1
  }
}

ans07f

# g)
indexes <- sort(yVec, index.return=TRUE)$ix
ans07g <- numeric()
for (index in indexes){
  ans07g <- c(ans07g,xVec[index])
}

ans07g

# h)
ans07h <- numeric()
for (i in seq(1,250,3)){
  ans07h <- c(ans07h,yVec[i])
}

ans07h

### Problem 08 ###
num08 <- cumprod(seq(2,38,2))
den08 <- cumprod(seq(3,39,2))
ans08 <- 1
for (i in seq(1,19)){
  ans08 <- ans08 + num08[i]/den08[i]
}

ans08