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


#1.) Find equation line and write
#   y = 98.24 + .109x
#2.) Correlation (r) between house price & square feet

#3.) r^2 and adjusted r^2

#4.) F statistic with p-value and df


#create two vectors of scores
x <- c(1400,1600,1700,1875,1100,1550,2350,2450,1425,1700)
y <- c(245,312,279,308,199,219,405,324,319,255)

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