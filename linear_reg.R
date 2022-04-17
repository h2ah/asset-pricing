
# Linear regression 

## generate x values 

x <- c(1:100)/100

# 100 error terms with mean zero and sd 1.2

e = rnorm(100, mean = 0, sd = 1.2)

# the linear model generates y as below for 
# true intercept 2.5 and true slope 1.9

y <- 2.5 + 1.9*x + e

# plot x and y

plot(x,y)

# add true line using points() fn

points(x, 2.5+1.9*x, col = "red", pch =20)

# run linear regression

myData <- data.frame(indep_var = x,dep_var = y)

# use lm() function

myResult <- lm(dep_var~indep_var, data = myData)

summary(myResult)


