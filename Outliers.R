#install packages: ggplot2, psych, pastecs, car

#label dataframe
festival = read.csv("/Users/jennifermiller/Desktop/R Data Files/DownloadFestival.csv", header = TRUE)


#produce a histogram of Day 1 data
festivalhist <- ggplot(festival, aes(day1)) 
festivalhist + geom_histogram(binwidth = 0.4)+ labs(x = "Hygiene (Day 1 of Festival)", y = "Frequency")

#Convert gender from numeric to a factor variable
festival$gender <- as.factor(festival$gender)

#produce a boxplot of Day 1 data
festivalboxplot <- ggplot(festival, aes(gender, day1))
festivalboxplot + geom_boxplot() + labs(x = "Gender", y = "Hygiene (Day 1 of Festival)")

#Identify the specific case
festival <- festival[order(festival$day1),]
options(max.print=100000)
festival


#generate z-scores to identify outliers
scale(festival$day1, center = TRUE, scale = TRUE)

#correct the data entry error responsible for the outlier
festival[810, 3] = 2.02

#create an updated histogram and boxplot
festivalhist <- ggplot(festival, aes(day1)) 
festivalhist + geom_histogram(binwidth = 0.4)+ labs(x = "Hygiene (Day 1 of Festival)", y = "Frequency")
festivalboxplot <- ggplot(festival, aes(gender, day1))
festivalboxplot + geom_boxplot() + labs(x = "Gender", y = "Hygiene (Day 1 of Festival)")

#create histogram with normal curve
hist.day1 <- ggplot(festival, aes(day1)) + 
geom_histogram(aes(y = ..density..), colour = "black", fill = "white") + labs(x = "Hygiene score on Day 1", y = "Density") + 
stat_function(fun = dnorm, args = list(mean = mean(festival$day1, na.rm = TRUE), sd = sd(festival$day1, na.rm = TRUE)), colour = "black", size =1)
hist.day1

#create a Q-Q plot
qqplot.day1 <- qplot(sample = festival$day1, stat = "qq")
qqplot.day1

#quantify normality with numbers and significance tests
stat.desc(festival$day1, basic = FALSE, norm = TRUE)

#Another way to get the shapiro-wilk test
shapiro.test(festival$day1)

#descriptive statistics by grouo
by(data = festival$day1, INDICES = festival$gender, FUN = stat.desc)

#test for equality of variance across groups (using car package)
leveneTest(festival$day1, festival$gender)

#log transform data
festival$logday1 <- log(festival$day1)
hist.logday1 <- ggplot(festival, aes(festival$logday1)) + 
  geom_histogram(aes(y = ..density..), colour = "black", fill = "white") + labs(x = "Hygiene score on Day 1", y = "Density") + 
  stat_function(fun = dnorm, args = list(mean = mean(festival$logday1, na.rm = TRUE), sd = sd(festival$logday1, na.rm = TRUE)), colour = "black", size =1)
hist.logday1

#square root transform data
festival$sqrtday1 <- sqrt(festival$day1)
hist.sqrtday1 <- ggplot(festival, aes(festival$sqrtday1)) + 
  geom_histogram(aes(y = ..density..), colour = "black", fill = "white") + labs(x = "Hygiene score on Day 1", y = "Density") + 
  stat_function(fun = dnorm, args = list(mean = mean(festival$sqrtday1, na.rm = TRUE), sd = sd(festival$logday1, na.rm = TRUE)), colour = "black", size =1)
hist.sqrtday1

#reciprocal transform data
festival$recday1 <- 1/(festival$day1)
hist.recday1 <- ggplot(festival, aes(festival$recday1)) +
  geom_histogram(aes(y = ..density..), colour = "black", fill = "white") + labs(x = "Hygiene score on Day 1", y = "Density") + 
  stat_function(fun = dnorm, args = list(mean = mean(festival$recday1, na.rm = TRUE), sd = sd(festival$recday1, na.rm = TRUE)), colour = "black", size =1)
hist.recday1

#look at raw scores
festival$day1

#Winsorize data (top and bottom 5%)
winsor(festival$day1, trim = .05,  na.rm = TRUE)

#Trim data (top and bottom 5%)
Trim(festival$day1, trim = 0.05, na.rm = TRUE)
