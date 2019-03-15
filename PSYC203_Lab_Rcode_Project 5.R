#Set working directory! Make sure to do this every time you open R and include this at the top of every new R script/code
getwd()
setwd("~/Desktop/R-Projects")

#Install pacman so you can use it to quickly install and load other packages. We only need dplyr for this project.
install.packages("pacman")
pacman::p_load(dplyr)

#Read in the MODIFIED data set created previously that is saved in your working directory
LabSurvey <- read.csv("203LabSurvey_Modified.csv")
View(LabSurvey)

#changed to movietrivia
LabSurvey$MovieTrivia <- with(LabSurvey, A1+A2+A3+A4+A5+A6+A7+A8+A9+A10+A11+A12+A13+A14+A15)
LabSurvey$StatsEfficacy <- with(LabSurvey, (B1+B2+B3+B4+B5+B6+B7+B8+B9+B10+B11+B12+B13)/13)
#Now, I am going to use that new variable in my examples for the project below:

#First, you are giong to need to guess what will happen to the mean and SD if you add 3 to every score for Movie Trivia and Stats Efficacy
#I am going to use IIT satisfaction here to show you how to add 3 to every score in a variable and create a new variable with those scores:
LabSurvey$Movie_Add3 <- LabSurvey$MovieTrivia + 3
LabSurvey$Movie_Add3
LabSurvey$Stats_Add3 <- LabSurvey$StatsEfficacy + 3
LabSurvey$Stats_Add3

#below, I use the mean() and sd() functions to get the mean and SD.
#Make sure to include an argument at the end to remove missing or NA values if there are any or just to avoid getting an error
mean(LabSurvey$Movie_Add3, na.rm = TRUE)
sd(LabSurvey$Movie_Add3, na.rm = TRUE)
mean(LabSurvey$Stats_Add3, na.rm = TRUE)
sd(LabSurvey$Stats_Add3, na.rm = TRUE)

#Next, you need to multiply the original variable values by 3 and create a  new variable with those values as below:
LabSurvey$Movie_x3 <- LabSurvey$MovieTrivia * 3
LabSurvey$Movie_x3
LabSurvey$Stats_x3 <- LabSurvey$StatsEfficacy * 3
LabSurvey$Stats_x3

#Original
mean(LabSurvey$MovieTrivia, na.rm = TRUE)
sd(LabSurvey$MovieTrivia, na.rm = TRUE)
mean(LabSurvey$StatsEfficacy, na.rm = TRUE)
sd(LabSurvey$StatsEfficacy, na.rm = TRUE)

#Again, we can see the mean and SD using the functions below
mean(LabSurvey$Movie_x3, na.rm = TRUE)
sd(LabSurvey$Movie_x3, na.rm = TRUE)
#Again, we can see the mean and SD using the functions below
mean(LabSurvey$Stats_x3, na.rm = TRUE)
sd(LabSurvey$Stats_x3, na.rm = TRUE)

#Next, we are going to need to create a visual representation of the original and transformed variables
#One way to do this is to use box plots to see the median and general spread of the data
#You can also use histograms or graph out means and SDs, etc. 
#Because I want my table to include all tables and have names I am going to make a names object I can plug into the boxplot() function
MovieNames <- c("Movie", "Movie + 3", "Movie * 3")
StatsNames <- c("Stats", "Stats + 3", "Stats * 3")

boxplot(LabSurvey$MovieTrivia, LabSurvey$Movie_Add3, LabSurvey$Movie_x3, names = MovieNames, main = "MovieTrivia Variables")
boxplot(LabSurvey$StatsEfficacy, LabSurvey$Stats_Add3, LabSurvey$Stats_x3, names = StatsNames, main = "Stats Efficacy Variables")
