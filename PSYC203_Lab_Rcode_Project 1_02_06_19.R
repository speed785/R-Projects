# First, check working directory. then set working directory to the one you want:
getwd()
setwd("/Volumes/FlashDrive/PSYC203_Spring_2019")  #remember to change backslashes to forward slashes or to double backslashes

#install pacman package then use pacman p_load() with double colons '::' to install and load necessary packages:
install.packages("pacman")
pacman::p_load(pastecs, dplyr)

#Load in dataset we created previously that includes the modified/recoded variables:
LabSurvey <- read.csv("203LabSurvey_Modified.csv")
#Note that this is the modified lab survey data that you should have if you ran the code from last lab
View(LabSurvey) # You can see it has the movie trivia and stats efficacy variables we created in it

#For my examples in the lab lecture I am going to use the IIT satisfaction data from the Lab Survey
#Because we did not already create a total score variable for the IIT satisfaction items I am going to create that variable
#You do not need to create this variable as you will be using the other variables we already created for your project assignments
#To create the variable, I am simply going to add all of the IIT items together to get a total score
LabSurvey$IITSatisfaction <- with(LabSurvey, IIT_1+IIT_2+IIT_3+IIT_4+IIT_5+IIT_6+IIT_7+IIT_8+IIT_9+IIT_10)
View(LabSurvey) #We can see the new variable was added to my data set

#To create a grouped histogram of the scores I can use the hist() function:
hist(LabSurvey$IITSatisfaction)
#This function automatically bins (groups) and creates breaks for the data
#In this case, it creates 6 groups each with a range of 5
#Looking at the grouped frequency distribution, it looks as if the data is relatively normally distributed with the majority of the values falling between 20 and 30

#Now, let's create an ungrouped histogram for the same variable using the hist() function:
#First, we need to look at the descriptive stats for the the variable to get the range of possible scores:
stat.desc(LabSurvey$IITSatisfaction) #we add the na.rm = TRUE argument to ensure that any missing values are removed. If you don't do this you will get an error or no values
#We have a low score of 12 and a high score of 37 and can see that there are 25 possible scores in the total range
#Now, if we want a histogram that includes a bin for every possible score we know it should have 25 bins
#To do this, we use the breaks argument of the hist() function and add 1 to the total number of possible scores (the range) to indicate that this is how many breaks we want in the data
hist(LabSurvey$IITSatisfaction, breaks = 26)
#This gives you an ungrouped histogram with a frequency for every single possible score
#Looking at this histrogram, it is clear the distribution isn't quiet as normal as we thought previously, possibly showing some negative skew but overall most scores are still clustered in the middle

#To obtain the raw score that corresponds to the 50th percentile:
#we can look at the descriptive stats as we did above or we can use either the median() or the quantile() functions:
stat.desc(LabSurvey$IITSatisfaction)
median(LabSurvey$IITSatisfaction, na.rm = TRUE) #we add the na.rm = TRUE argument to ensure that any missing values are removed. If you don't do this you will get an error or no values
quantile(LabSurvey$IITSatisfaction, na.rm = TRUE) 
#Because the median is the 50th percentile, the values are the same
#In this case, the median is also the mode (or the most frequent score) as you can see on the ungrouped frequency distribution (the score of 26 was obtained by 8 participants)