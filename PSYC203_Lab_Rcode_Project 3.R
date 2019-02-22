# First, check working directory. then set working directory to the one you want:
getwd()
setwd("~/Desktop/R-Projects")  #remember to change backslashes to forward slashes or to double backslashes

#install pacman package then use pacman p_load() with double colons '::' to install and load necessary packages:
install.packages("pacman")
pacman::p_load(pastecs, dplyr)

#Load in dataset we created previously that includes the modified/recoded variables:
LabSurvey <- read.csv("203LabSurvey_Modified.csv")
View(LabSurvey)

#Recode example using recode() function from dplyr package:
help(recode)
LabSurvey$MajorRecode <- recode(LabSurvey$Major, 'Not Psychology Major or Minor' = '1', 'Psychology Minor' = '2', 'Psychology Major' = '3', .default = 'NA')

#Illustrate differences between groups for movie and stats scores using stat.desc with the by() function:
help(by)
by(LabSurvey$MovieTrivia, LabSurvey$MajorRecode, stat.desc) #here we state we want the movie trivia variable to be grouped by major recode variable with stat.desc as the function



### For the second part of project three you must load in another data set, saved on Google classroom under the Data section as PROJ3.csv
#For the project, you need to get the average exam score across 2 exams for PSYC students and non-PSYC students from the PROJ3 data set

#Load in data set and view
proj3 <- read.csv("PROJ3.csv")
View(proj3)

#use rowMeans() function to create new variable in the data frame that has the average score of the two exams for all rows
proj3$AverageExamScore <- rowMeans(proj3[ , c('EXAM1', 'EXAM2')]) #remember to leave it blank before the comma in the brackets to indicate you want ALL rows
proj3$AverageExamScore #view the new variable values to make sure it ran/was created correctly


#Boxplot of group scores:
boxplot(AverageExamScore ~ Major, data = proj3) # https://www.wellbeingatschool.org.nz/sites/default/files/W@S_boxplot-labels.png

#Table and plot of group mean scores:
GroupedMean <- proj3 %>% group_by(proj3$Major) %>% summarise(AverageScore = mean(AverageExamScore))
GroupedMean

plot(GroupedMean)

#Below we create a table to show the grouped mean scores for each exam so we can look at change from exam 1 to exam 2
GroupedMeansExams <- proj3 %>% group_by(proj3$Major) %>% summarise(EXAM1 = mean(EXAM1), EXAM2 = mean(EXAM2))
GroupedMeansExams

#To plot this we can simply enter in the values in the correct order using the plot() function as below:
#Plot exam scores for Non Psyc:
plot(c(33.4, 37), main = "NON PSYC", xlab = "Exam", ylab = "Average Score")

#Plot exam scores for Psyc:
plot(c(34.4, 38.1), main = "PSYC", xlab = "Exam", ylab = "Average Score")