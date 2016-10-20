#########################
## Silvia Jin
## math510 hw6
## Jin_Silvia_HW6.R
## 
##########################

require('ggplot2')
require('grid')
data('diamonds')


## Problem 2
# Create a simple scatter plot of Weight ("Carat") and Price using Color (the)
# "Color" column in the diamonds dataframe) as a facet. 
ggplot(diamonds, aes(x = carat, y =price, colour = factor(color))) +
  geom_point() +
  xlab("Weight") + 
  ylab("Price") + 
  ggtitle("Diamonds-Weight to Price by Color") + 
  theme(plot.title = element_text(size = rel(2), colour = "blue")) 


## Problem 3
# Remove the non-linearity and replot. Add the transformed columns to the dataframe and replot.
diamonds$logcarat <- log(diamonds$carat)
diamonds$logprice <- log(diamonds$price)
ggplot(diamonds, aes(x = logcarat, y = logprice, colour = factor(color))) +
  geom_point() +
  xlab("Weight") + 
  ylab("Price") + 
  ggtitle("Diamonds-Weight to Price (Linear)") +
  theme(plot.title = element_text(size = rel(2), colour = "blue")) 


## Problem 4
# Remove the linear trend (create a linear model and use the transformed weight
# on the x-axis and the residuals on the y-axis). If there is a relationship that can be modeled
# with a linear regression model, then the residuals should be randomly distributed. The
# resulting plot visually indicaes htere is possibly some heteroscedasticity to manage.
linear_model <- lm(logprice~logcarat, diamonds) 
ggplot(diamonds, aes(x=logcarat, y=resid(linear_model), colour = factor(color))) +
  geom_point() +
  xlab("Weight") + 
  ylab("Price Residuals") + 
  ggtitle("Diamonds-Weight to Price by Color") +
  theme(legend.position = 'top',legend.box = 'horizontal',
        plot.title = element_text(size = rel(2), colour = "blue"))


## Problem 5
# Use the grid package to create the following overlay of three plots. The
# histogram on the bottom left is a density hitogram of the price and the histogram on the 
# uppter right is a density histogram of carat. One way to create this plot is using viewports.
linear_model <- lm(logprice~logcarat, diamonds) 

# Create the main plot.
p1 <- ggplot(diamonds, aes(x=logcarat, y=resid(linear_model), colour=factor(color)))+
  geom_point() + 
  xlab("Weight") + 
  ylab("Price Residuals") + 
  ggtitle("Diamonds-Weight to Price by Color") +
  theme(
    legend.position = 'top',
    plot.title = element_text(size = rel(2), colour = "blue")
  )


# Create the density histogram of the carat
p2 <- ggplot(diamonds, aes(carat, colour = color)) +
  geom_histogram(aes(y = ..density..),binwidth = 0.05) +
  xlab(NULL) + 
  ylab(NULL) + 
  theme(
    legend.position = "none",
    axis.title.x = element_text(vjust=-0.35),
    axis.title.y = element_text(vjust=0.35)
  )

# Create the density histogram of the price
p3 <- ggplot(diamonds, aes(price, fill = color)) +
  geom_histogram(aes(y = ..density..),binwidth = 100) +
  xlab(NULL) + 
  ylab(NULL) + 
  theme(
    legend.position = 'none',
    axis.title.x = element_text(vjust=-0.35),
    axis.title.y = element_text(vjust=0.35)    
  )

# Use viewports for p2 and p3 overlapping on p1.
v1 <- viewport(width = 0.35, height = 0.3, x = 0.8, y = 0.6)
v2 <- viewport(width = 0.3, height = 0.2, x = 0.2, y = 0.2)
print(p1)
print(p2, vp = v1)
print(p3, vp = v2)