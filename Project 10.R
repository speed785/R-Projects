getwd()
setwd()

install.packages("pacman")

### 10 A ###

#Make sure to open the file in excel and save aas CSV with different name (ending in .csv) before trying to import!!!!
Proj10A <- read.csv("PROJ10AFA18.csv") 
View(Proj10A)

#Independent samples t-test:
t.test(Proj10A$HtFt, Proj10A$HtBk)
#Remember: X is first, y is second

#Get standard deviations:
#make sure to address missing values with na.rm argument!
sd(Proj10A$HtFt, na.rm = TRUE)
sd(Proj10A$HtBk, na.rm = TRUE)

#Graph observed differences in means using plot() function:
#First, we create a t test object:
t_FtvsBk <- t.test(Proj10A$HtFt, Proj10A$HtBk)
#Then, we can plot the sample means (under sample estimates in t-test results) using that object
plot(t_FtvsBk$estimate, main = "Basketball & Football Mean Heights", x)


#### 10 B ####