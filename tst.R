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