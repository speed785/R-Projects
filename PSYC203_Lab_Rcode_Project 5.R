#Set working directory! Make sure to do this every time you open R and include this at the top of every new R script/code
getwd()
setwd("F:/PSYC203_Spring_2019")

#Install pacman so you can use it to quickly install and load other packages. We only need dplyr for this project.
install.packages("pacman")
pacman::p_load(dplyr)

#Read in the MODIFIED data set created previously that is saved in your working directory
LabSurvey <- read.csv("203LabSurvey_Modified.csv")
View(LabSurvey)

#I am going to again create a new IIT Satisfaction total score variable to use as an example:
LabSurvey$IITSatisfaction <- with(LabSurvey, IIT_1+IIT_2+IIT_3+IIT_4+IIT_5+IIT_6+IIT_7+IIT_8+IIT_9+IIT_10)

#Now, I am going to use that new variable in my examples for the project below:

#First, you are giong to need to guess what will happen to the mean and SD if you add 3 to every score for Movie Trivia and Stats Efficacy
#I am going to use IIT satisfaction here to show you how to add 3 to every score in a variable and create a new variable with those scores:
LabSurvey$IIT_Add3 <- LabSurvey$IITSatisfaction + 3
LabSurvey$IIT_Add3

#below, I use the mean() and sd() functions to get the mean and SD.
#Make sure to include an argument at the end to remove missing or NA values if there are any or just to avoid getting an error
mean(LabSurvey$IIT_Add3, na.rm = TRUE)
sd(LabSurvey$IIT_Add3, na.rm = TRUE)

#Next, you need to multiply the original variable values by 3 and create a  new variable with those values as below:
LabSurvey$IIT_x3 <- LabSurvey$IITSatisfaction * 3
LabSurvey$IIT_x3

#Again, we can see the mean and SD using the functions below
mean(LabSurvey$IIT_x3, na.rm = TRUE)
sd(LabSurvey$IIT_x3, na.rm = TRUE)

#Next, we are going to need to create a visual representation of the original and transformed variables
#One way to do this is to use box plots to see the median and general spread of the data
#You can also use histograms or graph out means and SDs, etc. 
#Because I want my table to include all tables and have names I am going to make a names object I can plug into the boxplot() function
IITNames <- c("IIT", "IIT + 3", "IIT * 3")

boxplot(LabSurvey$IITSatisfaction, LabSurvey$IIT_Add3, LabSurvey$IIT_x3, names = IITNames, main = "IIT Satisfaction Variables")
