# First, check working directory. then set working directory to the one you want:
getwd()
setwd("~/Desktop/R-Projects")  #remember to change backslashes to forward slashes or to double backslashes

#install pacman package then use pacman p_load() with double colons '::' to install and load necessary packages:
install.packages("pacman")
pacman::p_load(modeest, pastecs, dplyr)

#Load in dataset we created previously that includes the modified/recoded variables:
LabSurvey <- read.csv("203LabSurvey_Modified.csv")
#Note that this is the modified lab survey data that you should have if you ran the code from last lab
View(LabSurvey) # You can see it has the movie trivia and stats efficacy variables we created in it

#-------------
#Correct Answer A: Items = A4, A7, A11, A13
#Correct Answer B: Items = A3, A12, A14
#Correct Answer C: Items = A1, A5, A6, A8, A10, A15
#Correct Answer D: Items = A2, A9

#3-6 already done...(Just To Make Sure)
LabSurvey$MovieTriviascalescore <- with(LabSurvey, A1+A2+A3+A4+A5+A6+A7+A8+A9+A10+A11+A12+A13+A14+A15)
#Basically the MovieTrivia variable
View(LabSurvey) #We can see the new variable was added to my data set

#New variable that is average of all the stats efficacy items(B1 through B13)
LabSurvey$STATSEFFICACYscalescore <- with(LabSurvey, (B1+B2+B3+B4+B5+B6+B7+B8+B9+B10+B11+B12+B13)/13)
View(LabSurvey) #We can see the new variable was added to my data set
#-------------

#To create a grouped histogram of the scores I can use the hist() function:
hist(LabSurvey$MovieTriviascalescore)
#This function automatically bins (groups) and creates breaks for the data
#In this case, it creates 6 groups each with a range of 5
#Looking at the grouped frequency distribution, it looks as if the data is relatively normally distributed with the majority of the values falling between 20 and 30

#Now, let's create an ungrouped histogram for the same variable using the hist() function:
#First, we need to look at the descriptive stats for the the variable to get the range of possible scores:
stat.desc(LabSurvey$MovieTriviascalescore) #we add the na.rm = TRUE argument to ensure that any missing values are removed. If you don't do this you will get an error or no values

#To do this, we use the breaks argument of the hist() function and add 1 to the total number of possible scores (the range) to indicate that this is how many breaks we want in the data
hist(LabSurvey$MovieTriviascalescore, breaks = 15)
#This gives you an ungrouped histogram with a frequency for every single possible score
#Looking at this histrogram, it is clear the distribution isn't quiet as normal as we thought previously, possibly showing some negative skew but overall most scores are still clustered in the middle

hist(LabSurvey$STATSEFFICACYscalescore)
stat.desc(LabSurvey$STATSEFFICACYscalescore)
hist(LabSurvey$STATSEFFICACYscalescore, breaks = 4)


#To obtain the raw score that corresponds to the 50th percentile:
#we can look at the descriptive stats as we did above or we can use either the median() or the quantile() functions:
stat.desc(LabSurvey$MovieTriviascalescore)
median(LabSurvey$MovieTriviascalescore, na.rm = TRUE) #we add the na.rm = TRUE argument to ensure that any missing values are removed. If you don't do this you will get an error or no values
quantile(LabSurvey$MovieTriviascalescore, na.rm = TRUE) 

stat.desc(LabSurvey$STATSEFFICACYscalescore)
median(LabSurvey$STATSEFFICACYscalescore, na.rm = TRUE) 
quantile(LabSurvey$STATSEFFICACYscalescore, na.rm = TRUE)

#Because the median is the 50th percentile, the values are the same
#In this case, the median is also the mode (or the most frequent score) as you can see on the ungrouped frequency distribution

################################################
#####Continue for mode and random case pull#####
################################################
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