x <- c(4,5,12,10,10,7)
y <- c(19,11,18,10,12,14)

exlect <- data.frame(x, y)

qplot(x, y, data=exlect, geom = "point") 

qplot(x, y, data=exlect, geom = "point") +
  stat_smooth(method="lm")

reg <- lm(y ~ x, data=exlect)
summary(reg)
coefficients(reg)
confint(reg, level=0.95)
anova(reg) 
lm.beta(reg)
fitted(reg)

cor(exlect)

# independent 2-group t-test
t.test(y~x) # where y is numeric and x is a binary factor

# independent 2-group t-test
t.test(x,y) # where y1 and y2 are numeric

# paired t-test
t.test(x,y,paired=TRUE) # where y1 & y2 are numeric

# one sample t-test
t.test(y,mu=3) # Ho: mu=3

##########################################################part 2##########
z <- c(6, 8, 10, 6, 7, 13, 5, 5, 3)
exlect <- data.frame(z)

# one sample t-test
t.test(z,mu=3) # Ho: mu=3