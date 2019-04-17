#Packages installed: ggplot2, psych, Quantpysc

#Install then select by running library(...)
install.packages("lm.beta")
install.packages("ggplot2")
install.packages("psych")
install.packages("QuantPsyc")
library(QuantPsyc)
library(psych)
library(lm.beta)
library(ggplot2)

#########################
##Questions and Answers##
#########################
#1.) Find equation line and write
#   y = 98.24 + .109x
#2.) Correlation (r) between house price & square feet
#             x         y
#     x 1.0000000 0.7621137
#     y 0.7621137 1.0000000
#3.) r^2 and adjusted r^2
#   r^2 = 0.5808 & adjusted r^2 = 0.5284
#4.) F statistic with p-value and df
#   11.08 on 1 and 8 df , the p-value is 0.01039



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