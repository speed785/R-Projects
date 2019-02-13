library(MASS)
require(graphics)

user <- WWWusage #give exam scores a new variable name
exam.freq <- transform(table(exam)) #transform exam scores into a freq table

examscores <-(WWWusage$Results) #the $ indicates the variable of interest
bins <- seq(25.5, 95.5, by=10) #to group data, bins it by 10 units with range 
scores <- cut(examscores, bins, right=FALSE) #dividing the scores
freq <- table(scores) #put the frequencies in a table 
cumulativefreq <- cumsum(freq) #cumulative frequency 
cbind(freq, cumulativefreq) #put frequency and cumulative frequency together 

transform(table(scores)) #turning the table vertically

hist(WWWusage$Results, breaks = 62, xlim=c(20, 90)) #ungrouped histogram
hist(WWWusage$Results) #creating histogram of the variable 

#normal distribution 
x <- seq(5, 15, length=1000)
y <- dnorm(x, mean=10, sd=3)
plot(x, y, type="l", lwd=1)


hist(users(10000,5,2))
hist(users(10000,2,5))
hist(users(10000,5,5))


