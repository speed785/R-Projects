# First, check working directory. then set working directory to the one you want:
getwd()
setwd("F:/PSYC203_Spring_2019")  #remember to change backslashes to forward slashes and to have the file path in quotes

#install pacman package then use pacman p_load() with double colons '::' to install and load necessary packages:
install.packages("pacman")
pacman::p_load(modeest, pastecs, dplyr)

#Load in dataset we created previously that includes the modified/recoded variables:
LabSurvey <- read.csv("203LabSurvey_Modified.csv")
View(LabSurvey)

#Use stat.desc() function from the pastecs package to get descriptive statistics for each variable
stat.desc(LabSurvey$MovieTrivia) 
#We can see in my example variable that the mean (average) score is 25.52 and the median (50th percentile value) is 26
#We can also see that the range is 25, the variance is 31.97, and the standard deviation is 5.66 
#(variance is calculated by summing the squared difference between each data point and the mean and dividing that value by the number of data points minus 1)
#(the standard deviation is the square root of the variance)

#The desc.stat() function gives you everything you need for the project except for the mode
#R does not have a base function that allows you to get the mode so there are two routes to go about doing this:

#1. You can use the mlv() function from the modeest package in the same way you used the stat.desc() function above
mlv(LabSurvey$MovieTrivia) #mlv stands for most likely value -- the mode is the most frequent value
#(doesn't work)

#Because the modeest package is current creating an error on my device, I can show you one other way to get the mode in R
#This way involves creating your own (user) function and then applying that to the variable you want the mode of:
#Here we create the function using the function(), unique(), which.max(), tabulate(), and match() functions and call it 'getmode':
getmode <- function(v) {
    uniqv <- unique(v)
    uniqv[which.max(tabulate(match(v, uniqv)))]
}
#Above, we use 'v' to represent 'vector' or 'variable'. The letter you use is not important as this is just creating the function
#Now that we have the function, we can use it to get the mode of the specific variable we want the mode of:
result <- getmode(LabSurvey$MovieTrivia)
print(result)
result <- getmode(LabSurvey$StatsEfficacy)
print(result)
#Here we can see that the mode is 10 and this is also what we saw when we looked at the ungrouped histogram of this variable last week


#Now, I want to drop a single random case from the data and see what happens to the mean and standard deviation
#I am going to guess that they will both stay relatively the same because there are over 50 participants on the survey but I don't know what will happen because there is a pretty big range of scores
#To drop the case I can use the ever-useful brackets and assign that back to the dataset (this won't change your saved data set, just the set have loaded into R for this session!)
LabSurvey <- LabSurvey[-29, ]
#notice that I put '-' then a random number between 1 and the number of participants and then a comma with a space after it to indicate I want all columns and every row except row 29
stat.desc(LabSurvey$MovieTrivia)
stat.desc(LabSurvey$StatsEfficacy)