getwd()
setwd("~/Desktop/R-Projects")

#Make sure to open the file in excel and save as CSV with different name (ending in .csv) before trying to import!!!
Proj9 <- read.csv("PROJ9.csv")
View(Proj9)



########################## Regression ##############################
# Regression equation:
# Y = B0 + B1x
# Or ... Y = B0 + (B1 * x)
### Y = the estimated value of the outcome variable
### B0 = the intercept (constant): the expected mean value of Y when all predictors equal zero
### B1 = the slope: the numerical relationship between the predictor variables and the outcome
### x = predictor variable


#Compute linear regression predicting heart rate from body temperature:
lm(Heart.Rate ~ Body.Temp, data = Proj9)
#unfortunately, this doesn't tell us anything about significance or give us any other information...


#To see detailed information, you can assign it to an object and use the summary() function:
lmHeartRateByTemp <- lm(Heart.Rate ~ Body.Temp, data = Proj9)

#use sumary() function to get detailed information about model performance and coefficients:
summary(lmHeartRateByTemp)

### Intercept ###
#The Intercept value under Estimate is the "B0" value
#Remember... the intercept is the mean value of Y when all predictors = 0
#The intercept value here = -166.29

### Slope ###
#The value after Body.Temp is the "B1" value or slope
#The slope value here = 2.44
#The p value indicates it is significant...
#What does this tell you?

### Regression Equation ###
#we can plug these values into the regression equation
#To get a predicted heart rate for a body temp of 98.6
#Regression equation: Y = B0 + (B1 * x)
#[Estimated value of outcome variable] = [Intercept] + ([slope] * [Predictor])
-166.29 + (2.44*98.6)
#The result is 73.294
#Meaning that, based on this data set, the predicted heart rate for someone with a body temp of 98.6

########################## Regression with groups ##############################
#Now, we are going to run a regression predicting body temp from zombie status
#Currently, zombie status is coded as 1 for non-zombie and 2 for zombie
#To run the regression and appropriately compare the two groups we need to dummy code the zombie variable
#We can create a new variable with the recoded/dummy coded values using the ifelse() function:
Proj9$ZombieDummy <- ifelse(Proj9$Zombie == 1, 0, 1)
View(Proj9) # You can see it created a new variable with all non-zombies coded as 0 and 1
### For the regression, this means that the non-zpmbies are neutral and zombies are 1 (or an addition)
#Now, we run the regression with the dummy coded variable:
lmTempByZombie <- lm(HeartRate.Temp ~ ZombieDummy, data = Proj9)

lmHeartRateByZombieDummy <- lm(Heart.Rate ~ ZombieDummy, data = Proj9)

#Compute linear regression predicting heart rate from Zombie Status:
lm(Heart.Rate ~ ZombieDummy, data = Proj9)

#Use summary() to see details of object:
summary(lmHeartRateByZombieDummy)

74.15 + (-0.78 *1)
74.15 + (-0.78 *2)

#### Intercept ####
#The intercept = 98.39
#It is significant...
#Because the non-zombies are coded as zero... they are the reference group for the intercept
#Therefore, the intercept is the mean of Y (or mean body temp) for non-zombies

#### Slope ####
#The slope = -0.29
#It is significant...
#What does this tell you about the relationship between zombie status and body temperature?

#### Regression Equation ####
#Again, we can plug these values into the regression equation to predict body temperature for a zombie:
#Regression equation: Y = B0 + (B1 * x)
#[Estimated value of outcome variable] = [Intercept] + ([Slope] * [Predictor])
98.39 + (-0.29 *1)
#Our result is 98.1
#Meaning that, based on this data set, the estiated predicted mean body temperature for a zombie is 98.1
