#################################
## Silvia Jin
## math510 hw05
## Jin_Silvia_hw5.R
## 10/13/2016
#################################

# If the package is not installed yet on your computer
#install.packages('ggplot2')

library('ggplot2')

# The data that we use in this homework is diamonds.
# However, we could use any other data just be changing the line below.
data('diamonds')
myData <- diamonds
## Problem 01

# Print to the console all methods associated with data frame
methods(class=data.frame)

# Print to the console all attributes associated with a data frame.
attributes(myData)

# Determine the number of columns in a data frame.
ncol(myData)

## Problem 02

# Determine the number of rows in a data frame.
nrow(myData)

## Problem 03

# Extract the column names from a data frame.
names <- colnames(myData)

# Print the column names one per each line to the console.
cat(names,sep = '\n')

## Problem 04

# Determine the type of each column and print to the console.
lapply(myData,class)
# note that the lapply method prints the the console each column name with the type in a nice format

## Problem 05

# Loop through a data frame and calculate the mean of every numeric column.
lapply(myData[sapply(myData,is.numeric)],mean)
# note that the lapply method prints the column name with the column mean in a nice format

## Problem 06

# Loop through a data frame and create a frequency table for every factor column.
summary(myData[sapply(myData,is.factor)])

## Problem 07

# Loop through a data frame and determine the number of rows containing NA in each column.
lapply(as.data.frame(lapply(myData,is.na)),sum)

# Determine the percentage of rows containing an NA in any of the columns.
nrow(myData[rowSums(is.na(myData))>0,])/nrow(myData)

## Problem 08

pearCoef <- function(givenData){
  #' This function accepts a data frame as parameter and returns a data frame that 
  #' contains each pair of column names in the first column in a single string
  #' seperated by a '-', and their corresponding Pearson Correlation Coefficient 
  #' in the second column.
  #' @param givenData a data frame
  #' @return a data frame as described above
  numericData <- givenData[sapply(givenData,is.numeric)] # select the numeric cols and store into a new frame
  numericNames <- colnames(numericData)# extract the numeric col names
  pairNames <- c() # create a null vector to store the names later
  pairCoeffs <- c() # create a null vector to store the coeffs later
  l <- ncol(numericData) # store the number of cols, to be used in the for loop
  for (i in 1:(l-1)){ # looking at each numeric col
    for (j in (i+1):l){ # compare each numeric col with each numeric col after it (no repetation)
      pairNames <- c(pairNames,paste(numericNames[i],numericNames[j],sep='-')) # create the name of the pair and store it
      pairCoeffs <- c(pairCoeffs,cor(numericData[i],numericData[j],method="pearson")) # calculate the coeeff and store it
    }
  }
  return (data.frame(pairNames,pairCoeffs)) # return the newly generated data as a data.frame
}

# example
pearCoef(myData)


