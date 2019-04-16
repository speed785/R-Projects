#Packages installed: ggplot2, psych, Quantpysc

#install pacman
install.packages("pacman")
pacman::p_load(dplyr)

install.packages("lm.beta")
library(ggplot2)
install.packages("ggplot2")
library(lm.beta)
install.packages("psych")
library(psych)
install.packages("QuantPsyc")
library(QuantPsyc)

#recreate information from lecture slides
#create two vectors of scores
x <- c(1, 3, 5)
y <- c(2, 2, 5)

#combine vectors into a single dataframe
exlect <- data.frame(x, y)

#scatterplot of points
qplot(x, y, data=exlect, geom = "point") 

#line of best fit
qplot(x, y, data=exlect, geom = "point") +
  stat_smooth(method="lm")

#compute a regression line
reg <- lm(y ~ x, data=exlect)
summary(reg)
coefficients(reg)
confint(reg, level=0.95)
anova(reg) 
lm.beta(reg)
fitted(reg)

cor(exlect)

reg2 <- lm(x ~ y, data=exlect)
summary(reg2)
coefficients(reg2)
confint(reg2, level=0.95)
anova(reg2) 
lm.beta(reg2)
fitted(reg2)

cor(exlect)

#recreate information from lecture slides
#create two vectors of scores
m <- c(10, 32, 25, 31, 18)
n <- c(230, 422, 305, 405, 200)

#combine vectors into a single dataframe
ex2 <- data.frame(m, n)

#scatterplot of points
qplot(m, n, data=ex2, geom = "point") 

#line of best fit
qplot(m, n, data=ex2, geom = "point") +
  stat_smooth(method="lm")

#compute a regression line
reg3 <- lm(n ~ m, data=ex2)
summary(reg3)
coefficients(reg3)
confint(reg3, level=0.95)
anova(reg3) 
lm.beta(reg3)
fitted(reg3)

cor(ex2)